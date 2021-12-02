library(SixSigma)
library(testthat)

#Main calculations regarding The Voice of the Process in SixSigma: Yield, FTY, RTY, DPMO

defects <- c(3,5,12)
rework <- c(1,2,4)
opportunities <- 1915

result <- ss.ca.yield(defects,rework,opportunities)

lenghtdefects <- length(defects)
lenghtrework <- length(rework)

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that(" The first and the second arguments must have the same length ", {
  expect_equal(lenghtdefects, lenghtrework)
})

test_that("expected data type", {
   expect_type(result, "list")
})

test_that("lenghth of result",{
   expect_length(result,5)
})

test_that("expected data type", {
   expect_type(result$Yield, "double")
})

test_that("expected data type", {
   expect_type(result$FTY, "double")
})

test_that("expected data type", {
   expect_type(result$RTY, "double")
})

test_that("expected data type", {
   expect_type(result$DPMO, "double")
})

test_that("expected data type", {
   expect_type(result$DPU, "double")
})

test_that(" Test Yield: Number of good stuff / Total items ", {
   expect_equal(round(result$Yield,7), 0.9895561)
})

test_that(" Test First Time Yield: (Total - scrap - rework) / Total ", {
   expect_equal(round(result$FTY,7), 0.9859008)
})

test_that(" Test Rolled Throughput Yield: prod(FTY) ", {
   expect_equal(round(result$RTY,7), 0.9859563)
})

test_that(" Test Defects per Million Opportunities ", {
   expect_equal(round(result$DPMO,2), 10443.86)
})

test_that(" Test Defects per Million Opportunities ", {
    expect_equal(result$DPU, 20)
})
