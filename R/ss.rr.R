#' Gage R & R (Measurement System Assessment)
#' 
#' Performs Gage R&R analysis for the assessment of the measurement 
#' system of a process. Related to the Measure phase of the DMAIC
#' strategy of Six Sigma.
#' 
#' Performs an R&R study for the measured variable, taking into account
#'   part and appraiser factors. It outputs the sources of Variability, and
#'   six graphs: bar chart with the sources of Variability, plots by
#'   appraiser, part and interaction and x-bar and R control charts.
#'   
#' @param var Measured variable
#' @param part Factor for parts
#' @param appr Factor for appraisers (operators, machines, ...)
#' @param data Data frame containing the variables
#' @param main Main title for the graphic output
#' @param sub Subtitle for the graphic output (recommended the name of the project)
#' @param lsl Numeric value of lower specification limit used with USL to calculate Study Variation as \%Tolerance
#' @param usl Numeric value of upper specification limit used with LSL to calculate Study Variation as \%Tolerance
#' @param sigma Numeric value for number of std deviations to use in calculating Study Variation
#' @param tolerance Numeric value for the tolerance
#' @param alphaLim Limit to take into account interaction
#' @param errorTerm Which term of the model should be used as error term (for the model with interation)
#' @param digits Number of decimal digits for output
#' @param method Character to specify the type of analysis to perform, \code{"crossed"} (default) or \code{"nested"} 
#' @param print_plot if TRUE (default) the plots are printed. Change to FALSE to avoid printing plots.
#' @param signifstars if FALSE (default) the significance stars are ommitted. Change to TRUE to allow printing stars.
#' 
#' @return 
#' Analysis of Variance Table/s. Variance composition and \%Study Var. Graphics.
#' \item{anovaTable}{The ANOVA table of the model}
#' \item{anovaRed}{The ANOVA table of the reduced model (without interaction, only
#' if interaction not significant)}
#' \item{varComp}{A matrix with the contribution of each component to the 
#' 	total variation}
#' \item{studyVar}{A matrix with the contribution to the study variation}
#' \item{ncat}{Number of distinct categories}
#' 
#' @note 
#' The F test for the main effects in the ANOVA table is usually made 
#' taken the operator/appraisal
#' interaction as the error term (repeated measures model), thereby computing F as
#' $MS_{factor}/MS_{interaction}$, e.g. in appendix A of AIAG MSA manual, 
#' in Montgomery (2009) and by statistical software such as Minitab.
#' However, in the example provided in page 127 of the AIAG MSA Manual, the
#' F test is performed as $MS_{factor}/MS_{equipment}$, i.e., repeatability.
#' Thus, since version 0.9-3 of the SixSigma package, a new argument
#' \code{errorTerm} controls which term should be used as error Term, one of 
#' "interaction", "repeatability". 
#' 
#' Argument \code{alphaLim} is used as upper limit to use the full model, i.e.,
#' with interaction. Above this value for the interaction effect, the 
#' ANOVA table without the interaction effect is also obtained, and the variance
#' components are computed pooling the interaction term with the repeatibility.
#' 
#' \code{Tolerance} can be calculaten from usl and lsl values or specified by hand.
#' 
#' The type of analysis to perform can be specified with the parameter method, \code{"crossed"} or \code{"nested"}. 
#' Be sure to select the correct one and to have the data prepare for such type of analysis.
#' If you don't know wich one is for you check it before. It is really important to perform the correct one.
#' Otherwise results have no sense.
#' 
#' @references 
#' Automotive Industry Action Group. (2010). Measurement Systems Analysis
#' (Fourth Edition). AIAG.
#' 
#' Cano, Emilio L., Moguerza, Javier M. and Redchuk, Andres. 2012.
#' \emph{Six Sigma with {R}. Statistical Engineering for Process
#'   Improvement}, Use R!, vol. 36. Springer, New York.
#'   \url{https://link.springer.com/book/10.1007/978-1-4614-3652-2/}.
#' 
#' Montgomery, D. C. (2009). Introduction to Statistical Quality Control
#' (Sixth Edition ed.). New York: Wiley & Sons, Inc.
#' 
#' 
#' @seealso 
#' \code{\link{ss.data.rr}}
#' 
#' @author EL Cano with contributions by Kevin C Limburg
#' 
#' @examples 
#' ss.rr(time1, prototype, operator, data = ss.data.rr, 
#' 	sub = "Six Sigma Paper Helicopter Project", 
#' 	alphaLim = 0.05,
#' 	errorTerm = "interaction",
#' 	lsl = 0.7,
#' 	usl = 1.8,
#' 	method = "crossed")
#' 
#' @export
#' @keywords reproducibility repeatability Gauge R&R MSA
ss.rr <- function(var, part, appr,
                  lsl = NA, usl = NA, sigma = 6,
                  tolerance = usl - lsl,
                  data, 
                  main = "Six Sigma Gage R&R Study", sub = "",
                  alphaLim = 0.05,
                  errorTerm = "interaction",
                  digits = 4, 
                  method = "crossed",
                  print_plot = TRUE,
                  signifstars = FALSE){
  curr_stars <- getOption("show.signif.stars")
  if(signifstars){
    options(show.signif.stars = TRUE)
  } else{
    options(show.signif.stars = FALSE)
  }
  ## Figures and facts
  ## Get character strings for column names
  if (is.data.frame(data)){
    if (deparse(substitute(var)) %in% names(data)){
      var <- deparse(substitute(var))
    }
    if (!(var %in% names(data))) {
      stop(var, "is not a valid column name for", deparse(substitute(data)))
    }
    if (deparse(substitute(part)) %in% names(data)){
      part <- deparse(substitute(part))
    }
    if (deparse(substitute(appr)) %in% names(data)){
      appr <- deparse(substitute(appr))
    }
    if (part %in% names(data)) {
      data[[part]] <- factor(data[[part]])
    } else{
      stop(part, "is not a valid column name for", data)
    }
    if (appr %in% names(data)) {
      data[[appr]] <- factor(data[[appr]])
    } else{
      stop(appr, "is not a valid column name for", data)
    }
  } else {
    stop("A data.frame object is needed as data argument")
  }
  
  if(method == "nested") {
    data[part] = paste(data[[appr]], data[[part]], sep="-")
    data[[part]] <- factor(data[[part]])
  }
  
  ## Number of observations by part, appraisal
  a <- nlevels(data[[part]])
  b <- nlevels(data[[appr]])
  
  if (method == "crossed") {
    n <- nrow(data)/(a*b)
  } else {
    n <- nrow(data)/a
  }
  
  ## Checks design balance, if not balanced abort
  if(abs(n-round(n)) != 0 && method == "crossed") {
    stop("The design is not balanced.")
  }
  
  ##Checks design replication
  if(n < 2 && method == "crossed") {
    stop("The design has no replications.")
  }
  
  
  if (method == "crossed") {
    #
    #   CROSSED METHOD
    #
    ## Single or multiple appraisers
    if (b == 1){ 
      modelf <- as.formula(paste(var, "~", part))
      model <- aov(modelf, data = data)
      modelm <- summary(model)
      rownames(modelm[[1]])[2] <- "Repeatability"
      modelm[[1]] <- rbind(modelm[[1]], 
                           c(colSums(modelm[[1]][, 1:2]), rep(NA, 3)))
      rownames(modelm[[1]])[3] <- "Total"
      cat("One-way ANOVA (single appraiser):\n\n")
      print(modelm)
      modelrm <- NULL
    }            
    else{        
      ## Complete model (with interaction)
      modelf <- as.formula(paste(var, "~", part, "*", appr)) 
      modelfm <- as.formula(paste(var, "~", part, "*", appr, 
                                  "+ Error(", part, "/", appr, ")")) 
      model <- aov(modelf, data = data)
      modelm <- summary(model)
      if (errorTerm == "interaction"){
        modelm[[1]][1:2, 4] <- modelm[[1]][1:2, 3]/modelm[[1]][3, 3]
        modelm[[1]][1:2, 5] <- pf(modelm[[1]][1:2, 4], 
                                  modelm[[1]][1:2, 1], 
                                  modelm[[1]][3, 1], lower.tail = FALSE)
      }
      
      rownames(modelm[[1]])[4] <- "Repeatability"
      modelm[[1]] <- rbind(modelm[[1]], 
                           c(colSums(modelm[[1]][, 1:2]), rep(NA, 3)))
      rownames(modelm[[1]])[5] <- "Total"
      cat("Complete model (with interaction):\n\n")
      print(modelm)
      cat("\nalpha for removing interaction:", alphaLim, "\n")
      
      ## F test for interaction
      pint <- modelm[[1]][3, 5]
      ## Reduced model (without interaction)
      if (pint > alphaLim){
        modelfr <- as.formula(paste(var, "~", part, "+", appr)) 
        modelr <- aov(modelfr, data = data)
        modelrm <- summary(modelr)
        rownames(modelrm[[1]])[3] <- "Repeatability"
        modelrm[[1]] <- rbind(modelrm[[1]], 
                              c(colSums(modelrm[[1]][, 1:2]), rep(NA, 3)))
        rownames(modelrm[[1]])[4] <- "Total"
        cat("\n\nReduced model (without interaction):\n\n")
        print(modelrm)
      } else modelrm <- NULL
    }
    
    ##
    ##
    ## Measurement System R&R
    ##
    ##
    
    ## Components of Variance
    ## Create matrix
    varComp <- matrix(ncol = 6, nrow = 7)
    rownames(varComp) <- c("Total Gage R&R", "  Repeatability", 
                           "  Reproducibility", 
                           paste0("    ", appr),
                           paste0(part, ":", appr), 
                           "Part-To-Part", "Total Variation")
    # if there is a single appraiser
    colnames(varComp) <- c("VarComp", "%Contrib", "StdDev",
                           "StudyVar", "%StudyVar", "%Tolerance")
    
    ## Account for one or multiple appraisals
    if (b == 1) {
      varComp[2, 1] <- modelm[[1]][2, 3] # repeatability
      varComp[4, 1] <- NA # Appraiser Reproducibility
      varComp[5, 1] <- NA # part:Appr Reproducibility
      varComp[3, 2] <- NA # total reproducibility
      varComp[6, 1] <- max(c((modelm[[1]][1, 3] - modelm[[1]][2, 3])/(b * n),0)) # part to part
      varComp[1, 1] <- varComp[2, 1]  # Total GRR = repeatability since no reprod without multiple appraisers
      varComp[7, 1] <- varComp[1, 1] + varComp[6, 1]  # Total Variation    
    }
    else { #more than 1 appraiser
      ## If the reduced model is used
      if (pint > alphaLim){
        ## Repeatability: MS Repeatability
        varComp[2, 1] <- modelrm[[1]][3, 3] 
        ## Appraiser Reproducibility: (MSap - MSrepe)/(a*n)
        varComp[4, 1] <- max(c((modelrm[[1]][2, 3] - modelrm[[1]][3, 3])/(a * n), 0))  
        ## No interaction
        varComp[5, 1] <- NA
        ## Reproducibility = Appr repro
        varComp[3, 1] <- varComp[4, 1]
        ## Part-to-part variation: (MSpart - MSrepe)/(b*n)
        varComp[6, 1] <- max(c((modelrm[[1]][1, 3] - modelrm[[1]][3, 3])/(b * n),0))
        ## Total GRR
        varComp[1, 1] <- varComp[2, 1] + varComp[3, 1]  
        ## Total Variation
        varComp[7, 1] <- varComp[1, 1] + varComp[6, 1]  
      } else{
        varComp[2, 1] <- modelm[[1]][4, 3] # repeatability
        varComp[4, 1] <- max(c((modelm[[1]][2, 3] - modelm[[1]][3, 3])/(a * n), 0))  # Appraiser Reproducibility
        varComp[5, 1] <- max(c((modelm[[1]][3, 3] - modelm[[1]][4, 3])/n, 0))  # part:Appr Reproducibility
        varComp[3, 1] <- varComp[4, 1] + varComp[5, 1]  # total reproducibility
        varComp[6, 1] <- max(c((modelm[[1]][1, 3] - modelm[[1]][3, 3])/(b * n),0))  # part to part
        varComp[1, 1] <- varComp[2, 1] + varComp[3, 1]  # Total GRR
        varComp[7, 1] <- varComp[1, 1] + varComp[6, 1]  # Total Variation
      }
    }
    # varComp[, 1] <- round(varComp[, 1], 7)  #varComp
    varComp[, 2] <- round(100 * (varComp[, 1]/varComp[7, 1]), 2)  #%Contrib
    varComp[, 3] <- sqrt(varComp[, 1])  #StdDev
    varComp[, 4] <- varComp[, 3] * sigma  #Study Variation edited from 5.15 to variable
    varComp[, 5] <- round(100 * (varComp[, 3]/varComp[7, 3]), 2)
    varComp[, 6] <- round(100 * (varComp[, 4]/(tolerance)), 2)
    
    ncat <- max(c(1, floor((varComp[6, 4]/varComp[1, 4])*1.41)))
    
    if (b == 1){
      varComp <- varComp[-c(3:5), ]
    } else{
      if (pint > alphaLim){
        varComp <- varComp[-c(5), ]
      }
    }
    
    cat(paste("\nGage R&R\n\n"))
    print(varComp[, 1:2])
    cat("\n")
    if ((!is.na(usl) && !is.na(lsl)) || !is.na(tolerance)) {  #Check that both tolerances were entered. 
      print(varComp[, c(1, 3:6)])
    } else {
      print(varComp[, 3:5])  #if both tolerances werent input ignore %tolerance column when outputting results
    }
    
    cat(paste("\nNumber of Distinct Categories =", ncat, "\n"))
  } else if (method == "nested") {
    #
    #   NESTED METHOD
    #
    ## Single or multiple appraisers
    
    if (b == 1){ 
      modelf <- as.formula(paste(var, "~", part))
      model <- aov(modelf, data = data)
      modelm <- summary(model)
      rownames(modelm[[1]])[2] <- "Repeatability"
      modelm[[1]] <- rbind(modelm[[1]], 
                           c(colSums(modelm[[1]][, 1:2]), rep(NA, 3)))
      rownames(modelm[[1]])[3] <- "Total"
      cat("One-way ANOVA (single appraiser):\n\n")
      print(modelm)
      modelrm <- NULL
    }            
    else{        
      ## Complete model (with interaction)
      modelf <- as.formula(paste(var, "~", appr, "/", part)) 
      modelfm <- as.formula(paste(var, "~", appr, "/", part, 
                                  "+ Error(", appr, "/", part, ")")) 
      model <- aov(modelf, data = data)
      modelm <- summary(model)
      if (errorTerm == "interaction"){
        modelm[[1]][1, 4] <- modelm[[1]][1, 3]/modelm[[1]][2, 3]
        modelm[[1]][1, 5] <- pf(modelm[[1]][1, 4], 
                                modelm[[1]][1, 1], 
                                modelm[[1]][3, 1], lower.tail = FALSE)
      }
      
      rownames(modelm[[1]])[3] <- "Repeatability"
      modelm[[1]] <- rbind(modelm[[1]], 
                           c(colSums(modelm[[1]][, 1:2]), rep(NA, 3)))
      rownames(modelm[[1]])[4] <- "Total"
      cat("Complete model (with interaction):\n\n")
      print(modelm)
      cat("\nalpha for removing interaction:", alphaLim, "\n")
      
      modelrm <- NULL
    }
    
    ##
    ##
    ## Measurement System R&R - Nested
    ##
    ##
    
    ## Components of Variance
    ## Create matrix
    varComp <- matrix(ncol = 6, nrow = 5)
    rownames(varComp) <- c("Total Gage R&R", "  Repeatability", 
                           "  Reproducibility", 
                           "Part-To-Part", "Total Variation")
    # if there is a single appraiser
    colnames(varComp) <- c("VarComp", "%Contrib", "StdDev",
                           "StudyVar", "%StudyVar", "%Tolerance")
    
    ## Account for one or multiple appraisals
    if (b == 1) {
      varComp[2, 1] <- modelm[[1]][3, 3] # repeatability
      varComp[3, 2] <- NA # total reproducibility
      varComp[4, 1] <- max(c((modelm[[1]][2, 3] - modelm[[1]][3, 3])/n, 0))  # part to part
      varComp[1, 1] <- varComp[2, 1]  # Total GRR = repeatability since no reprod without multiple appraisers
      varComp[5, 1] <- varComp[1, 1] + varComp[4, 1]  # Total Variation    
    } else { 
      #more than 1 appraiser
      varComp[2, 1] <- modelm[[1]][3, 3] # repeatability
      varComp[3, 1] <- max(c((modelm[[1]][1, 1] * (modelm[[1]][1, 3] - modelm[[1]][2, 3]) / (a * n)), 0))  # total reproducibility
      varComp[4, 1] <- max(c((modelm[[1]][2, 3] - modelm[[1]][3, 3])/n, 0))  # part to part
      varComp[1, 1] <- varComp[2, 1] + varComp[3, 1]  # Total GRR
      varComp[5, 1] <- varComp[1, 1] + varComp[4, 1]  # Total Variation
    }
    
    # varComp[, 1] <- round(varComp[, 1], 7)  #varComp
    varComp[, 2] <- round(100 * (varComp[, 1]/varComp[5, 1]), 2)  #%Contrib
    varComp[, 3] <- sqrt(varComp[, 1])  #StdDev
    varComp[, 4] <- varComp[, 3] * sigma  #Study Variation edited from 5.15 to variable
    varComp[, 5] <- round(100 * (varComp[, 3]/varComp[5, 3]), 2)
    varComp[, 6] <- round(100 * (varComp[, 4]/(tolerance)), 2)
    
    ncat <- max(c(1, floor((varComp[4, 4]/varComp[1, 4])*1.41)))
    
    if (b == 1){
      varComp <- varComp[-c(3:5), ]
    }
    
    cat(paste("\nGage R&R\n\n"))
    print(varComp[, 1:2])
    cat("\n")
    if ((!is.na(usl) && !is.na(lsl)) || !is.na(tolerance)) {  #Check that both tolerances were entered. 
      print(varComp[, c(1, 3:6)])
    } else {
      print(varComp[, 3:5])  #if both tolerances werent input ignore %tolerance column when outputting results
    }
    
    cat(paste("\nNumber of Distinct Categories =", ncat, "\n"))
    pint <- 0
  }
  
  
  if(print_plot){
    
    ## Charts
    ## Prepare Canvas and layout
    .ss.prepCanvas(main, sub)
    vp.plots <- grid::viewport(name = "plots",
                               layout = grid::grid.layout(3, 2))
    grid::pushViewport(vp.plots)
    
    ## Barplot components of variation
    vp.bar <- grid::viewport(name = "barplot", 
                             layout.pos.row = 1, 
                             layout.pos.col = 1)
    grid::pushViewport(vp.bar)
    
    ## Data for the chart ----
    ## Control which rows to plot
    if (b == 1){
      rowstoplot <- c(1, 2, 3)
    } else if (method == "nested"){
      rowstoplot <- c(1, 2, 3, 4)
    } else if (method == "crossed"){
      if (pint > alphaLim) {
        rowstoplot <- c(1, 2, 3, 5)
      } else {
        rowstoplot <- c(1, 2, 3, 6)
      }
    }
    ## If both tolerances werent input ignore %Tolerance in barchart.
    if ((!is.na(usl) && !is.na(lsl)) || !is.na(tolerance)) {
      colstoplot <- c(2, 5, 6)
      klabels <- c("%Contribution", "%Study Var", "%Tolerance")
    } else{
      colstoplot <- c(2, 5)
      klabels <- c("%Contribution", "%Study Var")
    }
    
    databar <- varComp[rowstoplot, colstoplot]
    if (b == 1){
      rownames(databar) <- c("G.R&R", "Repeat", "Part2Part")
    } else{
      rownames(databar) <- c("G.R&R", "Repeat", "Reprod", "Part2Part")
    }
    plot <- lattice::barchart(databar, 
                              freq = FALSE, 
                              grid = TRUE,
                              scales = list(x = list(rot=45)),
                              par.settings = list(axis.text = list(cex = 0.6), 
                                                  par.ylab.text = list(cex = 0.8), 
                                                  par.main.text = list(cex = 0.85)), 
                              ylab = list("Percent", fontsize = 8), 
                              panel = function(...) {
                                lattice::panel.barchart(...)
                                lattice::panel.abline(h = 0)
                                lattice::panel.abline(h = c(10, 30), 
                                                      lty = 2, 
                                                      col = "gray")
                              }, 
                              auto.key = list(text = klabels,
                                              cex = 0.8,
                                              columns = length(colstoplot),
                                              space = "bottom",
                                              rectangles = TRUE,
                                              points = FALSE, adj = 1,
                                              rep = FALSE),
                              stack = FALSE,
                              horizontal = FALSE, 
                              main = list("Components of Variation", fontsize = 14))
    
    
    print(plot, newpage = FALSE)
    grid::popViewport()
    
    ## Variable by part
    vp.varByPart <- grid::viewport(name = "varByPart", layout.pos.row = 1, 
                                   layout.pos.col = 2)
    grid::pushViewport(vp.varByPart)
    plot <- lattice::stripplot(as.formula(paste(var, "~", part)),
                               data = data,
                               grid = TRUE,
                               scales = list(x = list(rot=45)),
                               par.settings = list(axis.text = list(cex = 0.6),
                                                   par.xlab.text = list(cex = 0.8),
                                                   par.ylab.text = list(cex = 0.8),
                                                   par.main.text = list(cex = 0.9)),
                               main = paste(var, "by", part),
                               type = c("p", "a"))
    print(plot, newpage = FALSE)
    grid::popViewport()
    ## Variable by appraiser
    vp.varByAppr <- grid::viewport(name = "varByAppr", layout.pos.row = 2, 
                                   layout.pos.col = 2)
    grid::pushViewport(vp.varByAppr)
    plot <- lattice::stripplot(as.formula(paste(var, "~", appr)),
                               data = data,
                               grid = TRUE,
                               scales = list(x = list(rot=45)),
                               par.settings = list(axis.text = list(cex = 0.6),
                                                   par.xlab.text = list(cex = 0.8),
                                                   par.ylab.text = list(cex = 0.8),
                                                   par.main.text = list(cex = 0.9)),
                               main = paste(var, "by", appr),
                               type = c("p", "a"))
    print(plot, newpage = FALSE)
    grid::popViewport()
    
    ## Interaction
    if (method == "crossed") {
      vp.Interact <- grid::viewport(name = "Interact", layout.pos.row = 3, 
                                    layout.pos.col = 2)
      grid::pushViewport(vp.Interact)
      
      data.xbar <- aggregate(as.formula(paste(var, "~", appr, "+", part)), 
                             data = data, mean)
      plot <- lattice::stripplot(as.formula(paste(var, "~", part)),
                                 groups = get(appr),
                                 data = data.xbar,
                                 pch = 16,
                                 grid = TRUE,
                                 par.settings = list(par.main.text = list(cex = 0.9)),
                                 main = paste0(part, ":", appr, " Interaction"),
                                 type = c("p", "a"),
                                 auto.key = list(text = levels(data[[appr]]),
                                                 columns = nlevels(data[[appr]]), 
                                                 space = "bottom", 
                                                 cex = 0.5, lines = TRUE, 
                                                 points = FALSE, adj = 1))
      print(plot, newpage = FALSE)
      grid::popViewport()
    }
    
    data.xbar <- aggregate(as.formula(paste(var, "~", appr, "+", part)), 
                           data = data, mean)
    
    ## Control Charts
    data.xrange <- aggregate(as.formula(paste(var, "~", appr, "+", part)),
                             data = data,
                             function(x) {
                               max(x) - min(x)
                             })
    ar <- mean(data.xrange[[var]])
    ## Mean chart
    vp.ccMean <- grid::viewport(name = "ccMean", layout.pos.row = 3, 
                                layout.pos.col = 1)
    grid::pushViewport(vp.ccMean)
    xbar <- mean(data[[var]], na.rm = TRUE)
    ucl <- xbar + (3/(ss.cc.getd2(n)*sqrt(n)))*ar
    lcl <- xbar - (3/(ss.cc.getd2(n)*sqrt(n)))*ar
    glimits <- c(min(range(data.xbar[[var]])[1], lcl),
                 max(range(data.xbar[[var]])[2], ucl)) +
      c(-1, 1)*0.1*diff(range(data.xbar[[var]]))
    plot <- lattice::xyplot(as.formula(paste(var, "~", part, "|", appr)),
                            data = data.xbar,
                            pch = 16,
                            par.settings = list(axis.text = list(cex = 0.6),
                                                par.xlab.text=list(cex = 0.8),
                                                par.ylab.text=list(cex = 0.8),
                                                par.main.text=list(cex = 0.9)),
                            par.strip.text = list(cex = 0.6),
                            main = bquote(bold(bar(x)*" Chart by "*.(appr))),
                            grid = TRUE,
                            layout = c(b, 1),
                            type = "b",
                            axs = "r",
                            ylim = glimits,
                            scales = list(alternating = FALSE, x = list(relation= 'free', rot=45)),
                            panel = function(...) {
                              lattice::panel.xyplot(...)
                              lattice::panel.abline(h = xbar, lty = 2)
                              lattice::panel.abline(h = ucl, col = "red3")
                              lattice::panel.abline(h = lcl, col = "red3")
                            }
    )
    print(plot, newpage = FALSE)
    grid::popViewport()
    
    ## Range chart
    vp.ccRange <- grid::viewport(name = "ccRange", layout.pos.row = 2, 
                                 layout.pos.col = 1)
    grid::pushViewport(vp.ccRange)
    this.d3 <- ss.cc.getd3(n)
    this.d2 <- ss.cc.getd2(n)
    rlimits <- c(max(ar*(1 - 3*(this.d3/(this.d2))), 0), 
                 ar*(1 + 3*(this.d3/(this.d2))))
    glimits <- c(min(range(data.xrange[[var]])[1], rlimits[1]),
                 max(range(data.xrange[[var]])[2], rlimits[2])) +
      c(-1, 1)*0.1*diff(range(data.xrange[[var]]))
    if(all(glimits == 0)) {
      glimits <- c(0, max(data[[var]]))
    }
    
    
    plot <- lattice::xyplot(as.formula(paste(var, "~", part, "|", appr)),
                            data = data.xrange, pch = 16,
                            par.settings = list(axis.text = list(cex = 0.6),
                                                par.xlab.text = list(cex = 0.8),
                                                par.ylab.text = list(cex = 0.8),
                                                par.main.text = list(cex = 0.9),
                                                layout.widths = list(axis.panel = c(1, 0, 0))),
                            par.strip.text = list(cex = 0.6),
                            main = paste("R Chart by", appr),
                            grid = TRUE,
                            layout = c(b, 1),
                            type = "b",
                            axs = "r",
                            ylim = glimits,
                            scales = list(alternating = FALSE, x = list(relation= 'free', rot=45)),
                            panel = function(...) {
                              lattice::panel.xyplot(...)
                              lattice::panel.abline(h = ar, lty = 2)
                              lattice::panel.abline(h = rlimits[1], col = "red3")
                              lattice::panel.abline(h = rlimits[2], col = "red3")
                            }
                            
    )
    
    print(plot,newpage = FALSE)
    grid::popViewport()
  }
  
  ## Restore option for significance stars
  options(show.signif.stars = curr_stars)
  
  invisible(list(anovaTable = modelm,
                 anovaRed = modelrm,
                 varComp = varComp[, 1:2],
                 studyVar = varComp[, 3:6], 
                 ncat = ncat)) 
}
