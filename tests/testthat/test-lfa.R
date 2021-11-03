library(SixSigma)
library(testthat)

#Loss Function Analysis

data <- ss.data.bolts
cqt <- "diameter"
delta <- 0.5
L0 <- 0.001
Y0 <- 10
Y0Smaller <- 0
Y0Larger <- Inf
output <- "text"
sub <- "Loss Function Analysis"

lfaNominal <- ss.lfa(data, cqt, delta, Y0, L0, output, sub)
lfaSmaller <-ss.lfa(data, cqt, delta, Y0Smaller, L0, output, sub)
lfaLarger <- ss.lfa(data, cqt, delta, Y0Larger, L0, output, sub)

#Test implemented by Emilio L. Cano
test_that("Constant k is correctly computed",{
  expect_equal(lfaNominal$lfa.k, 0.001/(0.5^2))
  expect_equal(lfaSmaller$lfa.k, 0.001/(0.5^2))
  expect_equal(lfaLarger$lfa.k, 0.001*(0.5^2))
})

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that("expected data type",{
  expect_type(data,"list")
})

test_that("expected data type",{
  expect_type(cqt,"character")
})

test_that("expected data type",{
  expect_type(delta,"double")
})

test_that("expected data type",{
  expect_type(L0,"double")
})

test_that("expected data type",{
  expect_type(Y0,"double")
})

test_that("expected data type",{
  expect_type(output,"character")
})

test_that("expected data type",{
  expect_type(sub,"character")
})
