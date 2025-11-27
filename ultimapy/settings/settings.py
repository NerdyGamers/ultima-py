import os

try:
    from django.conf import settings  # noqa
except ModuleNotFoundError:
    settings = None

# if an environment file exists, load it into the env.
# if django exists, load the variables from the django config over the environment variable.
if os.path.exists("environment.ini"):
    env_file = open("environment.ini")
    for line in env_file:
        trim_line = line.rstrip("\n").strip()
        if not trim_line or trim_line.startswith("#"):
            continue
        if "=" not in trim_line:
            print(f"Skipping invalid environment.ini variable: '{trim_line}'")
        variable, value = trim_line.split("=")
        os.environ[variable] = value


def get_django_var_or_env(variable_name):
    return getattr(settings, variable_name, os.environ.get(variable_name, None))


def ultima_file_path(file_name):
    return os.path.join(ULTIMA_FILES_DIR, file_name)


ULTIMA_MOUNT_IDS = get_django_var_or_env("MOUNT_IDS")

# If coming from env/Django as a JSON string, parse it
if isinstance(ULTIMA_MOUNT_IDS, str):
    import json

    ULTIMA_MOUNT_IDS = json.loads(ULTIMA_MOUNT_IDS)

# Default mounts if nothing configured
if not ULTIMA_MOUNT_IDS:
    ULTIMA_MOUNT_IDS = [
        228,
        200,
        218,
        204,
        179,
        226,
        219,
        116,
        178,
        220,
        210,
        117,
    ]

# Base directory for Ultima Online client files.
# In test/CI environments, there is no configured client path, so fall back
# to the current working directory to allow imports to succeed.
_raw_dir = get_django_var_or_env("ULTIMA_FILES_DIR")
if not _raw_dir:
    _raw_dir = os.getcwd()

ULTIMA_FILES_DIR = os.path.abspath(_raw_dir)
