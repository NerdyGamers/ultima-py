[![PyPI version](https://badge.fury.io/py/ultimapy.svg)](https://badge.fury.io/py/ultimapy)
[![CI](https://github.com/NerdyGamers/ultima-py/workflows/CI/badge.svg)](https://github.com/NerdyGamers/ultima-py/actions)
[![Python Version](https://img.shields.io/pypi/pyversions/ultimapy.svg)](https://pypi.org/project/ultimapy/)
[![License](https://img.shields.io/badge/license-Beerware-blue.svg)](LICENSE)

# ultimapy

> **Note**: This is a modernized fork maintained by [NerdyGamers](https://github.com/NerdyGamers) for [UO Lost Lands](https://uolostlands.com). Original project by [jackuoll](https://github.com/jackuoll/ultima-py).

ultimapy is a Python library for rendering images from Ultima Online client files. The SDK is a direct 1:1 code translation of the C# Ultima SDK (used by UOFiddler and similar tools).

**Read-only**: Does not support saving back to client files.

## Why?

The C# SDK doesn't run reliably with Mono due to missing implementations. Rewriting in Python enables:
- **Linux compatibility** out of the box
- **Web framework integration** (Django, Flask, FastAPI)
- **Modern Python tooling** and development practices

Bonus features include player avatar rendering and bug fixes not present in the C# SDK.

## Features

- ✅ Render land tiles and statics (in-game items)
- ✅ Render animations and individual frames (monsters, players)
- ✅ Player construction with mount, body, hair, and clothing layers
- ✅ Draw client fonts (ASCIIFont)
- ✅ Extract skill information (names, groups, indexes)
- ✅ Render paperdolls and individual gumps
- ✅ Support for both `.mul` and `.uop` file formats

## Requirements

- **Python 3.9+** (tested on 3.9, 3.10, 3.11, 3.12, 3.13)
- **Pillow 10.0+**
- **imageio 2.31+**

## Installation

### Standard Installation

```bash
pip install ultimapy
```

### Development Installation

```bash
git clone https://github.com/NerdyGamers/ultima-py.git
cd ultima-py
pip install -e .[dev]
```

This installs with optional development dependencies (pytest, black, ruff, mypy).

## Configuration

You **must** specify your Ultima Online client directory using one of these methods:

### Option 1: Environment Variable

```bash
export ULTIMA_FILES_DIR=/path/to/ultima
```

### Option 2: Environment File

Create `environment.ini`:

```ini
ULTIMA_FILES_DIR=/path/to/ultima
```

### Option 3: Django Settings

Add to `settings.py`:

```python
ULTIMA_FILES_DIR = '/path/to/ultima'
```

## Settings Reference

| Setting | Type | Description | Default |
|---------|------|-------------|---------||
| `ULTIMA_FILES_DIR` | string | Path to UO client directory | *Required* |
| `ULTIMA_MOUNT_IDS` | list/json | Valid mount item IDs | 5.0.8.3 mounts |

## Usage Examples

### Render Static Item

```python
from ultimapy.sdk.art import Art
from ultimapy.sdk.hues import Hues

# Render a moongate
moongate_id = 0x0F6C
art = Art.get_static(moongate_id, check_max_id=False)
art.save("moongate.png")

# Apply red hue
red_hue = Hues.HUES[32]
red_art = red_hue.apply_to(art, only_grey_pixels=False)
red_art.save("red_moongate.png")
```

### Render Player Avatar

```python
from ultimapy.sdk.animations import Animations
from ultimapy.sdk.hues import Hues

# Get player body animation
body_id = 400  # Male body
action = 0  # Standing
direction = 2  # South-facing

frame = Animations.get_animation_frame(
    body_id=body_id,
    action=action,
    direction=direction,
    frame=0,
    hue=Hues.HUES[0]  # Skin tone
)

frame.save("player.png")
```

### Extract Client Text

```python
from ultimapy.sdk.fonts import ASCIIFont

# Draw text using client font
font = ASCIIFont(font_id=3)
text_image = font.draw_text("Hello Britannia!", hue=33)
text_image.save("text.png")
```

## Development

### Setup Development Environment

```bash
# Install with dev dependencies
pip install -e .[dev]

# Install pre-commit hooks
pre-commit install
```

### Code Quality Tools

```bash
# Format code
black .

# Lint
ruff check .

# Type check
mypy ultimapy

# Run tests (when available)
pytest
```

### Project Structure

```
ultimapy/
├── sdk/           # Core SDK modules
│   ├── art.py     # Static art rendering
│   ├── animations.py  # Animation rendering
│   ├── hues.py    # Color palette/hues
│   ├── fonts.py   # Font rendering
│   └── ...
└── settings/      # Configuration management
```

## Modernization (v0.0.25)

This fork includes:

- ✨ **Modern packaging** with `pyproject.toml` (PEP 517/518/621)
- 🔒 **Pinned dependencies** with security updates
- 🤖 **GitHub Actions CI/CD** (multi-OS, multi-Python testing)
- 🔍 **Dependabot** for automated dependency updates
- 🎨 **Code quality tools** (Black, Ruff, mypy)
- 📝 **Pre-commit hooks** for automated checks
- 🧪 **Test infrastructure** setup (pytest)
- 🐍 **Python 3.9-3.13** support

## Contributing

Contributions welcome! This is an active fork.

1. Fork the repo
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Install dev dependencies (`pip install -e .[dev]`)
4. Make your changes with tests
5. Run quality checks (`black .`, `ruff check .`)
6. Commit (`git commit -m 'Add amazing feature'`)
7. Push and open a PR

## License

**Beerware License** - If you find this useful and we meet, buy me a beer.

Original C# SDK by Electronic Arts / Mythic Entertainment.

## Links

- **Homepage**: [UO Lost Lands](https://uolostlands.com)
- **Repository**: [GitHub](https://github.com/NerdyGamers/ultima-py)
- **Original Project**: [jackuoll/ultima-py](https://github.com/jackuoll/ultima-py)
- **Issues**: [Bug Reports](https://github.com/NerdyGamers/ultima-py/issues)
- **PyPI**: [ultimapy](https://pypi.org/project/ultimapy/)

## Credits

- **Original Author**: [Jack Ward](https://github.com/jackuoll)
- **Fork Maintainer**: [JBob / NerdyGamers](https://github.com/NerdyGamers)
- **C# Ultima SDK**: Electronic Arts / Mythic Entertainment
- **UOFiddler Team**: For C# SDK improvements

---

*Built for the Ultima Online community by players, for players.*
