# GGBPL

## Introduction
This paper considers a class of multiblock nonconvex and nonsmooth optimization problems arising in many practical applications. Existing methods construct proximal linearized operators or their variants within standard Euclidean geometry to solve this class of problems, forcing their block variable updates to rely exclusively on the standard inner product and its induced norm. Nevertheless, this construction fails to capture the geometric structure of the target problem, particularly the local geometry and scaling information of each block subproblem, leading to low numerical efficiency. To overcome these drawbacks, we propose a generalized geometry proximal linearized operator for updating block variables, and develop the Generalized Geometry Block Proximal Linearized (GGBPL) method based on this operator. Compared with existing proximal linearized operators, the proposed operator allows the block surrogate functions to be constructed using arbitrary inner products and general admissible metrics, thereby enabling the GGBPL method to adapt its updates to the geometric structure of various target problems. We also introduce the inertial version of GGBPL, named the inertial GGBPL (iGGBPL) method. We further establish a new unified convergence framework under this generalized geometry, within which we prove that our methods guarantee convergence of the objective function values, establish global convergence of the generated sequence to a critical point, and derive the convergence rate of our methods. We apply our methods to two nonconvex and nonsmooth problems: sparse nonnegative matrix factorization with $\ell_0$-constraints and sparse nonnegative CP decomposition with $\ell_0$-constraints. Numerical results demonstrate the superior numerical performance of our proposed methods over several state-of-the-art methods.

This package contains code for the sparse nonnegative matrix factorization with $\ell_0$-constraints ($\ell_0$-SNMF) problem and the sparse nonnegative CP decomposition with $\ell_0$-constraints ($\ell_0$-SNCP) problem in the paper[<sup>1</sup>](#refer-id).

## Matlab code
A toy example explains how to use the these function. For "L0SNMF", before running it, first add the toolbox 'prettyAxes' to the running path of matlab, and then run the function '[main_Run_me.m](L0SNMF/main_Run_me.m)'.

For "L0SNCP", before running it, first add the toolboxes 'tensortoolbox'[<sup>2</sup>](#refer-id) (www.tensortoolbox.org) and 'prettyAxes' to the running path of matlab, and then run the function '[main_Run_me.m](L0SNCP/main_Run_me.m)'.

The Statistics and Machine Learning Toolbox is also required by the result summary in both examples.

## Data
This code has built-in the data mentioned in our paper[<sup>1</sup>](#refer-id).

## Reference
<div id="refer-id"></div>

[1] Weifeng Yang. Generalized Geometry Block Proximal Linearized Method for Multiblock Nonconvex and Nonsmooth Optimization.

[2] Brett W. Bader and Tamara G. Kolda. 2006. Algorithm 862: MATLAB tensor classes for fast algorithm prototyping. ACM Trans. Math. Softw. 32, 4 (December 2006), 635–653. https://doi.org/10.1145/1186785.1186794
