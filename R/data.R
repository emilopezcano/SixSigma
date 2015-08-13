## Data documentation

#' Data for the batteries example
#' 
#' This is a simulated data set of 18 measurements of the voltage of batteries using different
#' voltmeters.
#' 
#' @format 
#' A data frame with 18 observations on the following 4 variables.
#'  \describe{
#'    \item{\code{voltmeter}}{a factor with levels \code{1} \code{2}}
#'    \item{\code{battery}}{a factor with levels \code{1} \code{2} \code{3}}
#'    \item{\code{run}}{a factor with levels \code{1} \code{2} \code{3}}
#'    \item{\code{voltage}}{a numeric vector}
#'  }
#' 
#' @note 
#' This data set is used in chapter 5 of the book ``Six Sigma with R'' (see 
#' References).
#' 
#' @references 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
#' 
#' @source See references.
#' @aliases ss.data.batteries
#' @usage data(ss.data.batteries)
#' @docType data
#' @keywords data msa
#' @name ss.data.batteries
#' @seealso \link{ss.rr}
#' @examples
#' data(ss.data.batteries)
#' summary(ss.data.batteries)
#' plot(voltage~voltmeter, data = ss.data.batteries)
#' 
NULL

#' Data for the bolts example
#' 
#' A data frame with 50 observations of the diameter of the bolts manufactured 
#' in a production line. 
#' 
#' @format 
#'  A data frame with 50 observations on the following variable.
#'   \describe{
#'     \item{\code{diameter}}{a numeric vector with the diameter of the bolts}
#'   }
#' 
#' @note 
#' This data set is used in chapter 4 of the book ``Six Sigma with R'' (see 
#' References).
#' 
#' @references 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
#'
#' @source See references.
#' @aliases ss.data.bolts
#' @usage data(ss.data.bolts)
#' @docType data
#' @keywords data lfa
#' @name ss.data.bolts
#' @seealso \link{ss.lfa}
#' @examples
#' data(ss.data.bolts)
#' summary(ss.data.bolts)
#' hist(ss.data.bolts$diameter)
#' 
NULL

#' Data for a filling process in a winery
#' 
#' The only field of the data is the volume measured in 20 bottles.
#' 
#' @format 
#'   A data frame with 20 observations on the following variable.
#'   \describe{
#'     \item{\code{Volume}}{a numeric vector (volume in cl}
#'   }
#' 
#' @note 
#' This data set is used in chapter 7 of the book ``Six Sigma with R'' (see 
#' References).
#' 
#' @references 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
#'
#' @source See references.
#' @aliases ss.data.ca
#' @usage data(ss.data.ca)
#' @docType data
#' @keywords data capability
#' @name ss.data.ca
#' @seealso \link{ss.study.ca}
#' @examples
#' data(ss.data.ca)
#' summary(ss.data.ca)
#' hist(ss.data.ca$Volume)
#' 
NULL

#' Pizza dough example data
#' 
#' Experimental data for the scores given to a set of pizza doughs.
#' 
#' @format 
#'  A data frame with 16 observations on the following 6 variables.
#'   \describe{
#'     \item{\code{repl}}{Replication id}
#'     \item{\code{flour}}{Level of flour in the recipe (\code{-} \code{+})}
#'     \item{\code{salt}}{Level of salt in the recipe (\code{-} \code{+})}
#'     \item{\code{bakPow}}{Level of Baking Powder in the recipe (\code{-} \code{+})}
#'     \item{\code{score}}{Scored assigned to the recipe}
#'     \item{\code{ord}}{Randomized order}
#'   }
#' 
#' @note 
#' This data set is used in chapter 11 of the book ``Six Sigma with R'' (see 
#' References).
#' 
#' @references 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
#'
#' @source See references.
#' @aliases ss.data.doe1
#' @usage data(ss.data.doe1)
#' @docType data
#' @keywords data doe
#' @name ss.data.doe1
#' @examples
#' data(ss.data.doe1)
#' summary(ss.data.doe1)
#' library(lattice)
#' bwplot(score ~ flour | salt + bakPow , 
#'  data = ss.data.doe1, 
#'  xlab = "Flour", 
#'  strip = function(..., style) strip.default(..., strip.names=c(TRUE,TRUE)))
#' 
NULL

