Numerical Methodology
=====================

Governing Equations
-------------------

CityFFD2 solves the incompressible Navier--Stokes equations.

The continuity equation is

.. math::

   \frac{\partial u_i}{\partial x_i} = 0.

The momentum equation is

.. math::

   \frac{\partial u_i}{\partial t}
   +
   u_j \frac{\partial u_i}{\partial x_j}
   =
   -\frac{1}{\rho}\frac{\partial p}{\partial x_i}
   +
   \nu \frac{\partial^2 u_i}{\partial x_j^2}.


Numerical Methods
-----------------

The main numerical methods include:

* Semi-Lagrangian advection
* Crank--Nicolson diffusion
* Fractional-step pressure coupling
* Pressure Poisson equation
* Rhie--Chow interpolation
* Vreman LES model
