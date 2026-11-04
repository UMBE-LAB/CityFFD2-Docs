Boundary Conditions and Velocity Profiles
=========================================

Configuration file: ``CityFFD.domain``.

Boundary conditions and inlet velocity profiles are configured in
``CityFFD.domain``. The parameters ``BCx1`` through ``BCz2`` specify
the boundary type on each domain face, while ``vel_type`` selects the
prescribed velocity profile.


Domain Boundary Faces
---------------------

The computational domain has six boundary faces. The suffix ``1``
denotes the minimum-coordinate face, and the suffix ``2`` denotes
the maximum-coordinate face.

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - Parameter
     - Boundary location
   * - ``BCx1`` / ``BCx2``
     - Minimum / maximum X face.
   * - ``BCy1`` / ``BCy2``
     - Minimum / maximum Y face.
   * - ``BCz1`` / ``BCz2``
     - Minimum / maximum Z face.


Boundary Condition Types
------------------------

Each domain face is assigned a boundary-condition code according to
the following definitions.

.. list-table::
   :header-rows: 1
   :widths: 15 85

   * - Code
     - Boundary condition
   * - ``-1``
     - Periodic.
   * - ``1``
     - Farfield with a Neumann pressure boundary condition.
   * - ``2``
     - Farfield with a Dirichlet pressure boundary condition.
   * - ``3``
     - Wall (no-slip).
   * - ``4``
     - Wall-floor (no-slip).
   * - ``5``
     - Pressure outlet.
   * - ``6``
     - Symmetry.

For farfield boundaries, Neumann and Dirichlet refer to the pressure
boundary condition.


Floor Boundary
--------------

The wall-floor condition (``code = 4``) must be assigned to one of
the minimum-coordinate faces: ``BCx1``, ``BCy1``, or ``BCz1``.

The selected floor boundary determines the vertical coordinate
direction, as described in :doc:`numerical_controls`.

The height above the floor is then determined by the selected vertical
coordinate.


Velocity Profile Selection
--------------------------

The parameter ``vel_type`` determines how the prescribed wind velocity
varies with height.

.. list-table::
   :header-rows: 1
   :widths: 20 30 50

   * - ``vel_type``
     - Profile
     - Parameters
   * - ``0``
     - Uniform
     - Constant velocity with height.
   * - ``1``
     - Power law
     - ``pow_u`` and ``L_ref``.
   * - ``2``
     - Log law
     - ``z0`` and ``L_ref``.


Uniform Velocity Profile
------------------------

For ``vel_type = 0``, the prescribed wind velocity does not vary
with height.

The reference velocity is specified by the meteorological input.


Power-Law Velocity Profile
--------------------------

For ``vel_type = 1``, the wind velocity magnitude is prescribed as

.. math::

   U(h) = U_{\mathrm{ref}}
   \left(\frac{h}{L_{\mathrm{ref}}}\right)^{\mathrm{pow\_u}}

where:

* ``h``: Height above the floor, in metres.
* ``U_ref``: Reference wind speed from the meteorological input,
  in metres per second.
* ``L_ref``: Reference height above the floor, in metres.
* ``pow_u``: Dimensionless power-law exponent.

For example,

.. code-block:: text

   vel_type = 1
   pow_u = 0.25

The power-law exponent determines how rapidly the prescribed mean
wind speed changes with height.


Log-Law Velocity Profile
------------------------

For ``vel_type = 2``, a logarithmic velocity profile is prescribed
to represent a neutral atmospheric boundary layer.

With zero displacement height, the profile is expressed as

.. math::

   U(h) =
   \frac{u^*}{\kappa}
   \ln\left(\frac{h+z_0}{z_0}\right)

where ``u*`` is the friction velocity and ``kappa`` is the von Karman
constant.

The friction velocity is determined from the reference wind speed
and reference height:

.. math::

   u^* =
   \frac{\kappa U_{\mathrm{ref}}}
   {\ln\left(\frac{L_{\mathrm{ref}}+z_0}{z_0}\right)}

Substituting this expression gives

.. math::

   U(h) = U_{\mathrm{ref}}
   \frac{\ln\left(\frac{h+z_0}{z_0}\right)}
   {\ln\left(\frac{L_{\mathrm{ref}}+z_0}{z_0}\right)}

where:

* ``h``: Height above the floor, in metres.
* ``U_ref``: Reference wind speed from the meteorological input,
  in metres per second.
* ``L_ref``: Reference height above the floor, in metres.
* ``z0``: Aerodynamic roughness length, in metres.
* ``u*``: Friction velocity, in metres per second.

The aerodynamic roughness length characterizes the effect of the
upstream terrain. It is not the computational mesh spacing or a
direct measure of building height.

Specify positive values for ``z0`` and ``L_ref``. The reference
height must correspond to the height at which the meteorological
reference wind speed is defined.

The normalized velocity profile satisfies

.. math::

   U(L_{\mathrm{ref}}) = U_{\mathrm{ref}}

.. note::

   This profile represents mean velocity under neutral atmospheric
   conditions. It does not include atmospheric stability corrections
   or explicitly prescribe turbulent velocity fluctuations.
