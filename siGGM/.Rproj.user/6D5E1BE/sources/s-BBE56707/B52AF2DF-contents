####
#  Scale Free Network Generation (precision matrix)
#
# p:          dimension of the network
# powerparm:  power parameter governing the preferential attachment model
#             -small values(random network); large values(increasingly scale free)
# numadd:     number of edges to add each iteration
# numT:       number of timepoints
#####


#' Generate Scale free precision matrix
#'
#' Estimate a precision matrix with a scale free network structure and simulate multivariate normal data.
#'
#' @param p            Dimension of network
#' @param powerparm    Power parameter governing the preferential attachment model.  Small values produce random networks while large values lead to scale free networks.
#' @param numadd       number of edges to add each iteration
#' @param numT         number of timepoints
#' @return
#' A list with components
#' \item{Precision}{Estimated p by p inverse covariance matrix}
#' \item{Data}{Data matrix containing the simulated time series for each region (numT by p data matrix)}
#'
#' @references Csardi G, Nepusz T: The igraph software package for complex network research, InterJournal, Complex Systems 1695. 2006. \url{http://igraph.org}
#' @examples
#' fit<-ScaleFree(40,1.2,3,200)
#' fit$Precision
#' fit$Data
#' @export

ScaleFree<-function(p, powerparm,numadd,numT){
  Results=list();
  grpobj<-sample_pa(p,power = powerparm,m=numadd,directed=FALSE)
  testgrh<-as.matrix(as_adjacency_matrix(grpobj, type = "both", attr = NULL,edges = FALSE, names = TRUE,sparse=FALSE))
  GrphT<-matrix(0,p,p)
  indices=which(testgrh[upper.tri(testgrh)]==1)
  GrphT[upper.tri(GrphT)][indices]=stats::rnorm(length(indices),mean=0,sd=.5)
  GrphT=GrphT+t(GrphT)

  diag(GrphT)=rowSums(abs(GrphT))+stats::runif(p,min=.1,max=1)

  prec2sigma=solve(GrphT)
  interm=eigen(prec2sigma)
  sqrtmat=interm$vectors%*%diag(sqrt(interm$values))%*%solve(interm$vectors)

  SMdat <- matrix(rnorm(numT * p), ncol=p) %*%sqrtmat
  Results$Precision=GrphT;
  Results$Data=SMdat;
  return(Results)

}






