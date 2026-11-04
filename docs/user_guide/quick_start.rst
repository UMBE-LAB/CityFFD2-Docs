Getting Started
===============

Case Directory Structure
------------------------

A typical CityFFD 2.1 case uses the following files and directories.

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - Path relative to case root
     - Purpose

   * - ``CityFFD_prepro``
     - Preprocessing executable.

   * - ``CityFFD_solver``
     - Flow-solver executable.

   * - ``Inp/``
     - Directory for input data.

   * - ``Tag/``
     - Directory for preprocessing data.

   * - ``Out/``
     - Directory for simulation results.

   * - ``CityFFD.domain``
     - Main domain, numerical, boundary-condition, and output controls.

   * - ``Inp/CityFFD.cfg``
     - MPI process grid, CPU threads, and CUDA block sizes.

   * - ``Inp/CityFFD.cfd``
     - Cartesian domain lengths, cell counts, and cell-width lists.

   * - ``Inp/building.stl``
     - Triangulated building geometry.

   * - ``Inp/CityFFD.met``
     - Meteorological source selector and source filename.

   * - ``Inp/CityFFD.weather``
     - Meteorological records used to prescribe wind and environmental conditions.

   * - ``Inp/CityFFD.ubem``
     - UBEM selection and coupling filenames.

   * - ``Inp/CityFFD.probe``
     - Probe IDs, coordinates, and sampling window.

   * - ``Inp/CityFFD.state``
     - Startup mode, restart-file selection, and checkpoint settings.


Before the First Run
--------------------

1. Prepare a working directory for the simulation.

   Place ``CityFFD.domain`` in this directory.
   Place the required input files in the ``Inp/`` subdirectory.

   Create the ``Tag/`` and ``Out/`` subdirectories for preprocessing
   data and simulation results, respectively.

2. Place ``CityFFD_prepro`` and ``CityFFD_solver`` in the working
   directory, or create symbolic links to them.

   Ensure that both executables are compatible with the target system
   and have execute permissions.

3. Configure the simulation inputs and computational resources.

   Specify the domain, mesh, boundary conditions, physical models,
   meteorological inputs, and output settings in the corresponding
   input files.

   Set the MPI process counts and CPU/GPU thread settings in
   ``Inp/CityFFD.cfg``.

4. Configure the startup mode in ``Inp/CityFFD.state``.

5. From the working directory, run ``CityFFD_prepro`` to prepare the
   simulation data.

   Check that preprocessing completes successfully before launching
   ``CityFFD_solver``.

6. Launch ``CityFFD_solver``.

7. Monitor the simulation log and inspect the probe and flow-field
   outputs during and after the simulation.


