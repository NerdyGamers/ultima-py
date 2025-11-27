# `ultimapy.sdk.art`

Access and render static and land art from `art.mul` and related files.

## Autoloading

On first import, `Art.load()` is invoked to initialise indices. In environments
where `artidx.mul` is missing, the loader will no-op so that imports still work.

## Key attributes and methods

- `Art.get_static(item_id: int) -> PIL.Image.Image`  
  Return a Pillow image for the given static art id.

- `Art.get_land(tile_id: int) -> PIL.Image.Image`  
  Return a Pillow image for the given land tile id.
