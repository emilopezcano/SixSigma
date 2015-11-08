\name{ss.cc.constants}
\alias{ss.cc.constants}
\alias{ss.cc.getc4}
\alias{ss.cc.getd2}
\alias{ss.cc.getd3}
\title{Functions to find out constants of the relative range distribution.}
\usage{
ss.cc.getd2(n = NA)
}
\arguments{
  \item{n}{Sample size}
}
\value{
A numeric value for the constant.
}
\description{
These functions compute the constants d2, d3 and c4 to get
estimators of the standard deviation to set control limits.
}
\examples{
ss.cc.getd2(20)
ss.cc.getd3(20)
ss.cc.getc4(20)
}
\author{
EL Cano
}
\references{
Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andres.
2012. \emph{Six Sigma with {R}. Statistical Engineering for
Process Improvement}, Use R!, vol. 36. Springer, New York.
\url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.
}
\seealso{
ss.cc
}
\keyword{charts}
\keyword{constants}
\keyword{control}

