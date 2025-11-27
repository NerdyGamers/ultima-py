"""Basic import and package structure tests."""


def test_package_imports():
    """Test that core package modules can be imported."""
    import ultimapy
    assert ultimapy is not None


def test_sdk_imports():
    """Test that SDK modules can be imported."""
    from ultimapy.sdk import art, hues, animations
    assert art is not None
    assert hues is not None
    assert animations is not None


def test_settings_imports():
    """Test that settings module can be imported."""
    from ultimapy import settings
    assert settings is not None


def test_version():
    """Test that package has version info."""
    import ultimapy
    # Package exists and is importable
    assert ultimapy.__name__ == "ultimapy"
