# Configuration

UltimaPy uses a small configuration layer in `ultimapy.settings` to resolve the
paths to Ultima Online client files.

## Environment variables

The main variable is:

- `ULTIMA_FILES_DIR` – base directory of the Ultima Online client install

Example:

```bash
export ULTIMA_FILES_DIR="C:\Games\Ultima Online"
```

## Django integration

If you are using UltimaPy in a Django project, `ultimapy.settings` can read from
your Django settings module via `get_django_var_or_env`. In that case you can
define:

- `ULTIMA_FILES_DIR` in `settings.py`
- `MOUNT_IDS` for custom mount art IDs (optional)

## Behaviour in CI / test environments

If `ULTIMA_FILES_DIR` is not set, or required client files are missing, the
autoloaders in the SDK (art, hues, tiledata, bodies, skills, fonts, etc.) are
designed to **fail gracefully**:

- Missing files result in empty tables / default state
- Importing `ultimapy` and `ultimapy.sdk.*` will still succeed
- This is what allows the test suite to run in GitHub Actions without shipping
  real Ultima Online assets
