#' Gage R & R (Measure System Assessment)
#' 
#' Performs Gage R&R analysis for the assessment of the measure 
#' system of a process. Related to the Measure phase of the DMAIC
#' strategy of Six Sigma.
#' 
#' Performs an R&R study for the measured variable, taking into account
#'   part and appraiser factors. It outputs the sources of Variability, and
#'   six graphs: bar chart with the sources of Variability, plots by
#'   appraiser, part and interaction and x-mean and R control charts.
#'   
#' Updates to code by Kevin C Limburg 2014-02-11
#'    1. Input of tolerance to calculate variance as a percent of tolerance and 
#'        adding that to the Components of Variation bar chart.
#'    2. Adjustment of the study variation sigma level (currently set to 5.15) 
#'        by passing it as an argument in the function that is defaulted to 5.15 
#'    3. Allow support for single appraiser 
#'   
#' @param var Measured variable
#' @param part Factor for parts
#' @param appr Factor for appraisers (operators, machines, ...)
#' @param data Data frame containing the variates
#' @param main Main title for the graphic output
#' @param sub Subtitle for the graphic output (recommended the name of the project)
#' @param lsl Numeric value of lower specification limit used with USL to calculate Study Variation as %Tolerance. KCL 2014-02-11
#' @param usl Numeric value of upper specification limit used with LSL to calculate Study Variation as %Tolerance. KCL 2014-02-11
#' @param sigma Numeric value for number of std deviations to use in calculating study variation. KCL 2014-02-11
#' 
#' @return 
#' Analysis of Variance Table. Variance composition and \%Study Var. Graphics.
#' \item{anovaTable}{The ANOVA table of the model}
#' \item{varComp}{A matrix with the contribution of each component to the 
#' 	total variation}
#' \item{studyVar}{A matrix with the contribution to the study variation}
#' \item{ncat}{Number of distinct categories}
#' 
#' @references 
#' Allen, T. T. (2010). Introduction to Engineering Statistics and Lean 
#' Six Sigma - Statistical Quality Control and Design of Experiments and 
#' Systems (Second Edition ed.). London: Springer.
#' 
#' Automotive Industry Action Group. (2010). Measurement Systems Analysis
#' (Fourth Edition). AIAG.
#' 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andres. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{http://www.springer.com/statistics/book/978-1-4614-3651-5}.
#' 
#' Montgomery, D. C. (2008). Introduction to Statistical Quality Control
#' (Sixtth Edition ed.). New York: Wiley & Sons, Inc.
#' 
#' 
#' @seealso 
#' \code{\link{ss.data.rr}}
#' 
#' @author EL Cano with contributions by Kevin C Limburg
#' 
#' @examples 
#' data(ss.data.rr)
#' ss.rr(time1, prototype, operator, data=ss.data.rr, 
#' 	sub="Six Sigma Paper Helicopter Project")
#' 
#' @export
#' @keywords reproducibility repeatability Gauge R&R MSA
ss.rr <- function(var, part, appr,
    lsl= NA, usl= NA, sigma = 5.15,  #Added by KCL 2014-02-11          
		data = "stop('Data' is required for lattice graphics)", 
		main = "Six Sigma Gage R&R Study", sub = ""){

##Figures and facts
  if (is.data.frame(data)){
    part <- data[[deparse(substitute(part))]]
    appr <- data[[deparse(substitute(appr))]]
    var <- data[[deparse(substitute(var))]]
  }
    a <- length(unique(part))
    b <- length(unique(appr))
    n <- length(var)/(a*b)
    options(show.signif.stars=FALSE)
    #Add if statement to allow single appraiser. KCL 2014-02-11
    if (b == 1){ #new
      model <- anova(lm(var ~ part)) #new
    }#new
    else{#new
      model <- anova(lm(var ~ part + appr + part * appr)) #original line
    }#new
    
    rownames(model)[length(rownames(model))] <- "Repeatability"
    print(model)
    varComp <- matrix(ncol=6,nrow=7) #Added column for %Tolerance. KCL 2014-02-11
    rownames(varComp) <- c("Total Gage R&R", "  Repeatability", "  Reproducibility",
                         "appr","part:appr", "Part-To-Part", "Total Variation")  #hard coded appr and part:appr since the reference no longer hold
                                                                                 #  if there is a single appraiser
    colnames(varComp)<-c("VarComp","%Contrib","StdDev", 
                         paste(sigma,"*SD",sep=""),"%StudyVar", "%Tolerance")#Added sigma level as variable and %tol for colnames. KCL 2014-02-11
    
###Adjusts variance component matrix based on number of appraisers. KCL 2014-02-11    
    #check number of appraisers
    if (b == 1) {
      varComp[2, 1] <- model[2, 3] #repeatability
      varComp[4, 1] <- NA #Appraiser Reproducibility
      varComp[5, 1] <- NA #part:Appr Reproducibility
      varComp[3, 1] <- NA # total reproducibility
      varComp[6, 1] <- max(c((model[1, 3] - model[2, 3])/(b * n),0)) #part to part
      varComp[1, 1] <- varComp[2, 1] #Total GRR = repeatability since no reprod without multiple appraisers
      varComp[7, 1] <- varComp[1, 1] + varComp[6, 1] #Total Variation    
    }
    
    else{ #more than 1 appraiser
      varComp[2, 1] <- model[4, 3] #repeatability
      varComp[4, 1] <- max(c((model[2, 3] - model[3, 3])/(a * n),0)) #Appraiser Reproducibility
      varComp[5, 1] <- max(c((model[3, 3] - model[4, 3])/n, 0)) #part:Appr Reproducibility
      varComp[3, 1] <- varComp[4, 1] + varComp[5, 1] # total reproducibility
      varComp[6, 1] <- max(c((model[1, 3] - model[3, 3])/(b * n),0)) #part to part
      varComp[1, 1] <- varComp[2, 1] + varComp[3, 1] #Total GRR
      varComp[7, 1] <- varComp[1, 1] + varComp[6, 1] #Total Variation
    }
    
    varComp[, 1] <- round(varComp[, 1], 7) #varComp
    varComp[, 2] <- round(100 * (varComp[, 1]/varComp[7, 1]),2) #%Contrib
    varComp[, 3] <- sqrt(varComp[, 1]) #StdDev
    varComp[, 4] <- varComp[, 3] * sigma #Study Variation edited from 5.15 to variable
    varComp[, 5] <- round(100 * (varComp[, 4]/varComp[7, 4]),2)
    varComp[, 6] <- round(100 * (varComp[, 4]/(usl-lsl)),2) 

    cat(paste("\nGage R&R\n"))
    print(varComp[, 1:2])
    cat("\n")
    if(is.na(usl)==F & is.na(lsl)==F){ #Check that both tolerances were entered. KCL 2014-02-11
      print(varComp[, 3:6])
    }
    else {
      print(varComp[, 3:5]) #if both tolerances werent input ignore %tolerance column when outputting results. KCL 2014-02-11
    }
    
    ncat<-max(c(1,floor((varComp[6,3]/varComp[1,3])*1.41)))
    cat(paste("\nNumber of Distinct Categories=",ncat,"\n"))

##graph
    .ss.prepCanvas(main, sub)
    vp.plots<-viewport(name="plots",
                       layout=grid.layout(3,2))
    pushViewport(vp.plots)
    vp.bar<-viewport(name="barplot", layout.pos.row=1, layout.pos.col=1)
    pushViewport(vp.bar)
    
    #check for tolerances before printing component of variation barchart. If both tolerances werent input ignore %Tolerance in barchart.
    #KCL 2014-02-11
    if(is.na(usl)==F & is.na(lsl)==F){
      databar <- cbind(varComp[c(1, 2, 3, 6), 2], varComp[c(1,2, 3, 6), 5], varComp[c(1,2, 3, 6), 6])
      rownames(databar) <- c("G.R&R", "Repeat", "Reprod", "Part2Part")
      plot <- barchart(databar, freq = FALSE, grid = TRUE, par.settings = list(axis.text = list(cex = 0.6), 
                                                                               par.ylab.text = list(cex = 0.8), par.main.text = list(cex = 0.85)), 
                       ylab = list("Percent", fontsize = 8), panel = function(...) {
                         panel.barchart(...)
                         panel.abline(h = 0)
                       }, 
                       auto.key = list(text = c("%Contribution", "%Study Var", "%Tolerance"), 
                                       cex = 0.8, columns = 2, space = "bottom", cex = 0.8, 
                                       rectangles = TRUE, points = FALSE, adj = 1, rep = FALSE), 
                       stack = FALSE, horizontal = FALSE, main = list("Components of Variation", fontsize = 14))
    }  
    else{    # one of the specification limits is set to NA, ignore %tolerance. KCL 2014-02-11
      databar <- cbind(varComp[c(1, 2, 3, 6), 2], varComp[c(1,2, 3, 6), 5])
      rownames(databar) <- c("G.R&R", "Repeat", "Reprod", "Part2Part")
      plot <- barchart(databar, freq = FALSE, grid = TRUE, par.settings = list(axis.text = list(cex = 0.6), 
                                                                               par.ylab.text = list(cex = 0.8), par.main.text = list(cex = 0.85)), 
                       ylab = list("Percent", fontsize = 8), panel = function(...) {
                         panel.barchart(...)
                         panel.abline(h = 0)
                       }, 
                       auto.key = list(text = c("%Contribution", "%Study Var"), 
                                       cex = 0.8, columns = 2, space = "bottom", cex = 0.8, 
                                       rectangles = TRUE, points = FALSE, adj = 1, rep = FALSE), 
                       stack = FALSE, horizontal = FALSE, main = list("Components of Variation", fontsize = 14))  
    }
    
    print(plot, newpage=FALSE)
    popViewport()
    vp.varByPart<-viewport(name="varByPart",layout.pos.row=1, layout.pos.col=2)
    pushViewport(vp.varByPart)
    #Var by part
    plot<-stripplot(var~part,data=data, grid=TRUE,
                    par.settings=list(axis.text=list(cex=0.6),
                                   par.xlab.text=list(cex=0.8),
                                   par.ylab.text=list(cex=0.8),
                                   par.main.text=list(cex=0.9)),
                    main="Var by Part",
                    type=c("p","a"))
    print(plot,newpage=FALSE)
    popViewport()
    vp.varByAppr<-viewport(name="varByAppr",layout.pos.row=2, layout.pos.col=2)
    pushViewport(vp.varByAppr)
    #var by appraiser
    plot<-stripplot(var~appr,data=data, grid=TRUE,
                    par.settings=list(axis.text=list(cex=0.6),
                                   par.xlab.text=list(cex=0.8),
                                   par.ylab.text=list(cex=0.8),
                                   par.main.text=list(cex=0.9)),
                    main="Var by appraiser",
                    type=c("p","a"))
    print(plot,newpage=FALSE)
    popViewport()
    vp.Interact<-viewport(name="Interact",layout.pos.row=3, layout.pos.col=2)
    pushViewport(vp.Interact)

    #Interaction
    data.xbar<-aggregate(data=ss.data.rr,var~appr+part,mean)
    plot<-stripplot(var~part,groups=appr, data=data.xbar, pch=16,grid=TRUE,
                    par.settings=list(par.main.text=list(cex=0.9)),
                    main="Part*appraiser Interaction",
                    type=c("p","a"),
                    auto.key=list(text=levels(appr),
                                  columns=2, space="bottom", cex=0.5,
                                  lines=TRUE, points=FALSE,adj=1))
    print(plot,newpage=FALSE)
    popViewport()

    #Control Charts

    data.xrange <- aggregate(data = ss.data.rr, 
			var ~ appr + part,
			function(x)max(x) - min(x))
    ar <- mean(data.xrange$var)
    #Mean
    vp.ccMean<-viewport(name="ccMean",layout.pos.row=3, layout.pos.col=1)
    pushViewport(vp.ccMean)
    plot<-xyplot(data=data.xbar, var~part|appr, pch=16,
                 par.settings=list( axis.text=list(cex=0.6),
                                   par.xlab.text=list(cex=0.8),
                                   par.ylab.text=list(cex=0.8),
                                   par.main.text=list(cex=0.9)),
                 par.strip.text=list(cex=0.6),
                 main=expression(bold(bar(x)*" Chart by appraiser")),grid=TRUE,
                 layout=c(b,1),
                 type="b",
                 panel=function(...){
                     panel.xyplot(...)
                     panel.abline(h=mean(var,na.rm=TRUE), lty=2)
                     panel.abline(h=mean(var,na.rm=TRUE)+
                                  (3/(ss.cc.getd2(n)*sqrt(n)))*ar)
                     panel.abline(h=mean(var,na.rm=TRUE)-
                                  (3/(ss.cc.getd2(n)*sqrt(n)))*ar)

                 }
                 )
    print(plot,newpage=FALSE)
    popViewport()
    ##Range
    vp.ccRange<-viewport(name="ccRange", layout.pos.row=2, layout.pos.col=1)
    pushViewport(vp.ccRange)


    plot<-xyplot(data=data.xrange, var~part|appr, pch=16,
                 par.settings=list(axis.text=list(cex=0.6),
                                   par.xlab.text=list(cex=0.8),
                                   par.ylab.text=list(cex=0.8),
                                   par.main.text=list(cex=0.9)),
                 par.strip.text=list(cex=0.6),
                 main="R Chart by appraiser",grid=TRUE,
                 layout=c(b,1),
                 type="b",
                 panel=function(...){
					 this.d3 <- ss.cc.getd3(n)
					 this.d2 <- ss.cc.getd2(n)
                     panel.xyplot(...)
                     panel.abline(h=ar, lty=2)
                     panel.abline(h=ar*(1+
                                  (this.d3/(this.d2))))
                     panel.abline(h=ar*(1-
                                  (this.d3/(this.d2))))

                 }
                 )
    print(plot,newpage=FALSE)
    popViewport()
	invisible(list(anovaTable=model,varComp=varComp[,1:2],
					studyVar=varComp[,3:6],ncat=ncat)) #updated studyVar to include %Tolerance. KCL 2014-02-11
}
