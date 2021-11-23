library(SixSigma)
library(testthat)

#Capability Indices

LSL <- 740
USL <- 760
z <- ss.ca.z(ss.data.ca$Volume,LSL,USL)

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that("expected data type",{
  expect_type(z,"double")
})

test_that("numeric value for the index",{
  expect_equal(z,4.63953929133888)
})
