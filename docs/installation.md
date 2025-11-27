# Installation

## From PyPI (once published)

```bash
pip install ultimapy
```

## From source (development)

Clone the repository and install in editable mode with development extras:

```bash
git clone https://github.com/NerdyGamers/ultima-py.git
cd ultima-py

# Create and activate a virtualenv (optional but recommended)
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate

# Install dev dependencies and UltimaPy in editable mode
pip install -e .[dev]
```

For Windows, there is a helper script that sets up the development environment:

```powershell
./scripts/setup-dev.ps1
```

This will install the required tools (`pre-commit`, `black`, `ruff`, `mypy`, `pytest`)
and register the git hooks.
