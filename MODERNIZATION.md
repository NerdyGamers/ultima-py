# Modernization Quick Reference

This document provides a quick reference for the modernization changes in v0.0.25.

## What Changed?

### For End Users

**Nothing breaks.** All your existing code works as-is.

**New requirement**: Python 3.9+ (you probably already have this)

```bash
# Upgrade normally
pip install --upgrade ultimapy
```

### For Developers

**Everything got better.** Modern tooling, automated testing, clearer contribution path.

```bash
# New dev setup
git clone https://github.com/NerdyGamers/ultima-py.git
cd ultima-py
pip install -e .[dev]
pre-commit install
```

## File-by-File Changes

### New Files

| File | Purpose |
|------|----------|
| `pyproject.toml` | Modern packaging configuration (replaces setup.py config) |
| `.github/workflows/ci.yml` | Automated testing on every push |
| `.github/workflows/publish.yml` | Automated PyPI releases |
| `.github/dependabot.yml` | Automatic dependency updates |
| `.pre-commit-config.yaml` | Code quality hooks |
| `CHANGELOG.md` | Version history documentation |
| `CONTRIBUTING.md` | Contribution guidelines |
| `MODERNIZATION.md` | This file |

### Modified Files

| File | Change |
|------|--------|
| `setup.py` | Minimized to wrapper (config moved to pyproject.toml) |
| `README.md` | Comprehensive rewrite with modern docs |
| `.gitignore` | Expanded with modern Python patterns |

### Unchanged Files

All code in `ultimapy/` directory remains unchanged. Zero API changes.

## Dependency Changes

### Before (v0.0.24)
```python
install_requires=[
    'Pillow',
    'imageio'
]
```

### After (v0.0.25)
```toml
dependencies = [
    "Pillow>=10.0.0",
    "imageio>=2.31.0",
]
```

**Why?** Version pinning prevents silent breakage and security vulnerabilities.

## New Development Commands

### Code Formatting
```bash
black .                    # Format all code
black ultimapy/sdk/art.py  # Format specific file
black --check .            # Check without modifying
```

### Linting
```bash
ruff check .               # Lint all code
ruff check . --fix         # Auto-fix issues
ruff check ultimapy/       # Lint specific directory
```

### Type Checking
```bash
mypy ultimapy              # Check types
mypy --strict ultimapy     # Strict mode
```

### All Quality Checks
```bash
black . && ruff check . && mypy ultimapy
```

### Pre-commit (Automatic)
```bash
pre-commit install         # One-time setup
# Now runs automatically on git commit
pre-commit run --all-files # Manual run
```

## CI/CD Pipeline

### What Gets Tested?

Every push and PR automatically runs:

1. **Multi-OS Testing**
   - Ubuntu (Linux)
   - Windows
   - macOS

2. **Multi-Python Testing**
   - Python 3.9
   - Python 3.10
   - Python 3.11
   - Python 3.12
   - Python 3.13

3. **Quality Checks**
   - Ruff linting
   - Black formatting
   - mypy type checking
   - Package build verification

### Publishing to PyPI

Automatic on GitHub releases:
```bash
git tag v0.0.25
git push origin v0.0.25
# GitHub Actions handles PyPI publish
```

## Dependabot

Automatically creates PRs for:
- Python package updates (weekly)
- GitHub Actions updates (weekly)

Just review and merge. Keeps dependencies current.

## Migration Checklist

### If You're a User
- [ ] Verify Python 3.9+ (`python --version`)
- [ ] Upgrade package (`pip install --upgrade ultimapy`)
- [ ] Test your existing code (should work unchanged)

### If You're a Contributor
- [ ] Fork and clone the modernized repo
- [ ] Install dev dependencies (`pip install -e .[dev]`)
- [ ] Set up pre-commit (`pre-commit install`)
- [ ] Read CONTRIBUTING.md
- [ ] Run quality checks before committing

### If You're Maintaining a Fork
- [ ] Review pyproject.toml for your fork's metadata
- [ ] Update GitHub Actions secrets for PyPI (if publishing)
- [ ] Configure Dependabot (optional)
- [ ] Update README with your fork's info
- [ ] Merge or cherry-pick these changes

## Tooling Comparison

### Old Stack (Pre-v0.0.25)
- setup.py for packaging
- Manual testing
- No CI/CD
- No automated formatting
- No dependency management

### New Stack (v0.0.25+)
- pyproject.toml for packaging (PEP standard)
- GitHub Actions CI/CD
- Black for formatting
- Ruff for linting (replaces flake8, isort, pyupgrade)
- mypy for type checking
- pytest for testing
- pre-commit for git hooks
- Dependabot for updates

## Why Each Tool?

| Tool | Replaces | Why Better |
|------|----------|------------|
| **pyproject.toml** | setup.py config | PEP standard, single source of truth |
| **Black** | Manual formatting | Opinionated, consistent, no debates |
| **Ruff** | flake8, isort, pyupgrade | 10-100x faster, one tool does it all |
| **mypy** | None | Catches type errors before runtime |
| **pytest** | Manual testing | Automated, repeatable, CI-ready |
| **pre-commit** | Manual checks | Automatic, prevents bad commits |
| **GitHub Actions** | Manual testing | Multi-OS/Python testing on every push |
| **Dependabot** | Manual updates | Automatic, never outdated |

## Performance Impact

**Runtime**: Zero. These are development tools.

**Development**: Faster.
- Ruff is 10-100x faster than flake8
- Black is instant
- Pre-commit catches issues before CI
- CI gives immediate feedback

## Questions?

### "Do I need to change my code?"
No. API unchanged.

### "Do I need Python 3.13?"
No. 3.9+ works. We test all versions.

### "Can I still use setup.py?"
Yes. It's maintained as a wrapper.

### "Do I need all the dev tools?"
No. They're optional (`pip install -e .[dev]`).

### "What if I only have Python 3.8?"
Upgrade to 3.9+. Python 3.8 is EOL (Oct 2024).

### "Can I skip pre-commit hooks?"
Yes. They're optional but helpful.

### "Will this work with my web framework?"
Yes. Django, Flask, FastAPI all work.

### "Is this still compatible with C# Ultima SDK?"
Yes. API compatibility maintained.

## Support

- **Issues**: [GitHub Issues](https://github.com/NerdyGamers/ultima-py/issues)
- **Discussions**: GitHub Discussions
- **Email**: contact@uolostlands.com
- **Community**: UO Lost Lands Discord

## Credits

Modernization by [JBob / NerdyGamers](https://github.com/NerdyGamers) for [UO Lost Lands](https://uolostlands.com).

Original project by [Jack Ward](https://github.com/jackuoll).

---

**TL;DR**: Everything's better, nothing breaks, Python 3.9+ required.
