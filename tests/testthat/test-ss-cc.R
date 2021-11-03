library(SixSigma)
library(testthat)

#Control Charts

x <- ss.cc("mr", ss.data.pb1, CTQ = "pb.humidity")

testout <- ss.data.pb1
testout[31,] <- list(31,17)

y <- ss.cc("mr", testout, CTQ = "pb.humidity")

climits <- c(0.5,1,2.3)
z <- ss.cc("mr", ss.data.pb1, CTQ = "pb.humidity", climits=climits)

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that("LCL, CL and UCL values from x", {
  expect_equal(x$LCL,0)
  expect_equal(round(x$CL,6),1.569483)
  expect_equal(round(x$UCL,6),5.126767)
  expect_equal(x$phase,"I")
  expect_equal(x$out,integer(0))
})

test_that("LCL, CL and UCL values from y", {
  expect_equal(y$LCL,0)
  expect_equal(round(y$CL,4),1.7286)
  expect_equal(round(y$UCL,6),5.646528)
  expect_equal(x$phase,"I")
  expect_equal(y$out,30)
})

test_that("phase is 'II' when cdata or climits are provided",{
  expect_equal(z$phase,"II")
})
