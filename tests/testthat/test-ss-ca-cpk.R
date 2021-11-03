library(SixSigma)
library(testthat)

#Capability Indices

LSL <- 740
USL <- 760
cpk <- ss.ca.cpk(ss.data.ca$Volume,LSL, USL)

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that("expected data type",{
  expect_type(LSL,"double")
})

test_that("expected data type",{
  expect_type(USL,"double")
})
test_that("numeric value for the index",{
  expect_equal(cpk,1.54651309711296)
})
