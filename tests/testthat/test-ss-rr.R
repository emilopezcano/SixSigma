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
   expect_type(lsl,"double")
})

test_that("expected data type",{
   expect_type(usl,"double")
})

test_that("expected data type",{
   expect_type(method,"character")
})

test_that("expected data type",{
   expect_type(sub,"character")
})

test_that("expected data type",{
   expect_type(errorTerm,"character")
})

test_that("expected data type",{
   expect_type(main,"character")
})

test_that("expected data type",{
   expect_type(alphaLim,"double")
})


