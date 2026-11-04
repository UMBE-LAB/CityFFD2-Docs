Parallel and GPU Configuration
==============================

Configuration file: ``Inp/CityFFD.cfg``.

``Inp/CityFFD.cfg`` defines the MPI domain decomposition, CPU thread
settings, and CUDA thread-block dimensions used by CityFFD2.1.


MPI Domain Decomposition
------------------------

CityFFD2.1 currently supports one-dimensional slab decomposition for
multi-GPU simulations.

The computational domain can be partitioned along the X, Y, and Z
directions. Only one of the three partition counts should be
greater than 1, while the other two remain equal to 1.

.. list-table::
   :header-rows: 1
   :widths: 28 22 50

   * - Parameter
     - Suggested setting
     - Description

   * - ``process_in_x``
     - ``1`` initially
     - Number of MPI partitions along the X direction.

   * - ``process_in_y``
     - ``1`` initially
     - Number of MPI partitions along the Y direction.

   * - ``process_in_z``
     - ``1`` initially
     - Number of MPI partitions along the Z direction.


The total number of MPI processes is

``process_in_x`` × ``process_in_y`` × ``process_in_z``.

CityFFD2.1 uses one GPU per MPI process. Therefore, the total number of
GPUs required is equal to the total number of MPI processes.

For a single-GPU simulation, use

.. code-block:: text

   process_in_x = 1
   process_in_y = 1
   process_in_z = 1

For example,

.. code-block:: text

   process_in_x = 4
   process_in_y = 1
   process_in_z = 1

partitions the domain along the X direction and requires four MPI
processes and four GPUs.

For multi-node simulations, the same product represents the total
number of GPUs across all participating compute nodes, not the number
of GPUs per node. Each MPI process must be assigned to a distinct GPU within its compute
node.

.. important::

   The number of MPI ranks specified when launching CityFFD2 must match
   the product of ``process_in_x``, ``process_in_y``, and
   ``process_in_z``.


CPU Thread Configuration
------------------------

The parameter ``threads_CPU`` specifies the number of CPU threads used
for OpenMP parallel regions.

.. list-table::
   :header-rows: 1
   :widths: 28 22 50

   * - Parameter
     - Suggested setting
     - Description

   * - ``threads_CPU``
     - Machine-dependent
     - Number of CPU threads available to each process.

The supplied value may be specific to the machine on which the case was
prepared. Select a value consistent with the CPU resources allocated to
the job.

If OpenMP environment variables are used, ensure that they are
consistent with ``threads_CPU``.


CUDA Thread-Block Configuration
-------------------------------

The following parameters define the CUDA thread-block dimensions used
by the main solver kernels.

.. list-table::
   :header-rows: 1
   :widths: 32 22 46

   * - Parameter
     - Suggested setting
     - Description

   * - ``thread_in_x``
     - ``8``
     - CUDA thread-block dimension along X.

   * - ``thread_in_y``
     - ``4``
     - CUDA thread-block dimension along Y.

   * - ``thread_in_z``
     - ``8``
     - CUDA thread-block dimension along Z.


The default block therefore contains

**8 × 4 × 8 = 256 threads**.


TDMA Thread-Block Configuration
-------------------------------

The TDMA solver uses a separate CUDA thread-block configuration.

.. list-table::
   :header-rows: 1
   :widths: 32 22 46

   * - Parameter
     - Suggested setting
     - Description

   * - ``thread_in_x_pascal``
     - ``32``
     - CUDA thread-block dimension along X for the TDMA solver.

   * - ``thread_in_y_pascal``
     - ``16``
     - CUDA thread-block dimension along Y for the TDMA solver.


This configuration contains

**32 × 16 = 512 threads**.

Both the general and TDMA thread-block configurations remain below the
1024-thread-per-block limit. Device-specific kernel and dimension limits
must also be respected.

