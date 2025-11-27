# Development environment setup script for ultimapy (Windows PowerShell)
# Run this after cloning to set up everything

$ErrorActionPreference = "Stop"

Write-Host "=================================================="
Write-Host "ultimapy Development Environment Setup"
Write-Host "=================================================="
Write-Host ""

# Check Python version
Write-Host "[1/6] Checking Python version..."
try {
    $pythonVersion = (python --version 2>&1) -replace 'Python ', ''
    Write-Host "Found Python $pythonVersion"

    $version = [version]$pythonVersion
    if ($version.Major -lt 3 -or ($version.Major -eq 3 -and $version.Minor -lt 9)) {
        Write-Host "ERROR: Python 3.9+ required. You have $pythonVersion" -ForegroundColor Red
        exit 1
    }
    Write-Host "✓ Python version OK" -ForegroundColor Green
}
catch {
    Write-Host "ERROR: Python not found or version check failed" -ForegroundColor Red
    exit 1
}
Write-Host ""

# Create virtual environment
Write-Host "[2/6] Creating virtual environment..."
if (Test-Path "venv") {
    Write-Host "Virtual environment already exists, skipping..."
}
else {
    python -m venv venv
    Write-Host "✓ Virtual environment created" -ForegroundColor Green
}
Write-Host ""

# Activate virtual environment
Write-Host "[3/6] Activating virtual environment..."
.\venv\Scripts\Activate.ps1
Write-Host "✓ Virtual environment activated" -ForegroundColor Green
Write-Host ""

# Upgrade pip
Write-Host "[4/6] Upgrading pip..."
python -m pip install --upgrade pip --quiet
Write-Host "✓ pip upgraded" -ForegroundColor Green
Write-Host ""

# Install package with dev dependencies
Write-Host "[5/6] Installing ultimapy with dev dependencies..."
pip install -e .[dev] --quiet
Write-Host "✓ ultimapy installed in development mode" -ForegroundColor Green
Write-Host ""

# Install pre-commit hooks
Write-Host "[6/6] Installing pre-commit hooks..."
pre-commit install --quiet
Write-Host "✓ pre-commit hooks installed" -ForegroundColor Green
Write-Host ""

# Success message
Write-Host "=================================================="
Write-Host "✓ Development environment setup complete!" -ForegroundColor Green
Write-Host "=================================================="
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Set your UO client path:"
Write-Host '     $env:ULTIMA_FILES_DIR="C:\Path\To\Your\Ultima\Client"'
Write-Host ""
Write-Host "  2. Activate the virtual environment:"
Write-Host "     .\venv\Scripts\Activate.ps1"
Write-Host ""
Write-Host "  3. Start developing!"
Write-Host ""
Write-Host "Useful commands:"
Write-Host "  black .              - Format code"
Write-Host "  ruff check .         - Lint code"
Write-Host "  mypy ultimapy        - Type check"
Write-Host "  pytest               - Run tests (when available)"
Write-Host "  pre-commit run --all - Run all quality checks"
Write-Host ""
Write-Host "Documentation:"
Write-Host "  README.md           - Project overview"
Write-Host "  CONTRIBUTING.md     - Contribution guidelines"
Write-Host "  MODERNIZATION.md    - Modernization details"
Write-Host ""
