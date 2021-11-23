library(SixSigma)
library(testthat)

#Functions to find out constants of the relative range distribution.

n <- 20L
d3 <- ss.cc.getd3(n)

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that("espected data type",{
  expect_type(d3,"double")
})

X <- unname(d3)

test_that("value of d3",{
  expect_equal(round(X,2),0.73)
})
