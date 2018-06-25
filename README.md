![alt text](gui/cbis.png "CBIS")

# structurally informed Gaussian Graphical Model package (siGGM)

The structurally informed Gaussian Graphical Model (siGGM), is a R package provides a method for integrating structural connectivity (SC) information into the estimation of functional connectivity (FC). The package currently supports functional connectivity estimation as described in Higgins et al. (2018). 

## Usage

In R/RStudio, run the following code to download and install the package from the github repository:

```
install.packages("devtools")
library("devtools")
devtools::install_github("IxavierHiggins/siGGMrepo")
library(siGGM)
```

The R package provides examples of how to use the two primary functions, SCFC and SCFCpath. Both can be easily accessed with the following commands:

```
?SCFC
?SCFCpath
```

## Toolboxes Included

The siGGM package incorporates the structural connectivity information into the estimation of functional connectivity via two well-established R packages:
 
* [glasso] (https://CRAN.R-project.org/package=glasso) - Estimates FC using Coordinate block descent.
* [QUIC] (https://CRAN.R-project.org/package=QUIC) - Estimate FC using quadratic approximation.
* [igraph] (https://CRAN.R-project.org/package=igraph) - Used to simulate data under specified network structures.

## Version

siGGM is currently in version 0.1.0

## License



## References

Higgins, I. A., Kundu, S., & Guo, Y. (2018). Integrative Bayesian Analysis of Brain Functional Networks Incorporating Anatomical Knowledge. arXiv preprint arXiv:1803.00513.

Friedman, J., Hastie, T., & Tibshirani, R. (2008). Sparse inverse covariance estimation with the graphical lasso. Biostatistics, 9(3), 432-441.

Hsieh, C. J., Dhillon, I. S., Ravikumar, P. K., & Sustik, M. A. (2011). Sparse inverse covariance matrix estimation using quadratic approximation. In Advances in neural information processing systems (pp. 2330-2338).