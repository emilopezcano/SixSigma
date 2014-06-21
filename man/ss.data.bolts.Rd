\docType{data}
\name{ss.data.bolts}
\alias{ss.data.bolts}
\title{Data for the bolts example}
\format{A data frame with 50 observations on the following variable.
  \describe{
    \item{\code{diameter}}{a numeric vector with the diameter of the bolts}
  }}
\source{
See references.
}
\usage{
data(ss.data.bolts)
}
\description{
A data frame with 50 observations of the diameter of the
bolts manufactured in a production line.
}
\note{
This data set is used in chapter 4 of the book ``Six Sigma
with R'' (see References).
}
\examples{
data(ss.data.bolts)
summary(ss.data.bolts)
hist(ss.data.bolts$diameter)
}
\references{
Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés.
2012. \emph{Six Sigma with {R}. Statistical Engineering for
Process Improvement}, Use R!, vol. 36. Springer, New York.
\url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
}
\seealso{
\link{ss.lfa}
}
\keyword{data}
\keyword{lfa}

