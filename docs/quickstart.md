# Quickstart

This section shows how to point UltimaPy at a Ultima Online client install and
perform a few basic operations.

## Configure the client path

UltimaPy needs to know where your Ultima Online client files live.

You can configure this via environment variable:

```bash
export ULTIMA_FILES_DIR="C:\Games\Ultima Online"
```

Or from Python at runtime:

```python
from ultimapy.settings import set_ultima_files_dir

set_ultima_files_dir(r"C:\Games\Ultima Online")
```

In test and CI environments, UltimaPy will **gracefully skip loading** client data
if the files are not present. Importing `ultimapy` will still succeed.

## Basic example: load an art tile and save as PNG

```python
from ultimapy.settings import set_ultima_files_dir
from ultimapy.sdk import art

set_ultima_files_dir(r"C:\Games\Ultima Online")

img = art.Art.get_static(0x0FFF)  # example item id
img.save("0x0FFF.png")
```

## Basic example: access tile data

```python
from ultimapy.settings import set_ultima_files_dir
from ultimapy.sdk.tile_data import TileData

set_ultima_files_dir(r"C:\Games\Ultima Online")

# Ensure tile data is loaded
TileData.load()

tile = TileData.item_data[0x0FFF]
print(tile.flags, tile.height)
```
