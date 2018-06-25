#' @title Structurally Informed Gaussian Graphical Models
#'
#'
#' @description
#' siGGM is a collection of functions for estimating functional brain networks which are influenced by anatomical connectivity information. The two primary functions in this package are
#' SCFC and SCFCpath. SCFC will estimate one functional network structure when the user supplies a sparsity tuning parameter. SCFCpath will provide estimates along a grid of sparsity parameters.
#' This package also includes three functions for simulating precision matrices that retain small world, scale free, or Erdos-Renyi network properties.  For each, the user can control the density and network size.
#'
#' The approach relies on lasso (L1) penalty terms to impose sparsity on the network estimates, using either the approach of Friedman, Hastie and Tibshirani (2007) or Hsieh et al. (2011).
#'
#' @details
#' The following functions are included:
#'
#' \code{\link{SCFC}}, \code{\link{SCFCpath}}, \code{\link{SmallWorld}}, \code{\link{ScaleFree}}, \code{\link{ErdosRenyi}}
#'
#' @seealso
#'
#' NA
#'
#' @references Higgins, Ixavier A., Suprateek Kundu, and Ying Guo. Integrative Bayesian Analysis of Brain Functional Networks Incorporating Anatomical Knowledge. arXiv preprint arXiv:1803.00513 (2018).
#' @references Jerome Friedman, Trevor Hastie and Robert Tibshirani (2007). Sparse inverse covariance estimation with the lasso. Biostatistics 2007. http://www-stat.stanford.edu/~tibs/ftp/graph.pdf
#' @references Cho-Jui Hsieh, Matyas A. Sustik, Inderjit S. Dhillon, Pradeep Ravikumar. Sparse Inverse Covariance Matrix Estimation Using Quadratic Approximation. Advances in Neural Information Processing Systems, vol. 24, 2011, p. 2330–2338.
#' @references Csardi G, Nepusz T: The igraph software package for complex network research, InterJournal, Complex Systems 1695. 2006. \url{http://igraph.org}
#' @docType package
#' @author Ixavier A Higgins, Suprateek Kundu, Ying Guo
#'
#' Maintainer:  Ixavier A Higgins <\email{ihiggin@emory.edu}>
#'
#'
#' @name siGGM
#' @import glasso
#' @import QUIC
#' @import igraph
#' @importFrom stats rnorm runif
NULL
