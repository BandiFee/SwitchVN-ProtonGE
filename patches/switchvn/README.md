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
