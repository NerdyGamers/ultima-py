# `ultimapy.settings`

Settings and configuration helpers for UltimaPy.

## Key functions

- `set_ultima_files_dir(path: str) -> None`  
  Set the base directory for Ultima Online client files at runtime.

- `ultima_file_path(name: str) -> str`  
  Resolve a client file (`art.mul`, `hues.mul`, etc.) relative to the configured
  `ULTIMA_FILES_DIR`.

Environment variables and (optionally) Django settings are used as the ultimate
source of truth.
