library(SixSigma)
library(testthat)

#Functions to find out constants of the relative range distribution.

n <- 20L
d2 <- ss.cc.getd2(n)

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that("espected data type",{
  expect_type(d2,"double")
})

X <- unname(d2)

test_that("value of d2",{
  expect_equal(round(X,2),3.73)
})

