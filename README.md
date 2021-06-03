
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pfica: Functional Independent Component Analysis Techniques

<!-- badges: start -->

<!-- badges: end -->

This package contains a set of tools for performing functional
independent component analysis (FICA) by analyzing the kurtosis
structure of whitened data. Two FICA versions are considered depending
on the basis of expansion: `ffobi` computes the independent components
from a data representation in a canonical basis of functions, while
`kffobi` uses the eigenfunctions of the covariance operator (in terms of
basis functions). The application of penalties differs in both
algorithms. The former introduces a penalty in the eigenfunctions of the
kurtosis operator of a standardized sample; the latter in the
eigenfunctions of the covariance operator for a subsequent
standardization of the principal component expansion. This algorithm is
also extended using a discrete penalty (P-spline) in `pspline.kffobi`,
with this function being computationally more efficient. The current
FICA routines use Mahalanobis kernel whitening and shrinkage covariance
estimators to improve the outcomes in the estimation process. Our
methods are interfaced with the basis systems provided in the
[**fda**](https://CRAN.R-project.org/package=fda) package.

## Installation

You can install the released version of **pfica** from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("pfica")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("m-vidal/pfica")
```

## References

Vidal, M., M. Rosso and AM. Aguilera. (2021). Bi-Smoothed Functional
Independent Component Analysis for EEG Artifact Removal. Mathematics
9(11) 1243.
[DOI: 10.3390/math9111243](https://doi.org/10.3390/math9111243).
