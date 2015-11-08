\docType{data}
\name{ss.data.rr}
\alias{ss.data.rr}
\title{Gage R&R data}
\format{A data frame with 27 observations on the following 5 variables.
  \describe{
       \item{\code{prototype}}{a factor with levels \code{prot #1}
	 \code{prot #2} \code{prot #3}}
    \item{\code{operator}}{a factor with levels \code{op #1} \code{op
	#2} \code{op #3}}
    \item{\code{run}}{a factor with levels \code{run #1} \code{run #2} \code{run #3}}
    \item{\code{time1}}{a numeric vector}
    \item{\code{time2}}{a numeric vector}
  }}
\source{
See references.
}
\usage{
data(ss.data.rr)
}
\description{
Example data for Measure phase of the Six Sigma
methodology.
}
\note{
This data set is used in chapter 5 of the book ``Six Sigma
with R'' (see References).
}
\examples{
data(ss.data.rr)
summary(ss.data.rr)
}
\references{
Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés.
2012. \emph{Six Sigma with {R}. Statistical Engineering for
Process Improvement}, Use R!, vol. 36. Springer, New York.
\url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
}
\keyword{data}
\keyword{msa}

