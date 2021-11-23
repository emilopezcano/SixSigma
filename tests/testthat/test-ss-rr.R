library(SixSigma)
library(testthat)

#Gage R & R (Measurement System Assessment)
lsl <- 0.7
usl <- 0.8
method <- "crossed"
main = "Six Sigma Gage R&R Study"
sub <- "Six Sigma Paper Helicopter Project"
errorTerm <- "interaction"
alphaLim <- 0.05

result <- ss.rr(time1, prototype, operator, data = ss.data.rr,
      sub = sub,
      main = main,
      alphaLim = alphaLim,
      errorTerm = errorTerm,
      lsl = lsl,
      usl = usl,
      method = method)

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that("expected data type",{
   expect_type(result,"list")
})

test_that("length of result",{
   expect_length(result,5)
})

test_that("expected data type",{
   expect_type(result$anovaTable,"list")
})

test_that("expected data type",{
   expect_type(result$anovaRed,"list")
})

test_that("expected data type",{
   expect_type(result$varComp,"double")
})

test_that("expected data type",{
   expect_type(result$studyVar,"double")
})

test_that("expected data type",{
   expect_type(result$ncat,"double")
})

test_that("value of anovaTable",{
   #Df variable
   expect_equal(result$anovaTable[[1]]$Df[1],2)
   expect_equal(result$anovaTable[[1]]$Df[2],2)
   expect_equal(result$anovaTable[[1]]$Df[3],4)
   expect_equal(result$anovaTable[[1]]$Df[4],18)
   expect_equal(result$anovaTable[[1]]$Df[5],26)
   #Sum sq variable
   expect_equal(round(result$anovaTable[[1]]$`Sum Sq`[1],4),1.2007)
   expect_equal(round(result$anovaTable[[1]]$`Sum Sq`[2],4),0.0529)
   expect_equal(round(result$anovaTable[[1]]$`Sum Sq`[3],4),0.0834)
   expect_equal(round(result$anovaTable[[1]]$`Sum Sq`[4],4),0.3854)
   expect_equal(round(result$anovaTable[[1]]$`Sum Sq`[5],4),1.7225)
   #Mean sq variable
   expect_equal(round(result$anovaTable[[1]]$`Mean Sq`[1],4),0.6004)
   expect_equal(round(result$anovaTable[[1]]$`Mean Sq`[2],4),0.0265)
   expect_equal(round(result$anovaTable[[1]]$`Mean Sq`[3],4),0.0208)
   expect_equal(round(result$anovaTable[[1]]$`Mean Sq`[4],4),0.0214)
   expect_equal(unname(result$anovaTable[[1]]$`Mean Sq`[5]),NA_real_)
   #F value
   expect_equal(round(result$anovaTable[[1]]$`F value`[1],3),28.797)
   expect_equal(round(result$anovaTable[[1]]$`F value`[2],3),1.270)
   expect_equal(round(result$anovaTable[[1]]$`F value`[3],3),0.974)
   expect_equal(unname(result$anovaTable[[1]]$`F value`[4]),NA_real_)
   expect_equal(unname(result$anovaTable[[1]]$`F value`[5]),NA_real_)
   #Pr(>F)
   expect_equal(round(result$anovaTable[[1]]$`Pr(>F)`[1],5),0.00422)
   expect_equal(round(result$anovaTable[[1]]$`Pr(>F)`[2],5),0.37415)
   expect_equal(round(result$anovaTable[[1]]$`Pr(>F)`[3],5),0.44619)
   expect_equal(unname(result$anovaTable[[1]]$`Pr(>F)`[4]),NA_real_)
   expect_equal(unname(result$anovaTable[[1]]$`Pr(>F)`[5]),NA_real_)
})

