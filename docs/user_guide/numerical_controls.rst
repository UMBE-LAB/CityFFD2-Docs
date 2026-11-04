Domain and Numerical Settings
=============================

Configuration file: ``CityFFD.domain``.

``CityFFD.domain`` defines the computational-domain coordinates, 
reference height, time-control parameters, and major
numerical and physical-model settings used by CityFFD2.1.


Computational Domain
--------------------

The computational domain is defined by the minimum and maximum
coordinates in the X, Y, and Z directions.

.. list-table::
   :header-rows: 1
   :widths: 28 72

   * - Parameter
     - Description

   * - ``x_min``, ``x_max``
     - Minimum and maximum domain coordinates along X, in metres.

   * - ``y_min``, ``y_max``
     - Minimum and maximum domain coordinates along Y, in metres.

   * - ``z_min``, ``z_max``
     - Minimum and maximum domain coordinates along Z, in metres.

The corresponding domain lengths are

``Lx = x_max - x_min``

``Ly = y_max - y_min``

``Lz = z_max - z_min``

These domain lengths must be consistent with the values specified in
``Inp/CityFFD.cfd``.

The computational domain, building geometry, mesh, and probe locations
must use the same Cartesian coordinate system and length units.


Vertical Direction
------------------

The vertical direction is determined by the location of the floor
boundary.

The wall-floor boundary condition must be assigned to one of the
minimum-coordinate faces:

``BCx1``, ``BCy1``, or ``BCz1``.

For example,

.. code-block:: text

   BCy1 = 4

defines Y as the vertical coordinate.

The corresponding height above the floor is then

``h = y - y_min``.

Similarly, assigning the floor to ``BCx1`` or ``BCz1`` makes X or Z,
respectively, the vertical coordinate.

The selected vertical direction is used when interpreting reference
heights and height-dependent velocity profiles.

For the complete boundary-condition definitions, see
:doc:`boundary_conditions`.


Reference Height
----------------

The parameter ``L_ref`` specifies the reference height above the floor
at which the reference wind speed is defined.

.. list-table::
   :header-rows: 1
   :widths: 28 72

   * - Parameter
     - Description

   * - ``L_ref``
     - Reference height above the floor, in metres.

``L_ref`` must be consistent with the meteorological wind
data and with the selected velocity profile.


Time-Step Control
-----------------

The parameter ``CFL`` controls the simulation time step.

.. list-table::
   :header-rows: 1
   :widths: 28 72

   * - Parameter
     - Description

   * - ``CFL``
     - Courant-Friedrichs-Lewy number used to determine the simulation
       time step.

In CityFFD2.1, the CFL number is evaluated using the reference inflow
velocity and the minimum cell width in the two horizontal coordinate
directions.

The vertical cell width is not included in this definition.


Meteorological Hours and Iterations
-----------------------------------

.. list-table::
   :header-rows: 1
   :widths: 28 72

   * - Parameter
     - Description

   * - ``hour_num``
     - Number of meteorological hours to process.

   * - ``iter_num``
     - Number of solver iterations performed for each meteorological
       hour.

Currently,

.. code-block:: text

   hour_num = 1

must be used.

Sequential simulation of multiple meteorological hours is not currently
supported.

.. important::

   A meteorological hour identifies the weather conditions used for the
   simulation. It does not mean that the solver automatically simulates
   3600 seconds of physical time.

The physical simulation duration is determined by the accumulated time
steps over the solver iterations.


Ground Temperature Treatment
----------------------------

The parameter ``t_floor_EB`` controls the treatment of the ground
temperature.

.. list-table::
   :header-rows: 1
   :widths: 28 72

   * - Value
     - Description

   * - ``0``
     - Use the ground temperature provided by the meteorological input.

   * - Non-zero
     - Use the ground energy-balance calculation (haven't implemented yet).


Anthropogenic Heat Setting
--------------------------

The parameter ``anthropogenic_heat`` defines a temperature offset used
to prescribe the temperature of neighbouring buildings.

.. important::

   ``anthropogenic_heat`` represents a temperature difference. It is
   not a heat-flux boundary condition.


Kinematic Viscosity
-------------------

The parameter ``kin_visc`` specifies the kinematic viscosity of air.

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - Parameter
     - Description

   * - ``kin_visc``
     - Kinematic viscosity of air, in ``m^2/s``.


Subgrid-Scale Turbulence Model
------------------------------

The parameter ``tur_opt`` selects the subgrid-scale turbulence model.

.. list-table::
   :header-rows: 1
   :widths: 20 80

   * - ``tur_opt``
     - Model

   * - ``0``
     - No subgrid-scale model.

   * - ``1``
     - Smagorinsky model.

   * - ``2``
     - Vreman model.


SGS Model Coefficient
---------------------

The parameter ``Cs`` specifies the SGS model coefficient.

For the Smagorinsky model, ``Cs`` is the Smagorinsky coefficient.

For the Vreman model, the corresponding coefficient is calculated from
``Cs`` according to the CityFFD2.1 implementation.

