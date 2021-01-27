# Final Degree Project: *DeepGProp*

> Neural Networks optimization with Genetic Algorithms

- **Author: Luis Liñán Villafranca**
- **Mentor: Juan Julián Merelo Guervós**

## Index

- [Installation](#installation)
  - [Virtual environment creation](#virtual-environment-creation)
  - [Installing the DeepGProp CLI](#installing-the-deepgprop-cli)
  - [Extra modules](#extra-modules)
- [Tests and formatting](#tests-and-formatting)
- [Frameworks](#frameworks)
- [Utilidades](#utilidades)
- [Licencia](#licencia)

---

## Installation

The first prerequisite is to have [Python 3.7][python-downloads-url] and [pip]
installed on the system. It is recommended to create a virtual environment to
isolate the used package versions. For more information about [pip] and [venv]
check the [official tutorial][python-venv-pip-guide-url].

### Virtual environment creation

First, you need to install a version of python that's been compiled
with `-fPIC`. `pyenv` versions by default are not, so you will need to
issue something like this:

```shell
env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.7.9
```

We can then use a core module to create the virtual environment, it's been
working since version 3.3

```shell
python -m venv .venv
```

> Please make sure when you do this that all `__pycache__` directories
have been deleted; otherwise, it might fail in some unexpected place.

This will create a virtual environment in the `.venv` directory. Once
that's been done, we need to activate it; use one of the following
commands (depending on the interpreter) (obtained from the official
[venv] documentation):

| Platform |      Shell      | Command to activate virtual environment |
| :------: | --------------: | --------------------------------------- |
|  POSIX   |        bash/zsh | `$ source <venv>/bin/activate`          |
|          |            fish | `$ . <venv>/bin/activate.fish`          |
|          |        csh/tcsh | `$ source <venv>/bin/activate.csh`      |
|          | PowerShell Core | `$ <venv>/bin/Activate.ps1`             |
| Windows  |         cmd.exe | `C:\> <venv>\Scripts\activate.bat`      |
|          |      PowerShell | `PS C:\> <venv>\Scripts\Activate.ps1`   |

Table 1.1: *Activating the virtual environment.*

> You won't need to create the virtual environment in the case you're
> using global installation of modules via version managers such as
> `pyenv`.

### Installing the DeepGProp CLI

To run DeepGProp first we need to install its cli. For that, run the following
command:

```shell
pip install .
```

On the other hand, if we want the code to be updated as we change it, we will need to install
DeepGProp in editable mode. To do this, we need to add the option
`-e/--editable` to the installation command

```shell
pip install -e .
```

After installing it, we will be able to use it through the command `dgp`. You
can run `dgp --help` to list the available options.

### Extra modules

He dividido los paquetes utilizados en el proyecto en distintos grupos para
evitar instalar librerías no deseadas si vamos a realizar tareas concretas
(como construir la documentación o ejecutar cierto módulo):

|          Purpose          |              File path               |                                      Description                                      |
| ------------------------- | ------------------------------------ | ------------------------------------------------------------------------------------- |
| Production                | [`requirements/prod.txt`]            | Necessary packages to run *DeepGProp*. The previous subsection already install this.  |
| Test                      | [`requirements/tests.txt`]           | Necessary packages for tests. [Nox] installs them automaticly when running the tests. |
| Optimizers comparison     | [`requirements/hp_optimization.txt`] | Packages used for the hyper-parametter optimizers comparison.                         |
| MLP Frameworks comparison | [`requirements/mlp_frameworks.txt`]  | Packages used for the neural net frameworks comparison.                               |

To install any of these packages you can run:

```shell
pip install -r <file path>
```

If you are not using any virtual environment, make sure you install
these packages so that they are available in the required Python version.

## Tests and formatting

> **Note:** To be able to run the DeepGProp tests, you will need to install it
> in editable mode. checkout in
> [Installing the DeepGProp CLI](#installing-the-deepgprop-cli) section how to
> do it.

First, we need to install the [Nox] tool:

```shell
pip install -U nox
```

To run all the tests:

```shell
nox -k test
```

To run the linters:

```shell
nox -k lint
```

You can check all the possible sessions with the following command:

```shell
nox -l
```

## Frameworks

- [Keras] - base library to create and run the neural networks.

- [DEAP] - genetic algorithms library used to optimize the models hyper
  parametters.

## Utilidades

- Automation:

  - [Nox] - automation tool to run different tasks as the tests or the code
    formatting check.

- Tests:

  - [pytest] - Python test framework to run the tests.

## Licencia

The original code can be found in the [DeepGProp] repo.

<!-- Archivos -->
[`requirements/prod.txt`]: ./requirements/prod.txt
[`requirements.txt`]: ./requirements.txt
[`requirements/tests.txt`]: ./requirements/tests.txt
[`requirements/hp_optimization.txt`]: ./requirements/hp_optimization.txt
[`requirements/mlp_frameworks.txt`]: ./requirements/mlp_frameworks.txt

<!-- Misceláneo -->
[python-downloads-url]: https://www.python.org/downloads/
[pip]: https://pypi.org/project/pip/
[venv]: https://docs.python.org/3/library/venv.html
[python-venv-pip-guide-url]: https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/

<!-- Frameworks y utilidades -->
[Keras]: https://keras.io/
[DEAP]: https://deap.readthedocs.io/en/master/
[Nox]: https://nox.thea.codes/en/stable/
[pytest]: https://docs.pytest.org/en/latest/


<!-- Insignias -->
[DeepGProp]: https://github.com/lulivi/deep-g-prop