test_that("value of anovaRed",{
   #Df variable
   expect_equal(result$anovaRed[[1]]$Df[1],2)
   expect_equal(result$anovaRed[[1]]$Df[2],2)
   expect_equal(result$anovaRed[[1]]$Df[3],22)
   expect_equal(result$anovaRed[[1]]$Df[4],26)
   #Sum sq variable
   expect_equal(round(result$anovaRed[[1]]$`Sum Sq`[1],4),1.2007)
   expect_equal(round(result$anovaRed[[1]]$`Sum Sq`[2],4),0.0529)
   expect_equal(round(result$anovaRed[[1]]$`Sum Sq`[3],4),0.4688)
   expect_equal(round(result$anovaRed[[1]]$`Sum Sq`[4],4),1.7225)
   #Mean sq variable
   expect_equal(round(result$anovaRed[[1]]$`Mean Sq`[1],4),0.6004)
   expect_equal(round(result$anovaRed[[1]]$`Mean Sq`[2],4),0.0265)
   expect_equal(round(result$anovaRed[[1]]$`Mean Sq`[3],4),0.0213)
   expect_equal(unname(result$anovaRed[[1]]$`Mean Sq`[4]),NA_real_)
   #F value
   expect_equal(round(result$anovaRed[[1]]$`F value`[1],2),28.17)
   expect_equal(round(result$anovaRed[[1]]$`F value`[2],2),1.24)
   expect_equal(unname(result$anovaRed[[1]]$`F value`[3]),NA_real_)
   expect_equal(unname(result$anovaRed[[1]]$`F value`[4]),NA_real_)
   #Pr(>F)
   expect_equal(round(result$anovaRed[[1]]$`Pr(>F)`[1],9),8.56e-07)
   expect_equal(round(result$anovaRed[[1]]$`Pr(>F)`[2],3),3.08e-01)
   expect_equal(unname(result$anovaRed[[1]]$`Pr(>F)`[3]),NA_real_)
   expect_equal(unname(result$anovaRed[[1]]$`Pr(>F)`[4]),NA_real_)
})

test_that("value of varComp",{
   expect_equal(round(result$varComp[[1,1]],4),0.0219)
   expect_equal(round(result$varComp[[2,1]],4),0.0213)
   expect_equal(round(result$varComp[[3,1]],4),0.0006)
   expect_equal(round(result$varComp[[4,1]],4),0.0006)
   expect_equal(round(result$varComp[[5,1]],4),0.0643)
   expect_equal(round(result$varComp[[6,1]],4),0.0862)
   expect_equal(round(result$varComp[[1,2]],2),25.38)
   expect_equal(round(result$varComp[[2,2]],2),24.71)
   expect_equal(round(result$varComp[[3,2]],2),0.67)
   expect_equal(round(result$varComp[[4,2]],2),0.67)
   expect_equal(round(result$varComp[[5,2]],2),74.62)
   expect_equal(round(result$varComp[[6,2]],2),100.00)
})

test_that("value of studyVar",{
   expect_equal(round(result$studyVar[[1,1]],8),0.14792656)
   expect_equal(round(result$studyVar[[2,1]],8),0.14597518)
   expect_equal(round(result$studyVar[[3,1]],8),0.02394813)
   expect_equal(round(result$studyVar[[4,1]],8),0.02394813)
   expect_equal(round(result$studyVar[[5,1]],8),0.25365123)
   expect_equal(round(result$studyVar[[6,1]],8),0.29363449)
   expect_equal(round(result$studyVar[[1,2]],7),0.8875594)
   expect_equal(round(result$studyVar[[2,2]],7),0.8758511)
   expect_equal(round(result$studyVar[[3,2]],7),0.1436888)
   expect_equal(round(result$studyVar[[4,2]],7),0.1436888)
   expect_equal(round(result$studyVar[[5,2]],7),1.5219074)
   expect_equal(round(result$studyVar[[6,2]],7),1.7618069)
   expect_equal(round(result$studyVar[[1,3]],2),50.38)
   expect_equal(round(result$studyVar[[2,3]],2),49.71)
   expect_equal(round(result$studyVar[[3,3]],2),8.16)
   expect_equal(round(result$studyVar[[4,3]],2),8.16)
   expect_equal(round(result$studyVar[[5,3]],2),86.38)
   expect_equal(round(result$studyVar[[6,3]],2),100.00)
   expect_equal(round(result$studyVar[[1,4]],2),887.56)
   expect_equal(round(result$studyVar[[2,4]],2),875.85)
   expect_equal(round(result$studyVar[[3,4]],2),143.69)
   expect_equal(round(result$studyVar[[4,4]],2),143.69)
   expect_equal(round(result$studyVar[[5,4]],2),1521.91)
   expect_equal(round(result$studyVar[[6,4]],2),1761.81)
})

test_that("value of ncat",{
   expect_equal(result$ncat,2)
})
