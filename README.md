=====================================================
# a-semi-convex-function-for-moving-force-identification
References:
H.L. Liu, Z.W. Luo and L.Yu*. A semi-convex function for both constant and time-varying moving force identification[J]. 
Mechanical Systems and Signal Processing, 2021, 146: 107062.   https://doi.org/10.1016/j.ymssp.2020.107062
=====================================================
The core files for this article include the following functions:

'semiconvex.m' is the main algorithm to handle inverse problem. Before using this function, the regularization tools by 
P. C. Hansen (https://people.compute.dtu.dk/pcha/Regutools/index.html) should be installed at first.

'ydhzrealdouble_force.m' the code for force simulation. 

'ydhzsbdouble_systemmatrix.m' the code for generating system matrix between moving forces and structural responses by time 
domain method. [Reference: S. S. Law, T. H. T. Chan and Q. H. Zeng, Moving force identi¯cation: A time domain method, J. Sound Vib. 
201(1) (1997) 1–22.]

'add_noise.m' the code for adding noise on structural responses.

'main_system_response_2' the code to saving structural responses at some interesting points.
