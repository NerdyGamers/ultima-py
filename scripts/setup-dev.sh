#!/bin/bash
# Development environment setup script for ultimapy
# Run this after cloning to set up everything

set -e

echo "=================================================="
echo "ultimapy Development Environment Setup"
echo "=================================================="
echo ""

# Check Python version
echo "[1/6] Checking Python version..."
python_version=$(python3 --version 2>&1 | awk '{print $2}')
echo "Found Python $python_version"

if ! python3 -c 'import sys; exit(0 if sys.version_info >= (3, 9) else 1)' 2>/dev/null; then
    echo "ERROR: Python 3.9+ required. You have $python_version"
    exit 1
fi
echo "✓ Python version OK"
echo ""

# Create virtual environment
echo "[2/6] Creating virtual environment..."
if [ -d "venv" ]; then
    echo "Virtual environment already exists, skipping..."
else
    python3 -m venv venv
    echo "✓ Virtual environment created"
fi
echo ""

# Activate virtual environment
echo "[3/6] Activating virtual environment..."
source venv/bin/activate
echo "✓ Virtual environment activated"
echo ""

# Upgrade pip
echo "[4/6] Upgrading pip..."
pip install --upgrade pip --quiet
echo "✓ pip upgraded"
echo ""

# Install package with dev dependencies
echo "[5/6] Installing ultimapy with dev dependencies..."
pip install -e .[dev] --quiet
echo "✓ ultimapy installed in development mode"
echo ""

# Install pre-commit hooks
echo "[6/6] Installing pre-commit hooks..."
pre-commit install --quiet
echo "✓ pre-commit hooks installed"
echo ""

# Success message
echo "=================================================="
echo "✓ Development environment setup complete!"
echo "=================================================="
echo ""
echo "Next steps:"
echo "  1. Set your UO client path:"
echo "     export ULTIMA_FILES_DIR=/path/to/your/ultima/client"
echo ""
echo "  2. Activate the virtual environment:"
echo "     source venv/bin/activate"
echo ""
echo "  3. Start developing!"
echo ""
echo "Useful commands:"
echo "  black .              - Format code"
echo "  ruff check .         - Lint code"
echo "  mypy ultimapy        - Type check"
echo "  pytest               - Run tests (when available)"
echo "  pre-commit run --all - Run all quality checks"
echo ""
echo "Documentation:"
echo "  README.md           - Project overview"
echo "  CONTRIBUTING.md     - Contribution guidelines"
echo "  MODERNIZATION.md    - Modernization details"
echo ""
