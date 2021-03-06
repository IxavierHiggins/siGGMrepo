% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SCFC.R
\name{SCFC}
\alias{SCFC}
\title{Fit the model parameters}
\usage{
SCFC(y, P, siglam = 10, sigmu = 5, maxits = 500, method = "glasso",
  etaInd = 1, mu_init = NULL, a0_init = 30, b0_init = 5, c0 = NULL,
  cov_init = NULL, alpha_init = NULL, outerits, eps = 1e-04)
}
\arguments{
\item{y}{T (timepoints) by p (regions of interest) matrix-valued timecourse data.}

\item{P}{p by p matrix of structural connectivity weights}

\item{siglam}{Variance parameter for shrinkage parameters.}

\item{sigmu}{Variance parameter for prior on non-anatomical source of variation in functional connectivity}

\item{maxits}{Maximum number of iterations.}

\item{method}{Method for updating the inverse covariance matrix. The two options are 'glasso', which implements the graphical lasso of Friedman et al (2007), or 'QUIC' which implements the QUIC}

\item{etaInd}{Argument to indicate the inclusion (etaInd=1) or exclusion (etaInd=0) of the structural connectivity information in the estimation procedure.}

\item{mu_init}{Mean of the prior distribution on non-anatomical source of variation in functional connectivity}

\item{a0_init}{Scale parameter of the gamma prior prior parameter for eta parameter. Ensure a0_init>1}

\item{b0_init}{Shape parameter of the gamma prior prior parameter for eta parameter.}

\item{c0}{Tuning parameter controlling overall network sparsity}

\item{cov_init}{If an initial p by p covariance matrix is known, specify it here.  The default is NULL.}

\item{alpha_init}{If edge-specific shrinkage values are known, please specify here.  This object must be a p by p matrix but is not required for the function to produce estimates.}

\item{outerits}{The number of outer iterations allowed for each update of the inverse covariance matrix.  Value is ignored if method='glasso'}

\item{eps}{Convergence criteria.  Default is 1e-4}
}
\value{
A list with components
\item{Omega}{Estimated inverse covariance matrix (p by p matrix)}
\item{Covariance}{Estimated covariance matrix (p by p matrix)}
\item{lambda}{Estimates of the anatomically informed shrinkage factor at each edge (p by p matrix)}
\item{Eta}{Scalar valued estimate of the average effect of structural connectivity on functional connectivity}
\item{Method}{Method to estimate the inverse covariance matrix}
\item{iters}{Number of iterations until convergence criteria reached}
\item{Mu}{Estimate of the non-anatomical source of variation in functional connectivity at each edge}
\item{LogLike}{Penalized Log-likelihood at convergence}
\item{del}{The change in the objective function at covergence.}
\item{BIC}{The Bayesian Information Criterion.}
}
\description{
Estimates a sparse inverse covariance matrix where edge-specific shrinkage parameters are informed by the anatomical connectivity information
}
\details{
Estimates the anatomically-informed functional brain network via an edge-specific lasso penalty. The inverse covariance matrix is estimated via the graphical lasso (Friedman et al., 2007) or a quadratic approximation to the multivariate normal likelihood plus penalty (Hsieh et al., 2011)  The algorithm also estimates the functional network when the anatomical information is ignored.
}
\examples{
  fit<-SmallWorld(10,.15,100)
  y=as.matrix(fit$Data)
  covdat=cov(y)
  omegdat=solve(covdat)
  locs=which(abs(omegdat)>quantile(omegdat,probs=.8))
  temp=matrix(runif(100,0,1),10,10)
  SC=matrix(0,10,10)
  SC[locs]=temp[locs]
  diag(SC)=0
# Model fit
  fit<-SCFC(y,SC,method="QUIC",etaInd=1,siglam=10,sigmu=5,maxits=500,mu_init=0,a0_init=30,b0_init=6,c0=.5,outerits = 100);
}
\references{
Higgins, Ixavier A., Suprateek Kundu, and Ying Guo. Integrative Bayesian Analysis of Brain Functional Networks Incorporating Anatomical Knowledge. arXiv preprint arXiv:1803.00513 (2018).

Jerome Friedman, Trevor Hastie and Robert Tibshirani (2007). Sparse inverse covariance estimation with the lasso. Biostatistics 2007. http://www-stat.stanford.edu/~tibs/ftp/graph.pdf

Cho-Jui Hsieh, Matyas A. Sustik, Inderjit S. Dhillon, Pradeep Ravikumar. Sparse Inverse Covariance Matrix Estimation Using Quadratic Approximation. Advances in Neural Information Processing Systems, vol. 24, 2011, p. 2330–2338.
}
