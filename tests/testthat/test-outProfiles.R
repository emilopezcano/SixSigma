library(SixSigma)
library(testthat)

#Get out-of-control profiles

wby.phase1 <- ss.data.wby[, 1:35]
wb.limits <- climProfiles(profiles = wby.phase1,
                          x = ss.data.wbx,
                          smoothprof = TRUE,
                          smoothlim = TRUE)
wby.phase2 <- ss.data.wby[, 36:50]
wb.out.phase2 <- outProfiles(profiles = wby.phase2,
                             x = ss.data.wbx,
                             cLimits = wb.limits,
                             tol = 0.8)
wb.out.phase2
plot <- plotProfiles(wby.phase2,
                     x = ss.data.wbx,
                     cLimits = wb.limits,
                     outControl = wb.out.phase2$idOut,
                     onlyout = TRUE)

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that("expected data type",{
   expect_type(wb.out.phase2,"list")
})

test_that("length of wb.out.phase2",{
  expect_length(wb.out.phase2,3)
})

test_that("expected data type",{
  expect_type(wb.out.phase2$labOut,"character")
})

test_that("expected data type",{
  expect_type(wb.out.phase2$idOut,"integer")
})

test_that("expected data type",{
  expect_type(wb.out.phase2$pOut,"double")
})

test_that("labels of the out-of-control profiles",{
  expect_equal(wb.out.phase2$labOut,"P47")
})

test_that("ids of the out-of-control profiles",{
  expect_equal(wb.out.phase2$idOut,12)
})

out <- c(0.00, 0.00, 0.00, 0.00, 0.00, 0.01, 0.00, 0.00, 0.00, 0.00, 0.00, 0.95, 0.00, 0.00, 0.00)

test_that("proportion of times the profile values are out of the limits",{
  expect_equal(wb.out.phase2$pOut,out)
})
