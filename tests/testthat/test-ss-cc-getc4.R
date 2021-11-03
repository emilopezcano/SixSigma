library(SixSigma)
library(testthat)

#Functions to find out constants of the relative range distribution.

n <- 20L
c4 <- ss.cc.getc4(n)

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that("espected data type",{
  expect_type(n,"integer")
})

X <- unname(c4)

test_that("value of c4",{
  expect_equal(round(X,2),0.99)
})
