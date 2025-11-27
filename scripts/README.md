# Development Scripts

Helper scripts for setting up and maintaining your ultimapy development environment.

## Setup Scripts

### Linux/macOS

```bash
# Make executable
chmod +x scripts/setup-dev.sh

# Run setup
./scripts/setup-dev.sh
```

### Windows (PowerShell)

```powershell
# Run setup
.\scripts\setup-dev.ps1
```

### What These Scripts Do

1. Check Python version (3.9+ required)
2. Create virtual environment if needed
3. Activate virtual environment
4. Upgrade pip
5. Install ultimapy in development mode with dev dependencies
6. Install pre-commit hooks

## Manual Setup (Alternative)

If you prefer manual setup:

```bash
# Create virtual environment
python -m venv venv

# Activate (Linux/macOS)
source venv/bin/activate

# Activate (Windows)
venv\Scripts\activate

# Install with dev dependencies
pip install -e .[dev]

# Install pre-commit hooks
pre-commit install
```

## Environment Configuration

After setup, configure your UO client path:

**Linux/macOS:**
```bash
export ULTIMA_FILES_DIR=/path/to/ultima
```

**Windows:**
```powershell
$env:ULTIMA_FILES_DIR="C:\Path\To\Ultima"
```

**Persistent (add to your shell profile):**
```bash
# ~/.bashrc or ~/.zshrc
export ULTIMA_FILES_DIR=/path/to/ultima
```

## Development Commands

Once setup is complete:

```bash
# Format code
black .

# Lint
ruff check .
ruff check . --fix  # Auto-fix

# Type check
mypy ultimapy

# Run all checks
black . && ruff check . && mypy ultimapy

# Pre-commit (runs automatically on commit)
pre-commit run --all-files
```

## Troubleshooting

### Python version error

**Error:** "Python 3.9+ required"

**Solution:** Install Python 3.9 or higher from [python.org](https://www.python.org/downloads/)

### Virtual environment issues

**Error:** "venv module not found"

**Solution (Ubuntu/Debian):**
```bash
sudo apt install python3-venv
```

### Permission denied (Linux/macOS)

**Error:** Permission denied when running script

**Solution:**
```bash
chmod +x scripts/setup-dev.sh
```

### Pre-commit hook errors

**Error:** Pre-commit hooks failing

**Solution:** Update hooks
```bash
pre-commit autoupdate
pre-commit run --all-files
```

## Adding New Scripts

When adding scripts to this directory:

1. **Name clearly**: Use descriptive names (e.g., `setup-dev.sh`, `run-tests.sh`)
2. **Add documentation**: Update this README
3. **Cross-platform**: Provide both .sh and .ps1 versions if possible
4. **Make executable**: `chmod +x script.sh`
5. **Error handling**: Use `set -e` (bash) or `$ErrorActionPreference = "Stop"` (PowerShell)
6. **User feedback**: Print clear progress messages

## Future Scripts

Planned additions:

- `run-tests.sh` - Run full test suite
- `build-package.sh` - Build distribution packages
- `update-deps.sh` - Update all dependencies
- `clean.sh` - Clean build artifacts

Contributions welcome!
