library(SixSigma)
library(testthat)

#Evaluates the Loss Function for a process

#Example bolts: evaluate LF at 10.5 if Target=10, Tolerance=0.5, L_0=0.001
lfa.Y1 <- 10.5
lfa.Delta <- 0.5
lfa.Y0 <- 10
lfa.L0 <- 0.001

lf <- ss.lf(lfa.Y1, lfa.Delta, lfa.Y0, lfa.L0)

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that("Number with the evaluated function at 10.5",{
  expect_equal(lf, 5e-04)
})

test_that("expect type",{
  expect_type(lf,"double")
})
