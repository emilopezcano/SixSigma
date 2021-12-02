library(SixSigma)
library(testthat)

#Capability Indices

LSL <- 740
USL <- 760
cp <- ss.ca.cp(ss.data.ca$Volume,LSL, USL)

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that("expected data type",{
  expect_type(cp,"double")
})

test_that("numeric value for the index",{
  expect_equal(cp,1.58413633507089)
})
