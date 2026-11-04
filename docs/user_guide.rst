User Guide
==========

Computational Domain
--------------------

The computational domain is defined by its dimensions in the
three Cartesian directions.

Mesh
----

CityFFD supports Cartesian computational grids.

Boundary Conditions
-------------------

CityFFD2 supports several types of boundary conditions:

* Periodic
* Neumann
* Dirichlet
* Wall
* Floor
* Pressure outlet
* Symmetry


MPI and GPU Decomposition
-------------------------

The number of MPI processes is determined by

.. math::

   N_{\mathrm{MPI}} = N_x N_y N_z

where :math:`N_x`, :math:`N_y`, and :math:`N_z` are the numbers
of MPI subdomains in the three Cartesian directions.
