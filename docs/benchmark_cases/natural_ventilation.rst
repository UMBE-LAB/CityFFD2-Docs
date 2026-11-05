Natural Ventilation Around a Building Block
===========================================

This benchmark considers wind-driven natural ventilation through
a cubic building with two openings, based on the wind-tunnel
experiment of Jiang et al. (2003).

The case is used to validate the airflow predictions of CityFFD2.1,
particularly the velocity distribution inside and around the building.

A power-law inlet velocity profile is prescribed:

.. math::

   \frac{U(y)}{U_{\mathrm{ref}}}
   =
   \left(\frac{y}{y_{\mathrm{ref}}}\right)^{0.25}

The simulation results are compared with experimental measurements
at four streamwise locations:

``x = -3H``, ``x = -H/25``, ``x = H/2``, and ``x = H + H/25``.

The predicted velocity profiles show good agreement with the
experimental measurements, particularly in the windward region.
Larger deviations occur in the leeward region.


Validation Results
------------------

.. figure:: /_static/images/benchmark_cases/natural_ventilation/validation.png
   :width: 85%
   :align: center

   Comparison of mean velocity profiles between CityFFD2.1
   and experimental measurements at four streamwise positions.

.. figure:: /_static/images/benchmark_cases/natural_ventilation/Q.png
   :width: 85%
   :align: center
   
   Vortex structures with Q = 2000

Reference
---------

Jiang, Y., Alexander, D., Jenkins, H., Arthur, R., and Chen, Q.
(2003). Natural ventilation in buildings: Measurement in a wind
tunnel and numerical simulation with large-eddy simulation.
*Journal of Wind Engineering and Industrial Aerodynamics*,
91, 331–353.

