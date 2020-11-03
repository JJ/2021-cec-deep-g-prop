"""Define global paths for easy file find."""
from pathlib import Path
from sys import exit as sysexit

# Define basic paths for global use
ROOT = Path(__file__).resolve().parent
try:
    # Code
    REQUIREMENTS_DIR_PATH = (ROOT / "requirements").resolve(strict=True)
    SOURCE_DIR_PATH = (ROOT / "src").resolve(strict=True)
    DATASETS_DIR_PATH = (SOURCE_DIR_PATH / "datasets").resolve(strict=True)
    PROBEN1_DIR_PATH = (DATASETS_DIR_PATH / "proben1").resolve(strict=True)
except FileNotFoundError as error:
    sysexit(f"{error.strerror}: {error.filename}")

# Possibly not existent folders
LOGS_DIR_PATH = (SOURCE_DIR_PATH / "logs")
LOGS_DIR_PATH.mkdir(exist_ok=True)
