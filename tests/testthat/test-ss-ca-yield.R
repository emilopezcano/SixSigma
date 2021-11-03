library(SixSigma)
library(testthat)

#Main calculations regarding The Voice of the Process in SixSigma: Yield, FTY, RTY, DPMO

defects <- c(3,5,12)
rework <- c(1,2,4)
opportunities <- 1915

#defects2 <- c(3, 5, 12, 4)

result <- ss.ca.yield(defects,rework,opportunities)
#wrong_result <- ss.ca.yield(defects2,rework,opportunities)

lenghtdefects <- length(defects)
lenghtrework <- length(rework)

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that(" The first and the second arguments must have the same length ", {
  expect_equal(lenghtdefects, lenghtrework)
})

test_that("expect type", {
   expect_type(opportunities, "double")
})

test_that("expect type", {
   expect_type(defects, "double")
})

test_that("expect type", {
   expect_type(rework, "double")
})

 # test_that("warning message", {
 #   expect_snapshot_output(result)
 # })

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
