# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.25] - 2025-11-26

### Added
- Modern `pyproject.toml` packaging (PEP 517/518/621)
- GitHub Actions CI/CD workflows
  - Multi-OS testing (Ubuntu, Windows, macOS)
  - Multi-Python version testing (3.9-3.13)
  - Automated PyPI publishing
- Dependabot configuration for automated dependency updates
- Pre-commit hooks configuration
- Development dependencies
  - pytest for testing
  - black for code formatting
  - ruff for linting
  - mypy for type checking
  - pytest-cov for coverage reporting
- Comprehensive code quality tooling configuration
- Expanded README with modern documentation
- CHANGELOG.md (this file)
- CONTRIBUTING.md with contribution guidelines
- Python 3.13 support

### Changed
- **BREAKING**: Minimum Python version raised to 3.9 (from implicit 3.x)
- Updated `setup.py` to minimal wrapper (all config in `pyproject.toml`)
- Pinned minimum dependency versions
  - Pillow >= 10.0.0 (security updates)
  - imageio >= 2.31.0 (Python 3.9+ requirement)
- Modernized `.gitignore` with comprehensive patterns
- Updated repository URLs to NerdyGamers fork
- Enhanced project metadata and classifiers

### Fixed
- Dependency security vulnerabilities through version pinning

## [0.0.24] - 2024-04-22 (Original Project)

### Fixed
- Windows UOP file handling

## [0.0.23] - 2024-04-20 (Original Project)

### Added
- UOP file format support
- Support for both `.mul` and `.uop` client files

### Changed
- Improved file format detection and handling

---

## Migration Notes

### For Users

If you're upgrading from 0.0.24 or earlier:

1. **Python Version**: Ensure you're running Python 3.9 or higher
   ```bash
   python --version  # Should be 3.9.0 or higher
   ```

2. **Installation**: Standard pip install still works
   ```bash
   pip install --upgrade ultimapy
   ```

3. **No API Changes**: All existing code should work without modification

### For Developers

If you're contributing or forking:

1. **New packaging system**: Configuration moved from `setup.py` to `pyproject.toml`
2. **Development dependencies**: Install with `pip install -e .[dev]`
3. **Code quality tools**: Run `black .` and `ruff check .` before committing
4. **Pre-commit hooks**: Optional but recommended - `pre-commit install`

### Backwards Compatibility

The legacy `setup.py` is maintained as a minimal wrapper for backwards compatibility with older build tools. Modern tools (pip 21.3+) will automatically use `pyproject.toml`.
