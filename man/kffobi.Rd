\name{kffobi}
\alias{kffobi}
\title{Smoothed functional ICA in terms of principal components}
\description{
 This function computes the ordinary ICA procedure from a penalized principal component expansion (also known as Karhunen-Loeve expansion) whose eigenbasis is expressed in terms of basis functions (Fourier, B-splines...). The estimation method is based on the use of fourth moments (kurtosis), in which it is assumed that the independent components have different kurtosis values. The proposed algorithm can be considered an extension of the functional ICA proposed in Li et al. (2019).}
\usage{
kffobi(fdx, ncomp = fdx$basis$nbasis, eigenfPar = fdPar(fdx),
       pr = c("fdx", "fdx.st", "KL", "KL.st"),
       shrinkage = FALSE, center = FALSE, plotfd = FALSE)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fdx}{a functional data object obtained from the \strong{fda} package.}
  \item{ncomp}{number of independent components to compute.}
  \item{eigenfPar}{a functional parameter object, obtained from the \strong{fda} package, that defines the principal component functions to be estimated.}
  \item{pr}{the functional data object to project  into the space spanned by the eigenfunctions of the kurtosis operator.  To compute the independent components, the usual procedure is to use \code{KL.st}, the standardized principal component expansion. Thus, if \code{pr} is not supplied, \code{KL.st} is used.}
  \item{shrinkage}{uses shrinkage estimators to compute the covariance matrix of the coordinate vectors.}
  \item{center}{a logical value indicating whether the mean function has to be subtracted from each functional observation.}
  \item{plotfd}{a logical value indicating whether to plot the eigenfunctions \cr of the kurtosis operator.}}
\details{Note that \code{kffobi} first computes the (penalized) functional PCA; see Aguilera and Aguilera-Morillo (2013) for a detailed discussion. Thus,  this functional ICA consists of performing the multivariate ICA of the PC coordinate vectors in terms of the PC weight functions.}

\value{a list with the following named entries:
\item{PCA.eigv}{a numeric vector giving the eigenvalues of the covariance operator.}
\item{PCA.basis}{a functional data object for the eigenfunctions of the covariance operator.}
\item{PCA.scores}{a matrix whose column vectors are the principal components.}
\item{ICA.eigv}{a numeric vector giving the eigenvalues of the kurtosis operator.}
\item{ICA.basis}{a functional data object for the eigenfunctions of the covariance operator.}
\item{ICA.scores}{a matrix whose column vectors are the projection coefficients for \code{fdx, fdx.st, KL} or \code{KL.st}.}
\item{ICA.kurtosis}{a numeric vector giving the kurtosis of each component vector.}
}
\references{
Aguilera, AM. and MC. Aguilera-Morillo (2013). Penalized PCA approaches for B-spline expansions of smooth functional data. \emph{Applied Mathematics and Computation} 219(14), pp. 7805–7819.

Li, B., G. Van Bever, H. Oja, R. Sabolova and F. Critchley (2019). \emph{Functional independent component analysis: an extension of the fourth-orderblind identification}. Technical Report, Univ. Namur.

Miettinen, J., K. Nordhausen and S. Taskinen (2017). Blind source separation based on joint diagonalization in R: The packages JADE and BSSasymp. \emph{Journal of Statistical Software} 76(2), pp. 1–31.

}
\author{Marc Vidal, Ana Mª Aguilera}
\seealso{\code{\link{kd}}, \code{\link{ffobi}}}
\examples{
\donttest{
## foetal_ecg data
library(fda)
dataset <- matrix(
  scan("https://www.jstatsoft.org/index.php/jss/article/downloadSuppFile/v076i02/foetal_ecg.dat"),
  2500, 9, byrow = TRUE);
X <- dataset[1:1000, 2:9]
arg <- 1:1000
basis <- create.fourier.basis(rangeval=c(min(arg), max(arg)), nbasis=301, basisvalues=TRUE)
x <- Data2fd(X, argvals=arg, basis)
## Penalization can be considered:
#Lfdobj <- vec2Lfd(c(0,(2*pi/diff(4))^2,0), 4)
#hm <- fdPar(basis, Lfdobj, lambda=2)
## Select the number of components with the kurtosis distance:
#kurt.dist <- kd(x, qmax = 8)
aci <- kffobi(x, 7, plotfd = TRUE)
}}

\keyword{functional ICA}
