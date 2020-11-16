# Trabajo de Fin de Grado: *DeepGProp*

> Optimización de Redes Neuronales con Algoritmos Genéticos

- **Autor(a): Luis Liñán Villafranca**
- **Tutor(a)(es): Juan Julián Merelo Guervós**

## Índice

- [Índice](#índice)
- [Instalación](#instalación)
  - [Creación de un entorno virtual](#creación-de-un-entorno-virtual)
  - [Instalación de la interfáz de línea de comandos](#instalación-de-la-interfáz-de-línea-de-comandos)
  - [Instalación de módulos extras](#instalación-de-módulos-extras)
- [Ejecución de test y otras utilidades](#ejecución-de-test-y-otras-utilidades)
- [Frameworks](#frameworks)
- [Utilidades](#utilidades)
- [Licencia](#licencia)

---

## Instalación

Como primer requisito, se debe de tener [Python 3.7][python-downloads-url] y
[pip] instalados en el sistema. Es muy recomendable crear un
entorno virtual para aislar correctamente las versiones de los paquetes que se
vayan a utilizar. Para más información sobre [pip] y [venv] consultar el
[tutorial oficial][python-venv-pip-guide-url].

### Creación de un entorno virtual

First, you need to install a version of python that's been compiled
with `-fPIC`. `pyenv` versions by default are not, so you will need to
issue something like this:

```shell
env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.7.9
```

We can then use a core module to create the virtual environment, it's been
working since version 3.3

```shell
python3.7 -m venv .venv
```

Así habríamos creado un entorno virtual en el directorio `.venv`. Una vez
instalado el entorno virtual, deberemos activarlo. Para ello hay que ejecutar
uno de los siguientes comandos dependiendo del interprete de órdenes que se
use (tabla obtenida de la documentación oficial de [venv]):

| Platform |      Shell      | Command to activate virtual environment |
| :------: | --------------: | --------------------------------------- |
|  POSIX   |        bash/zsh | `$ source <venv>/bin/activate`          |
|          |            fish | `$ . <venv>/bin/activate.fish`          |
|          |        csh/tcsh | `$ source <venv>/bin/activate.csh`      |
|          | PowerShell Core | `$ <venv>/bin/Activate.ps1`             |
| Windows  |         cmd.exe | `C:\> <venv>\Scripts\activate.bat`      |
|          |      PowerShell | `PS C:\> <venv>\Scripts\Activate.ps1`   |

Tabla 1.1: *Activación de entorno virtual.*

### Instalación de la interfáz de línea de comandos

Para ejecutar DeepGProp, primero hay que instalar su interfáz de línea de
comandos. Para ello, tras crear el entorno virtual, ejecutaremos:

```shell
pip install .
```

Si se quiere instalar en modo edición (para que los cambios realizados en el
código tengan efecto en la interfáz) será necesario añadir el indicador `-e`:

```shell
pip install -e .
```

Tras la instalación tendremos disponible el comando `dgp`. Puedes ejecutar lo
siguiente para obtener las opciones existentes:

```shell
dgp --help
```

### Instalación de módulos extras

He dividido los paquetes utilizados en el proyecto en distintos grupos para
evitar instalar librerías no deseadas si vamos a realizar tareas concretas
(como construir la documentación o ejecutar cierto módulo):

| Propósito                          | Ruta del archivo                     | Descripción                                                                                                             |
|------------------------------------|--------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| Producción                         | [`requirements/prod.txt`]            | Paquetes necesarios para ejecutar código asociado directamente a *DeepGProp*. El apartado anterior realiza esta acción. |
| Test                               | [`requirements/tests.txt`]           | Paquetes para ejecutar los tests. Si se usa [Nox], no será necesario instalar estos paquetes a mano.                    |
| Comparativa de Optimizadores       | [`requirements/hp_optimization.txt`] | Paquetes usados en la comparativa de optimizadores de hiper-parámetros.                                                 |
| Comparativa de Frameworks para MLP | [`requirements/mlp_frameworks.txt`]  | Paquetes usados en la comparativa de frameworks para redes neuronales.                                                  |

Para instalar cualquiera de los grupos de paquetes hay que ejecutar:

```shell
pip install -r <nombre archivo>
```

pudiendo sustituirse `<nombre archivo>` cualquiera de los anteriores. Si se
quisiera instalar los paquetes sin usar un entorno virtual (no recomendado)
se puede ejecutar el siguiente comando:

```shell
python3.7 -m pip install --user -r <nombre archivo>
```

Es el mismo comando pero precedido por `python3.7 -m` para evitar problemas
si tenemos otras versiones de Python instaladas en el sistema.

## Ejecución de test y otras utilidades

> **Nota:** Si se ha optado por usar un entorno virtual, debe ser activado
> usando uno de los comandos mostrados en la tabla de la sección de
> instalación antes de ejecutar cualquiera de los siguientes comandos.

Primero instalamos la herramienta [Nox]:

```shell
pip install -U nox
```

Para ejecutar los test:

```shell
nox -k test
```

Para pasar los distintos linters al código:

```shell
nox -k lint
```

Para mostrar todas las opciones disponibles:

```shell
nox -l
```

## Frameworks

- [Keras] - librería para la creación y ejecución de redes neuronales.

- [DEAP] - librería de construcción de algoritmos evolutivos. Se utilizará ésta
  para optimizar los parámetros de las redes neuronales.

En el capítulo 3 "El estado del arte" se podrá encontrar una comparativa
detallada con otras bibliotecas similares y el por qué de la elección de éstas.

## Utilidades

- Automatización:

  - [Nox] - herramienta de automatización para ejecutar procesos como la
    construcción de la documentación o el lanzamiento de tests.

- Tests:

  - [pytest] - librería de Python para la ejecución de test que se usarán en la
    integración continua.

## Licencia

El código original se puede encontrar en el repositorio de [DeepGProp].
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