#' Data for the pizza dough example (robust design)
#' 
#' Experimental data for the scores given to a set of pizza doughs. Noise factors added
#' for robust design.
#' 
#' @format 
#'    A data frame with 64 observations on the following 7 variables.
#'   \describe{
#'     \item{\code{repl}}{Replication id}
#'     \item{\code{flour}}{Level of flour in the recipe (\code{-} \code{+})}
#'     \item{\code{salt}}{Level of salt in the recipe (\code{-} \code{+})}
#'     \item{\code{bakPow}}{Level of Baking Powder in the recipe (\code{-} \code{+})}
#'     \item{\code{temp}}{Level of temperature in preparation (\code{-} \code{+})}
#'     \item{\code{time}}{Level of time in preparation (\code{-} \code{+})}
#'     \item{\code{score}}{Scored assigned to the recipe}
#'   }
#' 
#' @note 
#' This data set is used in chapter 11 of the book ``Six Sigma with R'' (see 
#' References).
#' 
#' @references 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
#'
#' @source See references.
#' @aliases ss.data.doe2
#' @usage data(ss.data.doe2)
#' @docType data
#' @keywords data doe
#' @name ss.data.doe2
#' @examples
#' data(ss.data.doe2)
#' summary(ss.data.doe2)
#' library(lattice)
#' bwplot(score ~ temp | time, data = ss.data.doe2)
#' 
NULL

#' Pastries data
#' 
#' A data frame with 18 observations of the amount of the CTQ compound in some
#' pastries from a bakery. There are two runs for each combination of two factors
#' (laboratory and batch).
#' 
#' @format 
#'   A data frame with 18 observations on the following 4 variables.
#'   \describe{
#'     \item{\code{lab}}{laboratory: a factor with levels \code{1} \code{2} \code{3}}
#'     \item{\code{batch}}{batch: a factor with levels \code{1} \code{2} \code{3}}
#'     \item{\code{run}}{identifies the run: a factor with levels \code{1} \code{2}}
#'     \item{\code{comp}}{proportion of the compound in the pastry: a numeric vector}
#'   }
#' 
#' @note 
#' This data set is used in chapter 5 exercises of the book ``Six Sigma with R'' (see 
#' References).
#' 
#' @references 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
#'
#' @source See references.
#' @aliases ss.data.pastries
#' @usage data(ss.data.pastries)
#' @docType data
#' @keywords data msa
#' @name ss.data.pastries
#' @examples
#' data(ss.data.pastries)
#' summary(ss.data.pastries)
#' library(lattice)
#' xyplot(comp ~ lab | batch, data = ss.data.pastries)
#' 
NULL

#' Particle Boards Example - Individual Data
#' 
#' Humidity of 30 raw material used to make particle boards for individual control chart.
#' 
#' @format 
#'   A data frame with 30 observations on the following 2 variables.
#'   \describe{
#'     \item{\code{pb.group}}{Group id (distinct for each observation)}
#'     \item{\code{pb.humidity}}{Humidity of the particle board}
#'   }
#' 
#' @note 
#' This data set is used in chapter 12 of the book ``Six Sigma with R'' (see 
#' References).
#' 
#' @references 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
#'
#' @source See references.
#' @aliases ss.data.pb1
#' @usage data(ss.data.pb1)
#' @docType data
#' @keywords data cc
#' @name ss.data.pb1
#' @examples
#' data(ss.data.pb1)
#' summary(ss.data.pb1)
#' library(qcc)
#' pb.groups.one <- with(ss.data.pb1, qcc.groups(pb.humidity, pb.group))
#' pb.xbar.one <- qcc(pb.groups.one, type="xbar.one")
#' summary(pb.xbar.one)
#' plot(pb.xbar.one)
#' 
NULL

