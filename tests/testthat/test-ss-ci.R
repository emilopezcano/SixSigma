library(SixSigma)
library(testthat)

#Confidence Interval for the mean

data <- ss.data.strings
alpha <- 0.05
sub <- "Guitar Strings Test | String Length"
xname <- "Length"
main <- "Confidence Interval for the mean"
digits <- 3

ci <- ss.ci(len, alpha=alpha, data=data,xname, main=main, digits=digits, sub=sub)

result <- unname(ci)

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that("value of LL",{
  expect_equal(result,c(949.967364656452, 950.06404539833))
})

test_that("expect data type",{
  expect_type(data,"list")
})

test_that("expect data type",{
  expect_type(alpha,"double")
})

test_that("expect data type",{
  expect_type(sub,"character")
})

test_that("expect data type",{
  expect_type(xname,"character")
})

test_that("expect data type",{
  expect_type(main,"character")
})

test_that("expect data type",{
  expect_type(digits,"double")
})


