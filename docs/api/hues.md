# `ultimapy.sdk.hues`

Hue tables and color manipulation based on `hues.mul`.

## Autoloading

`Hues.load()` is called on import. If `hues.mul` is missing, the loader returns
early and leaves the internal hue table empty, allowing imports to succeed.

## Key concepts

- `Hue` – individual hue entries
- `Hues.HUES` – dictionary of loaded hue objects, keyed by hue id
