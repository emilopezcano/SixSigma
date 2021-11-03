library(SixSigma)
library(testthat)

#Cause and Effect Diagram

effect <- "Flight Time"
causes.gr <- c("Operator", "Environment", "Tools", "Design",
               "Raw.Material", "Measure.Tool")
causes <- vector(mode = "list", length = length(causes.gr))
causes[1] <- list(c("operator #1", "operator #2", "operator #3"))
causes[2] <- list(c("height", "cleaning"))
causes[3] <- list(c("scissors", "tape"))
causes[4] <- list(c("rotor.length", "rotor.width2", "paperclip"))
causes[5] <- list(c("thickness", "marks"))
causes[6] <- list(c("calibrate", "model"))
main <- "Cause and Effect Diagram"
sub <- "Paper Helicopter Project"

ss.ceDiag(effect, causes.gr, causes, main, sub)

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that("expected data type",{
  expect_type(effect, "character")
})

test_that("expect data type",{
  expect_type(causes.gr,"character")
})

test_that("expect data type",{
  expect_type(causes,"list")
})

test_that("expect data type",{
  expect_type(main,"character")
})

test_that("expect data type",{
  expect_type(sub,"character")
})
