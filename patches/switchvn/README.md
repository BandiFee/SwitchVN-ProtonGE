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
