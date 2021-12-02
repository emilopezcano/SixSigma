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

test_that("expected data type of lfaNominal",{
  expect_type(lfaNominal,"list")
  expect_type(lfaNominal$lfa.k,"double")
  expect_type(lfaNominal$lfa.lf,"expression")
  expect_type(lfaNominal$lfa.MSD,"double")
  expect_type(lfaNominal$lfa.avLoss,"double")
  expect_type(lfaNominal$lfa.Loss,"logical")
})

test_that("length of lfaNominal",{
  expect_length(lfaNominal,5)
})

test_that("expected data type of lfaSmaller",{
  expect_type(lfaSmaller,"list")
  expect_type(lfaSmaller$lfa.k,"double")
  expect_type(lfaSmaller$lfa.lf,"expression")
  expect_type(lfaSmaller$lfa.MSD,"double")
  expect_type(lfaSmaller$lfa.avLoss,"double")
  expect_type(lfaSmaller$lfa.Loss,"logical")
})

test_that("length of lfaSmaller",{
  expect_length(lfaSmaller,5)
})

test_that("expected data type",{
  expect_type(lfaLarger,"list")
  expect_type(lfaLarger$lfa.k,"double")
  expect_type(lfaLarger$lfa.lf,"expression")
  expect_type(lfaLarger$lfa.MSD,"double")
  expect_type(lfaLarger$lfa.avLoss,"double")
  expect_type(lfaLarger$lfa.Loss,"logical")
})

test_that("length of lfaLarger",{
  expect_length(lfaLarger,5)
})
