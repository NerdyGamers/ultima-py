# `ultimapy.sdk.ascii_font`

ASCII font rendering from `fonts.mul`.

The loader will skip initialisation if `fonts.mul` is not present, which is the
case in CI / test environments.

## Concepts

- `ASCIIFont` – holds glyph images and metrics per font.
