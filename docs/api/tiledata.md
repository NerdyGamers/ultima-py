# `ultimapy.sdk.tile_data`

Tile data for land and static items from `tiledata.mul`.

## Autoloading

`TileData.load()` is invoked when the module is imported via the SDK. If
`tiledata.mul` is not present, the loader returns early and the internal tables
remain empty.

## Key attributes

- `TileData.land_data` – land tiles
- `TileData.item_data` – item tiles
- `TileData.height_table` – per-item height data
