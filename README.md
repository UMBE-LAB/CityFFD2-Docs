# CityFFD2 Documentation

CityFFD2 is a multi-GPU computational fluid dynamics (CFD) solver for urban airflow and heat transfer. This repository contains the Sphinx documentation for CityFFD2. It guides users through setting up the Linux executable, configuring a simulation, and comparing results with experimental measurements.

[Documentation home](docs/index.rst) · [Installation and execution](docs/installation.rst) · [Benchmark cases](docs/benchmark_cases/index.rst)

## 📖 Using CityFFD2

| If you want to… | Start here |
| --- | --- |
| Set up the solver | [Installation and execution](docs/installation.rst) covers the NVIDIA GPU, MPI runtime, and executable setup. The project maintainers distribute the precompiled solver separately to authorized users. |
| Run your first case | [Getting started](docs/user_guide/quick_start.rst) walks through the case directory, including `CityFFD.domain`, the `Inp/` folder, and the launch command. |
| Run on multiple GPUs | [Parallel and GPU configuration](docs/user_guide/parallel_gpu.rst) explains how to match the MPI process count to the domain decomposition and assign one GPU per process. |
| Compare a simulation with measurements | The [benchmark index](docs/benchmark_cases/index.rst) lists the case input packages and experimental data. |

### Benchmark cases

- **[Natural ventilation around a building block](docs/benchmark_cases/natural_ventilation.rst)** compares simulated airflow with experimental measurements for the natural ventilation case.
- **[High-rise building surrounded by low-rise buildings](docs/benchmark_cases/highrise_building.rst)** compares wind speeds at measurement points around the high-rise building.

## 📁 Repository layout

| Path | Purpose |
| --- | --- |
| `docs/index.rst` | Documentation homepage and navigation |
| `docs/installation.rst` | Solver installation and execution |
| `docs/user_guide/` | Instructions for setting up and running cases |
| `docs/benchmark_cases/` | Benchmark descriptions and validation results |
| `docs/_static/benchmarks/` | Downloadable benchmark inputs and reference data |
| `docs/conf.py` | Sphinx configuration |

## 🛠️ Build and preview the documentation

You can build the website on a machine with Python. GPU hardware and the CityFFD2 executable are only needed to run simulations.

From the repository root, create a virtual environment and install the documentation dependencies:

```bash
python3 -m venv .venv
source .venv/bin/activate
if [ -f docs/requirements.txt ]; then
    python -m pip install -r docs/requirements.txt
else
    python -m pip install -r requirements.txt
fi
```

Build the HTML pages and start a local preview:

```bash
python -m sphinx -b html docs docs/_build/html
python -m http.server 8000 --bind 127.0.0.1 --directory docs/_build/html
```

Open [the local documentation](http://127.0.0.1:8000/) in your browser. After editing a page, rerun the Sphinx build in a second terminal with the virtual environment active, then refresh the browser.

## 🤝 Contributing to the documentation

1. Create a branch for your changes and edit the relevant reStructuredText (`.rst`) files under `docs/`.
2. When adding a page, include it in the parent page’s `toctree` so readers can find it in the navigation.
3. Rebuild the site and review the affected pages in the local preview. For benchmark updates, check that figures render and that input and measurement files download from the benchmark index.
4. Open a pull request describing the change and how you checked it.