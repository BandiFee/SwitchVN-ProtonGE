#!/bin/bash

# patch functions
apply_patch() {
    local patch_path="$1"
    if ! patch --batch -Np1 < "$patch_path"; then
        echo "FAILED to apply $patch_path" >&2
        exit 1
    fi
}

apply_all_in_dir() {
    local dir="$1"
    for patch in "$dir"/*.patch; do
        apply_patch "$patch"
    done
}


### (2) WINE PATCHING ###

    pushd wine
    git reset --hard HEAD
    git clean -xdf

    git revert --no-commit e813ca5771658b00875924ab88d525322e50d39f

    echo "WINE: -WINEOPENXR- copy files into wine"
    mkdir -p dlls/wineopenxr
    cp -R ../wineopenxr/* dlls/wineopenxr/

### (2-5) WINE HOTFIX/BACKPORT SECTION ###

    # Separate OpenXR steam reliance
    # https://github.com/GloriousEggroll/proton-ge-custom/issues/214
    echo "WINE: -PENDING- add OpenXR patches"
    apply_patch "../patches/wine-hotfixes/pending/0001-decouple-wineopenxr-from-steamvr-and-integrate-it-in.patch"

    echo "WINE: -HOTFIX- Implement GE-Proton ffmpeg + winedmo only video playback rework patches"
    apply_all_in_dir "../patches/ge-video-rework/"

    echo "WINE: -SWITCHVN- Apply SwitchVN compatibility patches"
    apply_all_in_dir "../patches/switchvn/"

    if ! grep -Fq "CLSID_Colour" dlls/qasf/qasf_main.c \
            || ! grep -Fq "mpeg_video_codec_get_sequence_format" dlls/winedmo/quartz_transform.c \
            || ! grep -Fq "!format->bmiHeader.biWidth || !format->bmiHeader.biHeight" dlls/winedmo/quartz_transform.c \
            || ! grep -Fq "mpeg1_wave_format_from_codec_params" dlls/winedmo/unix_media_type.c \
            || ! grep -Fq "CLSID_MSH265DecoderMFT" dlls/msmpeg2vdec/msmpeg2vdec.c; then
        echo "FAILED: SwitchVN media compatibility patch sentinel is missing" >&2
        exit 1
    fi


    echo "WINE: RUN AUTOCONF TOOLS/MAKE_REQUESTS"
    autoreconf -f
    ./tools/make_requests

    popd



### END PROTON-GE ADDITIONAL CUSTOM PATCHES ###
### END WINE PATCHING ###
