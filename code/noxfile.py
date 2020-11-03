"""Automation module to run from documentation builds to tests."""
import contextlib

from functools import partial
from pathlib import Path
from shutil import rmtree
from typing import Callable, Dict, Iterator, List

import nox

from nox.sessions import Session

from settings import REQUIREMENTS_DIR_PATH, ROOT

# Configure nox
nox.options.sessions = ["test", "lint"]
nox.options.reuse_existing_virtualenvs = True
nox.options.default_venv_backend = "venv"

# Globals
form_requirements = ["-r", str(REQUIREMENTS_DIR_PATH / "format.txt")]
test_requirements = ["-r", str(REQUIREMENTS_DIR_PATH / "tests.txt")]
prod_requirements = ["-r", str(REQUIREMENTS_DIR_PATH / "prod.txt")]
mlp_frameworks_requirements = [
    "-r",
    str(REQUIREMENTS_DIR_PATH / "mlp_frameworks.txt"),
]
hp_optimization_requirements = [
    "-r",
    str(REQUIREMENTS_DIR_PATH / "hp_optimization.txt"),
]
python_files = ["noxfile.py", "src", "tests"]


# -----------------------------------------------------------------------------
# Cleaning
# -----------------------------------------------------------------------------
def remove_files(
    path_list: List[Path], func_logger: Callable = print,
) -> None:
    """Remove the list of paths provided.

    :param path_list: :class:`Path` list to remove.
    :param func_logger: print function to use.

    """

    def remove_file(path: Path, func_logger: Callable = print):
        """Remove provided path.

        :param path: :class:`Path` instance to remove.
        :param func_logger: print function to use.

        """
        try:
            func_logger(f"Trying to remove '{path}'...")
            if path.is_file():
                path.unlink()
            else:
                rmtree(path)
        except FileNotFoundError as error:
            func_logger(
                f"Couldn't remove '{error.filename}'. File/directory not found"
            )
        else:
            func_logger("File/directory removed succesfully")

    list(map(partial(remove_file, func_logger=func_logger), path_list,))


@nox.session(name="clean-py")
def clean_py(session: Session) -> None:
    """Celean python cache files.

    If ``verbose`` is provided in :attr:`Session.posargs`, each file removal
    will be logged. Nothing will print otherwise.

    """
    show_help(session, {"verbose": "Show each deleted file."})
    lggr = session.log if "verbose" in session.posargs else lambda *args: None
    session.log("Cleaning global unwanted files...")

    remove_files(
        [
            *list(ROOT.glob("**/*.py[cod]")),
            *list(ROOT.glob("**/__pycache__/")),
            *list(ROOT.glob("**/.pytest_cache/")),
            *list(ROOT.glob("**/.mypy_cache/")),
        ],
        lggr,
    )


# -----------------------------------------------------------------------------
# Utils
# -----------------------------------------------------------------------------
def show_help(session: Session, help_dict: Dict[str, str]) -> None:
    """Process the extra arguments for a session.

    :param session: current session.
    :param help: arguments help for the curent session.

    """
    if "help" in session.posargs:
        session.log("=" * 40)
        session.log("Function posargs:")

        for argument, description in help_dict.items():
            session.log(f"\t- {argument}: {description}")

        session.log("=" * 40)
        session.skip()


@contextlib.contextmanager
def chdir(session: Session, dir_path: Path) -> Iterator[Path]:
    """Temporarily chdir when entering CM and chdir back on exit."""
    orig_dir = Path.cwd()

    session.chdir(str(dir_path))
    try:
        yield dir_path
    finally:
        session.chdir(str(orig_dir))


# -----------------------------------------------------------------------------
# Tests
# -----------------------------------------------------------------------------
@nox.session(python="3.7")
def test(session: Session) -> None:
    """Run the source code related tests."""
    test_path = session.posargs[0] if session.posargs else str(ROOT / "tests")
    session.log("Running tests!")
    session.install(
        *test_requirements,
        *mlp_frameworks_requirements,
        *hp_optimization_requirements,
        env={"TMPDIR": "/var/tmp"},
    )
    session.run(
        "pytest",
        test_path,
        f"--cov={str(ROOT / 'src')}",
        "--cov-report=term-missing",
        "-vvv",
        silent=False,
    )


# -----------------------------------------------------------------------------
# Format
# -----------------------------------------------------------------------------
@nox.session(name="format")
def apply_format(session: Session) -> None:
    """Apply formating rules to the selected files."""
    session.install(*form_requirements)
    session.run("i", "-l", "79", *python_files, silent=False)
    session.run("isort", "-rc", *python_files, silent=False)


# -----------------------------------------------------------------------------
# Lint
# -----------------------------------------------------------------------------
@nox.session()
def lint(session: Session) -> None:
    """Lint the selected files."""
    session.install(
        *test_requirements,
        *mlp_frameworks_requirements,
        *hp_optimization_requirements,
        "nox==2020.5.24",
        env={"TMPDIR": "/var/tmp"},
    )
    with chdir(session, ROOT):
        session.run("mypy", *python_files, silent=False)
        session.run("flake8", *python_files, silent=False)
        session.run(
            "pycodestyle",
            "--ignore=E203,W503,E231",
            *python_files,
            silent=False,
        )
        session.run("pydocstyle", *python_files, silent=False)
        session.run(
            "black",
            "-l",
            "79",
            "--check",
            "--diff",
            *python_files,
            silent=False,
        )
        session.run(
            "isort",
            "-rc",
            "--check-only",
            "--diff",
            *python_files,
            silent=False,
        )
        session.run("pylint", *python_files, silent=False)
