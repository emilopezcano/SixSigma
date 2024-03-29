% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SixSigma-package.R
\docType{package}
\name{SixSigma}
\alias{SixSigma}
\title{Six Sigma Tools for Quality and Process Improvement}
\description{
Six Sigma Tools for Quality and Process Improvement
}
\details{
This package contains functions and utilities to perform Statistical Analyses in the Six Sigma way. 
 Through the DMAIC cycle (Define, Measure, Analyze, Improve, Control), you can manage several Quality Management 
 studies: Gage R&R, Capability Analysis, Control Charts, Loss Function Analysis, etc. Data frames used in 
 "Six Sigma with R" (Springer, 2012) are also included in the package.
 Use the package to perform Six Sigma Methodology tasks, throughout its
 breakthrough strategy: Define, Measure, Analyze, Improve, Control (DMAIC)\cr
 Define: Process Map (ss.pMap), Cause and effect Diagram
 (ss.ceDiag);\cr
 Measure: Gage R&R study (ss.rr); Capability Analysis (ss.study.ca); 
 Loss Function Analysis (ss.lfa)\cr
 Analyze: Confidence Intervals (ss.ci)\cr
 Control: Moving Average Control Chart\cr
 Soon: further functions
}
\note{
The current version includes Loss Function Analysis, Gage R&R Study, 
confidence intervals,
  Process Map and Cause-and-Effect diagram. We plan to regularly upload
  updated versions, with new functions and improving
  those previously deployed. The subsequent versions will cover 
  tools for the whole cycle:
  \itemize{
  \item Define
  \item Measure
  \item Analyze
  \item Improve
  \item Control
    }
}
\references{
Allen, T. T. (2010) \emph{Introduction to Engineering Statistics and Lean
  Six Sigma - Statistical Quality Control and Design of Experiments and
  Systems} (Second Edition ed.). London: Springer.
  
Box, G. (1991). Teaching engineers experimental design with 
	a paper helicopter. Report 76, Center for Quality and 
	Productivity Improvement. University of Wisconsin.

Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andrés. 2012.
\emph{Six Sigma with {R}. Statistical Engineering for Process
  Improvement}, Use R!, vol. 36. Springer, New York.
  \url{https://link.springer.com/book/10.1007/978-1-4614-3652-2/}.

Cano, Emilio L., Moguerza, Javier M. and Prieto Corcoba, Andrés. 2015.
\emph{Quality Control with {R}. An ISO Standards approach}, Use R!, Springer, New York.
  
Chambers, J. M. (2008) \emph{Software for data analysis. Programming with
  R} New York: Springer.

Montgomery, DC (2008) \emph{Introduction to Statistical Quality Control}
  (Sixth Edition). New York: Wiley&Sons\cr

Wikipedia, \url{https://en.wikipedia.org/wiki/Six_Sigma/}
}
\seealso{
\code{\link{ss.pMap}}, \code{\link{ss.rr}}, \code{\link{ss.ceDiag}},
\code{\link{ss.ci}}, \code{\link{ss.heli}}, \code{\link{ss.lfa}}
}
\author{
Emilio L. Cano, Javier M. Moguerza, Mariano Prieto Corcoba and Andrés Redchuk; 

Maintainer: Emilio L. Cano \email{emilio.lopez@urjc.es}
}
