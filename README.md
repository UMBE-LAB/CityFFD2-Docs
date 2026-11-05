# CityFFD2 Documentation

This repository contains the documentation for **CityFFD2 (City Fast Fluid Dynamics version 2)**, a GPU-accelerated computational fluid dynamics (CFD) solver designed for high-resolution urban airflow and microclimate simulations.

The documentation is maintained using **Sphinx** and the **Read the Docs theme**.

**Access to this repository is restricted to authorized users.**

## Documentation Contents

The documentation includes:

- **Installation and Execution** — System requirements, runtime libraries, executable distribution, and execution instructions.
- **Benchmark Cases** — Validation examples, experimental measurements, and simulation input files.
- **User Guide** — Simulation configuration, computational domain, geometry and mesh, boundary conditions, MPI/GPU parallelization, and output settings.

## 1. Download the Documentation

Authorized users can download the documentation from the private GitHub repository:

https://github.com/UMBE-LAB/CityFFD2-Docs

### Option A: Clone with Git (Recommended)

First, ensure that your GitHub account has been granted access to the repository.

Clone the repository using SSH:

```bash
git clone git@github.com:UMBE-LAB/CityFFD2-Docs.git
cd CityFFD2-Docs
```

Alternatively, use HTTPS:

```bash
git clone https://github.com/UMBE-LAB/CityFFD2-Docs.git
cd CityFFD2-Docs
```

GitHub authentication is required. For HTTPS access, use an approved authentication method such as Git Credential Manager or a personal access token when prompted. GitHub account passwords cannot be used for Git operations over HTTPS.

### Option B: Download ZIP

If you do not use Git:

1. Sign in to GitHub with an authorized account.
2. Open the [CityFFD2-Docs repository](https://github.com/UMBE-LAB/CityFFD2-Docs).
3. Click **Code → Download ZIP**.
4. Extract the downloaded ZIP file.
5. Open a terminal in the extracted `CityFFD2-Docs` directory.

## 2. Install Documentation Dependencies

The documentation requires Python, Sphinx, and the packages listed in `requirements.txt`.

On Linux (Ubuntu recommended), ensure that Python 3, pip, and the Python virtual environment package are available.

For Ubuntu, these can be installed using:

```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv make
```

From the `CityFFD2-Docs` directory, create and activate a virtual environment:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

Install the required Python packages:

```bash
python -m pip install -r requirements.txt
```

Verify the Sphinx installation:

```bash
sphinx-build --version
```

## 3. Build the HTML Documentation

From the repository root directory, run:

```bash
cd docs
make html
```

Sphinx converts the `.rst` source files into HTML pages.

After a successful build, the generated website is located at:

```text
docs/_build/html/
```

The main page is:

```text
docs/_build/html/index.html
```

To rebuild the entire documentation from a clean state:

```bash
make clean
make html
```

## 4. Open the Documentation Locally

There are two ways to view the documentation in a web browser.

### Option A: Open the HTML File Directly

Open the generated `index.html` file using a browser.

On Ubuntu:

```bash
xdg-open _build/html/index.html
```

This method does not require a web server.

### Option B: Start a Local Web Server (Recommended)

From the `docs` directory, run:

```bash
python3 -m http.server 8000 --bind 127.0.0.1 --directory _build/html
```

Then open the following address in your browser:

**http://localhost:8000**

The documentation website will be available locally with its navigation menu, internal links, figures, and downloadable files included in the HTML build.

Press `Ctrl+C` in the terminal to stop the server.

If port `8000` is already in use, replace it with another port, such as `8003`.

## 5. Update and Rebuild

If the documentation was cloned using Git, authorized users can retrieve the latest changes by running:

```bash
cd CityFFD2-Docs
git pull
```

Then activate the Python environment and rebuild:

```bash
source .venv/bin/activate
cd docs
make html
```

Refresh the browser to view the updated documentation.

If the requirements have changed, reinstall them using:

```bash
python -m pip install -r requirements.txt
```

## 6. Repository Structure

```text
CityFFD2-Docs/
├── .readthedocs.yaml
├── requirements.txt
├── README.md
└── docs/
    ├── conf.py
    ├── index.rst
    ├── installation.rst
    ├── user_guide/
    ├── benchmark_cases/
    ├── _static/
    ├── _templates/
    └── _build/               # Generated after building
```

The `docs/` directory contains the Sphinx source files. The `_build/html/` directory is generated automatically and does not need to be committed to Git.

## 7. CityFFD2 Executable

This repository contains documentation only and does not include the CityFFD2 solver source code.

CityFFD2 is distributed separately as a precompiled executable to authorized users.

The solver requires a compatible runtime environment, including NVIDIA HPC SDK, CUDA, Open MPI, NCCL, TecIO, and HDF5.

Please refer to the **Installation and Execution** section of the locally built documentation for details.

**Note:** Building this documentation does not compile or install the CityFFD solver.

## 8. Access and Distribution

This repository is intended for authorized users and collaborators.

The documentation, benchmark resources, and any associated materials must be used in accordance with the applicable distribution permissions and third-party licenses.

Access to the documentation repository does not automatically grant permission to access, modify, or redistribute the CityFFD solver source code or executable.

## Project

**Urban Microclimate and Building Energy (UMBE) Laboratory**

GitHub Organization: https://github.com/UMBE-LAB
