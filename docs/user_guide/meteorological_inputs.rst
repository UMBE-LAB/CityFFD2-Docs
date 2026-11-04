Meteorological Inputs
=====================

Configuration files: ``Inp/CityFFD.met`` and ``Inp/CityFFD.weather``.

Meteorological inputs provide the reference wind conditions and
other environmental data required by the simulation.


Meteorological Data Source
--------------------------

The meteorological data source is selected in ``Inp/CityFFD.met``.

.. list-table::
   :header-rows: 1
   :widths: 32 68

   * - Parameter
     - Description
   * - ``met_source_type``
     - Meteorological data source: ``0`` = weather-file input;
       ``1`` = WRF output.
   * - ``met_file``
     - Name of the meteorological input file.

For weather-file input, set ``met_source_type = 0`` and place the
file specified by ``met_file`` in the ``Inp/`` directory.

For example:

.. code-block:: text

   met_source_type = 0
   met_file = CityFFD.weather

.. note::

   WRF input (``met_source_type = 1``) uses a separate data format.
   The weather-file format described below applies only to
   ``met_source_type = 0``.


Weather File Format
-------------------

The weather file contains a header followed by meteorological data
records. Preserve the column names and their order:

.. code-block:: text

   Date Time GHI Ta TD TG WS WD u v w RH

Each data record must provide the fields listed below.

.. list-table::
   :header-rows: 1
   :widths: 16 20 64

   * - Column
     - Unit / format
     - Description
   * - ``Date``
     - M/D/YYYY
     - Date associated with the meteorological record.
   * - ``Time``
     - H:MM
     - Time associated with the meteorological record.
   * - ``GHI``
     - W/m²
     - Global horizontal irradiance.
   * - ``Ta``
     - °C
     - Ambient air temperature.
   * - ``TD``
     - °C
     - Dew-point temperature.
   * - ``TG``
     - °C
     - Ground-surface temperature.
   * - ``WS``
     - m/s
     - Reference wind-speed magnitude.
   * - ``WD``
     - —
     - Wind-direction indicator. Its angular convention must match
       the meteorological reader.
   * - ``u``, ``v``, ``w``
     - m/s
     - Reference velocity components in the X, Y, and Z directions,
       respectively.
   * - ``RH``
     - %
     - Relative humidity.

The vertical velocity component depends on the selected vertical
coordinate direction: ``u`` for X, ``v`` for Y, or ``w`` for Z.

.. note::

   The presence of a meteorological field does not activate the corresponding 
   physical model by itself. Thermal activation is described in :doc:`thermal_coupling`.


Input Consistency
-----------------

When preparing meteorological input data:

1. Ensure that the reference wind speed and velocity components are
   consistent. When ``WS`` denotes the magnitude of the three-dimensional
   velocity vector, it satisfies

   .. math::

      WS = \sqrt{u^2 + v^2 + w^2}.

2. For height-dependent velocity profiles, ensure that the reference
   wind conditions correspond to the height specified by ``L_ref``.

3. Express ``u``, ``v``, and ``w`` in the same Cartesian coordinate
   system as the computational domain.

4. When changing the wind direction, update the velocity components
   and ``WD`` consistently.

5. Preserve all required columns, including fields not used by the
   selected physical models.

6. Use the date and time formats expected by the meteorological reader.

