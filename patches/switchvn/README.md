# SwitchVN Wine patches

These patches are maintained by SwitchVN and are intentionally kept separate
from the upstream GE video-rework series. The preparation scripts apply the
complete `ge-video-rework` directory first, then apply this directory in
filename order.

- `0023-winedmo-envideo-hardware-video-decoding.patch`:
  Tegra envideo hardware video decoding.
- `0024-directshow-stream-shutdown-lifecycle.patch`:
  DMO wrapper and WM reader allocator lifecycle fixes for safe video stop/skip.
- `0025-directshow-colour-mpeg-video-compatibility.patch`:
  `CLSID_Colour`, MPEG video format recovery, concrete downstream type
  negotiation, and complete MP1/MP2 DirectShow audio media types.
- `0026-winedmo-hevc-media-foundation-decoder.patch`:
  Media Foundation H.265/HEVC decoder registration backed by winedmo and
  envideo.
- `0027-wmp-embed-directshow-video-window.patch`:
  Balanced WMP ActiveX in-place activation lifetime and embedded DirectShow
  video-window ownership, sizing, visibility, and cleanup.
- `0028-wmp-support-iwmpplayer2-and-properties.patch`:
  Complete `IWMPPlayer2` compatibility for AxInterop.WMPLib, including the
  extended vtable, persisted presentation properties, open/play state, and
  close behavior used during AxHost initialization.
- `0029-wmp-use-logarithmic-volume-scaling.patch`:
  Convert WMP's 0--100 volume level to DirectShow's logarithmic decibel scale
  so normal application volume levels remain audible.
- `0030-quartz-prefer-directdraw-blit-for-vmr7-yuv.patch`:
  Present VMR7's already converted RGB32 video surface through DirectDraw and
  retain `StretchDIBits` only as a compatibility fallback.
- `0031-quartz-reuse-vmr7-yuv-chroma-calculations.patch`:
  Reuse YUV 4:2:0 chroma contributions across each 2x2 pixel block and compute
  the shared luma term only once per output pixel.
- `0032-quartz-add-sse2-ssse3-vmr7-yuv-conversion.patch`:
  Convert VMR7 NV12 and YV12 frames eight pixels at a time with SSE2, using
  SSSE3 shuffles for interleaved NV12 chroma and scalar code for edge fallback.
- `0033-quartz-avoid-cross-thread-window-destroy-deadlock.patch`:
  Tear down video renderer windows asynchronously when the final filter release
  runs outside the window thread, and dispatch synchronous sent messages while
  waiting for the last threaded graph worker to exit, avoiding both teardown
  deadlock directions during an early video exit.
- `0034-winedmo-fix-wow64-demuxer-destroy-params.patch`:
  Pass the correct parameter layout through the WoW64 demuxer destroy thunk so
  32-bit games release ASF demuxers instead of dereferencing a null handle.
