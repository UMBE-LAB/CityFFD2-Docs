Output and Monitoring Probes
============================

Configuration files: ``CityFFD.domain`` and ``Inp/CityFFD.probe``.

Field-output settings are defined in ``CityFFD.domain``. Probe
locations, sampling intervals, and the monitoring window are specified
in ``Inp/CityFFD.probe``.


Field Output Controls
---------------------

The following parameters control the averaging period, output
frequency, output region, and file format.

.. list-table::
   :header-rows: 1
   :widths: 32 68

   * - Parameter
     - Description
   * - ``ave_sta_step``
     - Iteration at which field averaging begins. Set this value to
       exclude the initial transient from averaged results.
   * - ``out_wrt_interval``
     - Number of iterations between successive field outputs.
   * - ``i_min_out``, ``i_max_out``
     - Minimum and maximum grid indices of the output region along X.
   * - ``j_min_out``, ``j_max_out``
     - Minimum and maximum grid indices of the output region along Y.
   * - ``k_min_out``, ``k_max_out``
     - Minimum and maximum grid indices of the output region along Z.
   * - ``out_type``
     - Field-output format: ``0`` for binary ``.szplt`` (Tecplot) or
       ``1`` for binary ``.vtk`` (ParaView).


Field Output Region
-------------------

The output region is selected by grid indices rather than physical
coordinates. For each direction, the minimum index must not exceed
the maximum index; all indices must lie within the valid mesh output
range.

.. important::

   The output-region indices control which portion of the computed
   fields is saved. They do not change the computational domain.

.. note::
   
   Review these indices when changing the computational mesh to ensure
   that the intended region is saved.


Field Output Format
-------------------

Select the output format through ``out_type``:

.. list-table::
   :header-rows: 1
   :widths: 20 30 50

   * - ``out_type``
     - Format
     - Intended visualization software
   * - ``0``
     - Binary ``.szplt``
     - Tecplot
   * - ``1``
     - Binary ``.vtk``
     - ParaView


Monitoring Probes
-----------------

Probe settings are defined in ``Inp/CityFFD.probe``.

.. list-table::
   :header-rows: 1
   :widths: 32 68

   * - Parameter / field
     - Description
   * - ``start_iter``
     - Iteration at which probe monitoring begins.
   * - ``end_iter``
     - Iteration at which probe monitoring ends.
   * - ``pb_wrt_interval``
     - Number of iterations between successive probe outputs within
       the monitoring window.
   * - ``pb_numbers``
     - Number of probes. Must match the number of probe records.
   * - ``P_name``
     - Probe identifier. Assign a unique identifier to each probe.
   * - ``P_x``, ``P_y``, ``P_z``
     - Physical probe coordinates along X, Y, and Z, in metres.

Probe coordinates must use the same Cartesian coordinate system and
length units as the domain and building geometry. Place probes within
the fluid region and verify their locations after preprocessing.

Ensure that ``start_iter`` does not exceed ``end_iter`` and that the
monitoring window lies within the intended solver iteration range.

.. note::

   ``out_wrt_interval`` sets the field-output interval in
   ``CityFFD.domain``; ``pb_wrt_interval`` sets the probe-output interval
   in ``Inp/CityFFD.probe``. These are separate settings.

