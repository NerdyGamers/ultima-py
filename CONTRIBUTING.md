# Contributing to ultimapy

Thank you for your interest in contributing! This is an active fork maintained for the Ultima Online community.

## Getting Started

### Prerequisites

- Python 3.9 or higher
- Git
- An Ultima Online client installation (for testing)

### Setup Development Environment

1. **Fork and clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/ultima-py.git
   cd ultima-py
   ```

2. **Create a virtual environment**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install in development mode with dev dependencies**
   ```bash
   pip install -e .[dev]
   ```

4. **Install pre-commit hooks (optional but recommended)**
   ```bash
   pre-commit install
   ```

5. **Set up your UO client path**
   ```bash
   export ULTIMA_FILES_DIR=/path/to/your/ultima/client
   ```

## Development Workflow

### 1. Create a Feature Branch

```bash
git checkout -b feature/your-feature-name
```

Use descriptive branch names:
- `feature/add-animation-caching`
- `fix/hue-rendering-bug`
- `docs/improve-installation-guide`

### 2. Make Your Changes

Follow the project structure:

```
ultimapy/
├── sdk/              # Core SDK modules
│   ├── art.py        # Static art rendering
│   ├── animations.py # Animation rendering
│   ├── hues.py       # Color palette/hues
│   └── ...
└── settings/         # Configuration management
```

### 3. Code Quality Standards

**Format your code with Black:**
```bash
black .
```

**Lint with Ruff:**
```bash
ruff check .
ruff check . --fix  # Auto-fix issues
```

**Type check with mypy (optional but appreciated):**
```bash
mypy ultimapy
```

**Run all checks:**
```bash
black . && ruff check . && mypy ultimapy
```

### 4. Test Your Changes

Currently, we're building out the test infrastructure. For now:

1. **Manual testing**: Test your changes against real UO client files
2. **Verify existing functionality**: Ensure you haven't broken existing features
3. **Document edge cases**: Note any special cases in your PR description

**Future**: We'll be adding pytest test suite

### 5. Commit Your Changes

Write clear, descriptive commit messages:

```bash
git add .
git commit -m "Add animation frame caching to improve performance"
```

**Good commit message format:**
```
[type]: Brief description (50 chars or less)

More detailed explanation if needed. Wrap at 72 characters.
Explain the problem this commit solves and why you chose
this solution.

References: #123
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

### 6. Push and Create Pull Request

```bash
git push origin feature/your-feature-name
```

Then open a Pull Request on GitHub with:

- **Clear title**: What does this PR do?
- **Description**: Why is this change needed?
- **Testing**: How did you test it?
- **Screenshots**: If UI/visual changes
- **Related issues**: Link to any related issues

## Code Style Guidelines

### Python Style

- **Line length**: 100 characters (enforced by Black)
- **Imports**: Organized by isort (run via Ruff)
- **Type hints**: Appreciated but not required
- **Docstrings**: Use for public APIs

### Example

```python
from typing import Optional
from PIL import Image


def render_item(
    item_id: int, 
    hue: Optional[int] = None,
    check_max_id: bool = True
) -> Image.Image:
    """Render an Ultima Online item.
    
    Args:
        item_id: The item ID to render
        hue: Optional hue index to apply
        check_max_id: Whether to validate item ID range
        
    Returns:
        PIL Image object containing the rendered item
        
    Raises:
        ValueError: If item_id is invalid
    """
    # Implementation
    pass
```

## Project-Specific Guidelines

### Working with UO Client Files

1. **File format support**: Support both `.mul` and `.uop` formats
2. **Error handling**: Gracefully handle missing or corrupted files
3. **Performance**: Cache file readers when possible
4. **Memory**: Be mindful of large files (animations, art)

### Adding New Features

1. **Maintain C# SDK compatibility**: Keep the API similar to C# Ultima SDK where possible
2. **Document thoroughly**: Explain UO-specific concepts
3. **Provide examples**: Add usage examples to README
4. **Consider web use**: Remember this library is meant for web frameworks

## Bug Reports

When reporting bugs, include:

1. **Python version**: `python --version`
2. **ultimapy version**: `pip show ultimapy`
3. **UO client version**: Which client files you're using
4. **Operating system**: Windows/Linux/macOS
5. **Steps to reproduce**: Minimal code example
6. **Expected vs actual behavior**
7. **Error messages**: Full traceback if applicable

## Feature Requests

We welcome feature requests! Please:

1. **Search existing issues**: Check if it's already requested
2. **Describe the use case**: Why is this needed?
3. **Provide examples**: Show how you'd like it to work
4. **Consider scope**: Is it broadly useful?

## Questions?

- **Issues**: For bugs and features
- **Discussions**: For questions and help
- **Email**: contact@uolostlands.com

## Code of Conduct

Be respectful and constructive. This is a community project built by UO fans for UO fans.

- **Be welcoming**: Help newcomers
- **Be patient**: Not everyone is an expert
- **Be constructive**: Critique code, not people
- **Be collaborative**: We're all here to make this better

## Recognition

Contributors will be recognized in:
- Release notes
- README credits section
- Git commit history

Significant contributions may earn you a beer if we ever meet! 🍻

---

Thank you for contributing to the Ultima Online community! 🎮
