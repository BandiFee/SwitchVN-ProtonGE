# SwitchVN Wine patches

These patches are maintained by SwitchVN and are intentionally kept separate
from the upstream GE video-rework series. The preparation scripts apply the
complete `ge-video-rework` directory first, then apply this directory in
filename order.

- `0023`: Tegra envideo hardware video decoding.
- `0024`: qasf DMO wrapper allocator decommit lock ordering.
- `0025`: WM reader decommitted allocator end-of-stream handling.
- `0026`: DirectShow `CLSID_Colour` converter compatibility.
- `0027`: MPEG sequence-header recovery for zero-size video formats.
