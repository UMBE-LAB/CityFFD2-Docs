Migration from CityFFD2.0
==========================

This section summarizes the configuration changes required when migrating
an existing CityFFD2.0 case to CityFFD2.1.

Do not reuse an old configuration file without checking its parameter names,
boundary-condition codes, input files, and execution workflow.


Configuration Changes
---------------------

.. list-table::
   :header-rows: 1
   :widths: 27 30 43

   * - CityFFD2.0
     - CityFFD2.1
     - Required update
   * - ``LES_opt``
     - ``tur_opt``
     - Use the new key. The model codes 0, 1, and 2 retain their meanings.
   * - ``outputType``
     - ``out_type``
     - Use the new key: ``0`` for Tecplot ``.szplt`` and ``1`` for VTK ``.vtk``.
   * - Boundary-condition codes ``0`` through ``8``
     - Codes ``-1`` and ``1`` through ``6``
     - Translate each condition by its meaning, not by copying its old number.
   * - Inlet type encoded in a boundary-condition code
     - ``vel_type`` and profile parameters
     - Configure the velocity profile separately from the domain-face boundary type.
   * - ``thermal`` / ``CityBEM_iter``
     - ``Inp/CityFFD.ubem``
     - Select the coupling mode using ``ubem_type`` and check its thermal activation behaviour.
   * - ``GEMdata``
     - ``Inp/CityFFD.met``
     - Select the documented weather-file or WRF input source. No direct GEM-to-WRF equivalence is established.
   * - ``CityFFD.stl``
     - ``Inp/building.stl``
     - Use the supplied geometry filename and directory layout.
   * - Single ``CityFFD2.0`` executable
     - ``CityFFD_prepro`` and ``CityFFD_solver``
     - Use the two-stage preprocessing and solver workflow.


Boundary-Condition Code Translation
-----------------------------------

Boundary-condition codes changed between CityFFD2.0 and CityFFD2.1. Existing
cases must be updated by boundary meaning.

.. list-table::
   :header-rows: 1
   :widths: 52 24 24

   * - Boundary condition
     - CityFFD2.0
     - CityFFD2.1
   * - Farfield: Neumann / Dirichlet pressure condition
     - ``3`` / ``4``
     - ``1`` / ``2``
   * - Wall / wall-floor
     - ``5`` / ``6``
     - ``3`` / ``4``
   * - Pressure outlet / symmetry
     - ``7`` / ``8``
     - ``5`` / ``6``
   * - Periodic
     - ``-1``
     - ``-1``

.. important::

   Do not copy the old boundary-condition numbers directly into
   ``CityFFD.domain``. For example, a former wall code ``5`` now denotes
   a pressure outlet in CityFFD2.1.


Inlet Velocity Profiles
-----------------------

In CityFFD2.1, the velocity profile is selected separately using
``vel_type``:

.. list-table::
   :header-rows: 1
   :widths: 25 75

   * - ``vel_type``
     - Velocity profile
   * - ``0``
     - Uniform
   * - ``1``
     - Power law
   * - ``2``
     - Log law

The former CityFFD2.0 inlet codes ``0``, ``1``, and ``2`` do not have a
direct domain-face-code equivalent in CityFFD2.1.

.. warning::

   The unimplemented turbulent-inlet option in the older guide must
   **not** be mapped to ``vel_type = 2``. In CityFFD2.1, this value
   selects the logarithmic velocity profile.

See :doc:`boundary_conditions` for the current boundary-condition and
velocity-profile definitions.


Input Files and Execution Workflow
----------------------------------

Review the input-file locations and update the case directory structure
as described in :doc:`quick_start`.

In particular:

1. Place the building geometry at ``Inp/building.stl``.
2. Configure the meteorological source in ``Inp/CityFFD.met``.
3. Configure UBEM and thermal coupling through ``Inp/CityFFD.ubem``.
4. Prepare the case using ``CityFFD_prepro`` before running
   ``CityFFD_solver``.
5. Review the current output settings, including ``out_type``.
6. Check the startup settings in ``Inp/CityFFD.state`` before launching
   the solver. See :doc:`restart_checkpoint` for restart configuration.

.. note::

   The old ``GEMdata`` setting should not be treated as directly
   interchangeable with the new WRF input option. The supported
   meteorological input formats must be checked against the CityFFD2.1
   implementation.


Migration Checklist
-------------------

Before running a migrated case:

1. Update renamed parameters and remove obsolete input keys.
2. Translate all boundary-condition codes by their physical meanings.
3. Select the velocity profile using ``vel_type``.
4. Verify the geometry filename, mesh, domain extents, and coordinate system.
5. Confirm the selected meteorological input source and required files.
6. Review UBEM and thermal settings, as applicable.
7. Verify MPI/GPU configuration and output controls.
8. Configure the startup mode and run preprocessing before the solver.
9. Inspect the preprocessed geometry and check the initial simulation
   results before continuing with a full production run.

.. note::

   This section summarizes configuration changes documented between
   CityFFD2.0 and CityFFD2.1. It does not guarantee that an existing case can
   be migrated without additional validation.