#' Particle Boards Example - by Groups
#' 
#' Humidity of 20 groups of size 5 of raw materials to make particle boards. For the mean and range control chart.
#' 
#' @format 
#'   A data frame with 100 observations on the following 2 variables.
#'   \describe{
#'     \item{\code{pb.group}}{a numeric vector}
#'     \item{\code{pb.humidity}}{a numeric vector}
#'   }
#' 
#' @note 
#' This data set is used in chapter 12 of the book ``Six Sigma with R'' (see 
#' References).
#' 
#' @references 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
#'
#' @source See references.
#' @aliases ss.data.pb2
#' @usage data(ss.data.pb2)
#' @docType data
#' @keywords data cc
#' @name ss.data.pb2
#' @examples
#' data(ss.data.pb2)
#' summary(ss.data.pb2)
#' if (require(qcc)){
#'   pb.groups.xbar <- with(ss.data.pb2, qcc.groups(pb.humidity, pb.group))
#'   pb.xbar <- qcc(pb.groups.xbar, type="xbar")
#'   summary(pb.xbar)
#' } else {
#' message("qcc package is needed to run this example")
#' }
#' 
NULL

#' Particle Boards Example - Attribute data
#' 
#' Counts of raw materials stockouts during 22 weekdays in a month.
#' 
#' @format 
#'  A data frame with 22 observations on the following 3 variables.
#'   \describe{
#'     \item{\code{day}}{Day id}
#'     \item{\code{stockouts}}{Number of stockouts}
#'     \item{\code{orders}}{Number of orders}
#'   }
#' 
#' @note 
#' This data set is used in chapter 12 of the book ``Six Sigma with R'' (see 
#' References).
#' 
#' @references 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
#'
#' @source See references.
#' @aliases ss.data.pb3
#' @usage data(ss.data.pb3)
#' @docType data
#' @keywords data cc
#' @name ss.data.pb3
#' @examples
#' data(ss.data.pb3)
#' summary(ss.data.pb3)
#' if (require(qcc)){
#' with(ss.data.pb3,
#' 		plot(qcc(stockouts, orders, type ="p"))
#' 	)
#' } else {
#' message("qcc package is needed to run this example")
#' }
#' 
NULL

#' Data for Practicle Boards Example - number of defects
#' 
#' Number of defects detected in an order of particle boards.
#' 
#' @format 
#'  A data frame with 80 observations on the following 2 variables.
#'   \describe{
#'     \item{\code{order}}{Order id}
#'     \item{\code{defects}}{Number of defects}
#'   }
#' 
#' @note 
#' This data set is used in chapter 12 of the book ``Six Sigma with R'' (see 
#' References).
#' 
#' @references 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
#'
#' @source See references.
#' @aliases ss.data.pb4
#' @usage data(ss.data.pb4)
#' @docType data
#' @keywords data cc
#' @name ss.data.pb4
#' @examples
#' data(ss.data.pb4)
#' summary(ss.data.pb4)
#' 
NULL

#' Larger data set for the printer cartridges example
#' 
#' This data set contains data from a simulated process of printer cartridges filling with
#' complete replications.
#' 
#' @format 
#'  A data frame with 72 observations on the following 5 variables, 
#'   \describe{
#'     \item{\code{filler}}{a factor with levels \code{1} \code{2} \code{3}}
#'     \item{\code{batch}}{a factor with levels \code{1} \code{2} \code{3} \code{4}}
#'     \item{\code{col}}{a factor with levels \code{B} \code{C}}
#'     \item{\code{operator}}{a factor with levels \code{1} \code{2} \code{3}}
#'     \item{\code{volume}}{a numeric vector}
#'   }
#' 
#' @note 
#' This data set is used in chapter 8 of the book ``Six Sigma with R'' (see 
#' References).
#' 
#' @references 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
#'
#' @source See references.
#' @aliases ss.data.pc.big
#' @usage data(ss.data.pc.big)
#' @docType data
#' @keywords data charts
#' @name ss.data.pc.big
#' @examples
#' data(ss.data.pc.big)
#' summary(ss.data.pc.big)
#' 
NULL

