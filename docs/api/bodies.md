# `ultimapy.sdk.bodies`

Body conversion and body table utilities reading from `Body.def` and
`Bodyconv.def`.

## Classes

- `BodyConverter` – provides `convert`, `contains` and `get_true_body` helpers.
- `BodyTable` – maps body ids with hue overrides.

In environments where `Body.def` / `Bodyconv.def` are missing, the loaders return
early and leave tables empty.
