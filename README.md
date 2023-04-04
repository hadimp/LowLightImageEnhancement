# Low-Light Image Enhancement
A modified implementation of the "LIME" algorithm for improving the visibility of low-light images.

Images taken in low-light conditions suffer from low visibility. This problem degrades the visual aesthetics of those images and damages the performance of machine vision methods that use those images. To solve this problem, using the retinex model, I will estimate an illumination map. This illumination map can be further refined using an iterative optimization solution proposed in [1] to create a robust tool for dealing with low-light images. This project aimed to recover the hidden information  buried in darker regions of the captured images, and it was achieved by implementing the LIME algorithm [1]. This project  enhanced the illumination of various challenging low-light pictures while preserving the structure and smoothing textural details.


References:


[1] Xiaojie Guo, Yu Li, and Haibin Ling, “LIME: Low-Light Image Enhancement via Illumination Map Estimation,” IEEE Transactions on Image Processing, vol. 26, pp. 982 993, 2017.

[2] The codes used for creating the D matrix and multiplying with it were not written by me and you can find it in the link below: 
https://github.com/estija/LIME/blob/master/multiplyd.m

[3] S. Boyd, N. Parikh, E. Chu, B. Peleato, and J. Eckstein, “Distributed optimization and statistical learning via the alternating direction method of multipliers,” Foundations and Trends in Machine Learning, vol. 3, no. 1, pp. 1–122, 2011. [Online]. Available: http://dx.doi.org/10.1561/2200000016

