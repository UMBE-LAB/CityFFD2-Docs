Geometry and Mesh
=================

Configuration files: ``Inp/CityFFD.cfd`` and ``Inp/building.stl``.

The building geometry and Cartesian mesh must be consistent with the
computational domain defined in ``CityFFD.domain``.

All geometry, mesh, and probe coordinates must use the same Cartesian
coordinate system and length units.


Building Geometry
-----------------

Building geometry is provided as a triangulated surface in ``Inp/building.stl``.

.. important::
   The STL surface should not contain holes, open edges, disconnedted surface patches,
   or other gaps that prevent the building volume from being fully enclosed.


Computational Mesh
------------------

The Cartesian mesh is defined in ``Inp/CityFFD.cfd``.

The file contains:

1. Domain lengths in the X, Y, and Z directions.
2. Numbers of control volumes in the X, Y, and Z directions.
3. Cell-width lists for the X, Y, and Z directions.

The domain lengths specified in ``Inp/CityFFD.cfd`` must be consistent
with the coordinate extents defined in ``CityFFD.domain``.


Cell Counts
-----------
The numbers of control volumes are specified in the X, Y, and Z directions.


The total number of control volumes is determined by

``Nx`` × ``Ny`` × ``Nz``.

This value includes cells occupied by solid geometry and therefore does
not represent the number of fluid cells alone. Additional ghost-cell storage is not included in this value.


Cell-Width Lists
----------------

CityFFD2.1 supports both uniform and nonuniform Cartesian meshes through
the directional cell-width lists.

The X-direction width list must contain exactly ``Nx`` values.

The Y-direction width list must contain exactly ``Ny`` values.

The Z-direction width list must contain exactly ``Nz`` values.

All cell widths must be positive.

For each direction, the sum of the cell widths must equal the
corresponding domain length:

``sum(dx) = Lx``

``sum(dy) = Ly``

``sum(dz) = Lz``


Mesh Resolution
---------------

Choose the mesh spacing according to the geometry and flow features
that need to be resolved.

Particular attention should be given to:

* Building openings.
* Narrow passages.
* Regions with strong velocity gradients.
* Near-wall regions.
* Geometric features that are important to the intended analysis.

The appropriate mesh resolution depends on the application and should
be assessed through appropriate mesh-sensitivity and solution-accuracy
checks.


Preparing or Modifying the Geometry and Mesh
--------------------------------------------

When preparing or modifying ``Inp/building.stl`` and ``Inp/CityFFD.cfd``:

1. Ensure that the building geometry is watertight and fully closed.

2. Verify that the geometry is correctly positioned within the
   computational domain.

3. Ensure that the domain lengths in ``Inp/CityFFD.cfd`` are
   consistent with those defined in ``CityFFD.domain``.

4. Verify that the number of cell widths in each direction matches
   the corresponding number of control volumes.

5. Ensure that the sum of the cell widths in each direction equals
   the corresponding domain length.

6. Check that the field-output index ranges in ``CityFFD.domain`` 
   are consistent with the computational mesh.

7. Verify that the probe coordinates are consistent with the
   geometry and computational domain.

8. Run ``CityFFD_prepro`` to generate the computational
   representation of the geometry.

9. Inspect the preprocessing results before launching
   ``CityFFD_solver``.