#' Data set for the printer cartridge example, by region
#' 
#' This data set contains data from a simulated process of printer cartridge filling. 
#' The dataframe contains defects by region of each type of cartridge.
#' 
#' @format 
#' A data frame with 5 observations on the following 4 variables.
#'   \describe{
#'     \item{\code{pc.regions}}{a factor with levels \code{region.1} \code{region.2} \code{region.3} \code{region.4} \code{region.5}}
#'     \item{\code{pc.def.a}}{a numeric vector for defects type A}
#'     \item{\code{pc.def.b}}{a numeric vector for defects type B}
#'     \item{\code{pc.def}}{a numeric vector for total defects}
#'   }
#'   
#' @note 
#' This data set is used in chapter 8 of the book ``Six Sigma with R'' (see 
#' References).
#' 
#' @references 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
#'
#' @source See references.
#' @aliases ss.data.pc.r
#' @usage data(ss.data.pc.r)
#' @docType data
#' @keywords data charts
#' @name ss.data.pc.r
#' @examples
#' data(ss.data.pc.r)
#' summary(ss.data.pc.r)
#' 
NULL

#' Data set for the printer cartridge example
#' 
#' This data set contains data from a simulated process of printer cartridge filling.
#' 
#' @format 
#'  A data frame with 24 observations on the following 6 variables.
#'   \describe{
#'     \item{\code{pc.col}}{a factor with levels \code{C} \code{B} for the colour}
#'     \item{\code{pc.filler}}{a factor with levels \code{1} \code{2} \code{3}}
#'     \item{\code{pc.volume}}{a numeric vector}
#'     \item{\code{pc.density}}{a numeric vector}
#'     \item{\code{pc.batch}}{a numeric vector}
#'     \item{\code{pc.op}}{a factor with levels \code{A} \code{B} \code{C} \code{D} 
#'     for the operator}
#'   }
#'   
#' @note 
#' This data set is used in chapter 8 of the book ``Six Sigma with R'' (see 
#' References).
#' 
#' @references 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
#'
#' @source See references.
#' @aliases ss.data.pc
#' @usage data(ss.data.pc)
#' @docType data
#' @keywords data charts
#' @name ss.data.pc
#' @examples
#' data(ss.data.pc)
#' summary(ss.data.pc)
#' 
NULL

#' Gage R&R data
#' 
#' Example data for Measure phase of the Six Sigma methodology.
#' 
#' @format 
#'  A data frame with 27 observations on the following 5 variables.
#'   \describe{
#'        \item{\code{prototype}}{a factor with levels \code{prot #1}
#' 	 \code{prot #2} \code{prot #3}}
#'     \item{\code{operator}}{a factor with levels \code{op #1} \code{op
#' 	#2} \code{op #3}}
#'     \item{\code{run}}{a factor with levels \code{run #1} \code{run #2} \code{run #3}}
#'     \item{\code{time1}}{a numeric vector}
#'     \item{\code{time2}}{a numeric vector}
#'   }
#'   
#' @note 
#' This data set is used in chapter 5 of the book ``Six Sigma with R'' (see 
#' References).
#' 
#' @references 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
#'
#' @source See references.
#' @aliases ss.data.rr
#' @usage data(ss.data.rr)
#' @docType data
#' @keywords data msa
#' @name ss.data.rr
#' @examples
#' data(ss.data.rr)
#' summary(ss.data.rr)
#' 
NULL

#' Data set for the Guitar Strings example
#' 
#' This data set contains data from a simulated process of guitar strings production.
#' 
#' @format 
#'  A data frame with 120 observations on the following 6 variables.
#'   \describe{
#'     \item{\code{id}}{a numeric vector}
#'     \item{\code{type}}{a factor with levels \code{A5} \code{B2} \code{D4} \code{E1} \code{E6} \code{G3}}
#'     \item{\code{res}}{a numeric vector for resistance}
#'     \item{\code{len}}{a numeric vector for length}
#'     \item{\code{sound}}{a numeric vector for}
#'     \item{\code{power}}{a numeric vector}
#'   }
#'   
#' @note 
#' This data set is used in chapter 10 of the book ``Six Sigma with R'' (see 
#' References).
#' 
#' @references 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.\cr
#'
#' @source See references.
#' @aliases ss.data.strings
#' @usage data(ss.data.strings)
#' @docType data
#' @keywords data msa
#' @name ss.data.strings
#' @examples
#' data(ss.data.strings)
#' summary(ss.data.strings)
#' 
NULL
