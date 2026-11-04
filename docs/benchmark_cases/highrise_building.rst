High-Rise Building Surrounded by Low-Rise Buildings
===================================================

This benchmark corresponds to **Case D** of the Architectural Institute
of Japan (AIJ) urban wind environment database. A central high-rise
building is surrounded by regularly arranged low-rise city blocks.

The wind-tunnel model has a scale of 1:400. The central building is
``0.25H × 0.25H × H`` and the surrounding blocks are
``0.4H × 0.4H × 0.1H``, where ``H = 0.25 m`` is the central building
height. The incoming wind follows a power-law profile with exponent
``0.25``. The reference wind speed at ``H`` is ``6.65 m/s``, and the
experimental wind directions used here is ``0°``.

.. figure:: /_static/images/benchmark_cases/highrise_building/case_d_geometry.png
   :width: 50%
   :align: center
   :alt: High-rise building surrounded by low-rise city blocks

   Geometry of AIJ benchmark Case D (Idealized urban area).

Validation Results
------------------

Pedestrian-level wind speeds are measured ``5 mm`` above the model
ground (``2 m`` at full scale). The locations of the measurement
points around the central high-rise building are shown below.

.. figure:: /_static/images/benchmark_cases/highrise_building/case_d_measurement_points.png
   :width: 50%
   :align: center
   :alt: Measurement points around the central high-rise building

   Measurement-point layout.

The figure below shows a comparison of dimensionless wind
speeds between wind-tunnel measurements and CityFFD2.1.

.. figure:: /_static/images/benchmark_cases/highrise_building/case_d_validation.png
   :width: 80%
   :align: center
   :alt: Published comparison of dimensionless velocity at measurement points

   Comparison of dimensionless wind speed at measurement points

References
----------

* Kikumoto, H., et al. (2026). *Comprehensive Experimental Database for
  Validating CFD Simulations in Urban Wind Environment: Benchmark Cases
  Curated by the Architectural Institute of Japan*. Japan Architectural
  Review, 9, e70083.
  `Reference paper <https://doi.org/10.1002/2475-8876.70083>`_ |
  `Case D dataset <https://doi.org/10.5281/zenodo.15402668>`_.
