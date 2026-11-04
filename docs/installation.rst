Installation and Execution
==========================

CityFFD2.1 is distributed as a precompiled Linux executable for NVIDIA GPUs.
Users do not need to compile the solver from source code. The executable is
provided separately to authorized users.

System Requirements
-------------------

The executable must be run with compatible GPU drivers and runtime libraries.
The following table distinguishes the **build environment** from runtime
requirements. Versions not yet confirmed for the distributed binary should
be filled in using its release notes.

.. list-table:: Software and runtime requirements
   :header-rows: 1
   :widths: 26 27 47

   * - Component
     - Build version
     - Runtime requirement
   * - Operating system
     - **Linux**
     - A compatible Linux system and C/Fortran runtime libraries.
   * - NVIDIA HPC SDK
     - **23.9**
     - Matching or compatible NVIDIA HPC SDK runtime libraries, if linked.
   * - CUDA Toolkit
     - **12.2**
     - A binary built with CUDA 12.2 can typically run with CUDA 12.3 components.
   * - OpenMPI
     - **4.1.5**
     - Later Open MPI 4.1.x releases may be compatible, but must be tested with the distributed binary.
   * - TecIO
     - **2016**
     - TecIO shared libraries if required by dynamic linking; used for
       Tecplot output.
   * - HDF5
     - **1.10.5**
     - Compatible HDF5 shared libraries if dynamically linked; used for
       checkpoint and restart files.

Download the Executable
-----------------------

The CityFFD2.1 executable is distributed to authorized collaborators.
Request access from the project maintainers and download the appropriate
release package from the private distribution location.

.. note::

   When the private release repository is available, replace this note
   with its actual download URL. Do not place the executable under
   ``docs/_static/`` if it must remain restricted to authorized users.


Runtime Environment
-------------------

Before running CityFFD2.1, configure the required runtime
libraries using the provided environment script.

:download:`Download CityFFD_env.sh
</_static/downloads/CityFFD_env.sh>`

Edit the installation paths in the script according to
your local system configuration.

Then load the environment:

.. code-block:: bash

   source CityFFD_env.sh

Verify the runtime environment:

.. code-block:: bash

   mpirun --version
   ldd /path/to/CityFFD_solver

Running CityFFD2.1
------------------

Download and extract a benchmark input package from
:doc:`Benchmark Cases <benchmark_cases/index>`. The case directory should
contain ``CityFFD.domain`` and an ``Inp/`` directory containing the
configuration and mesh input files.

After setting up the runtime environment, start the executable from the
case directory. For a four-process example:

.. code-block:: bash

   cd /path/to/benchmark_case
   source /path/to/cityffd_env.sh
   mpirun -np 4 /path/to/CityFFD


See :doc:`Getting Started <user_guide/quick_start>` and
:doc:`Parallel and GPU Configuration <user_guide/parallel_gpu>` for
additional instructions.
