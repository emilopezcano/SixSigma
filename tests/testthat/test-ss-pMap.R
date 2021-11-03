library(SixSigma)
library(testthat)

#Process Map

inputs.overall<-c("operators", "tools", "raw material", "facilities")
outputs.overall<-c("helicopter")
steps<-c("INSPECTION", "ASSEMBLY", "TEST", "LABELING")
#Inputs of process "i" are inputs of process "i+1"
input.output<-vector(mode="list",length=length(steps))
input.output[1]<-list(c("sheets", "..."))
input.output[2]<-list(c("sheets"))
input.output[3]<-list(c("helicopter"))
input.output[4]<-list(c("helicopter"))

#Parameters of each process
x.parameters<-vector(mode="list",length=length(steps))
x.parameters[1]<-list(c(list(c("width", "NC")),list(c("operator", "C")),
                        list(c("Measure pattern", "P")), list(c("discard", "P"))))
x.parameters[2]<-list(c(list(c("operator", "C")),list(c("cut", "P")),
                        list(c("fix", "P")), list(c("rotor.width", "C")),list(c("rotor.length",
                                                                                "C")), list(c("paperclip", "C")), list(c("tape", "C"))))
x.parameters[3]<-list(c(list(c("operator", "C")),list(c("throw", "P")),
                        list(c("discard", "P")), list(c("environment", "N"))))
x.parameters[4]<-list(c(list(c("operator", "C")),list(c("label", "P"))))
x.parameters

#Features of each process
y.features<-vector(mode="list",length=length(steps))
y.features[1]<-list(c(list(c("ok", "Cr"))))
y.features[2]<-list(c(list(c("weight", "Cr"))))
y.features[3]<-list(c(list(c("time", "Cr"))))
y.features[4]<-list(c(list(c("label", "Cr"))))
y.features

ss.pMap(steps, inputs.overall, outputs.overall,
        input.output, x.parameters, y.features,
        sub ="Paper Helicopter Project")

####################################################################
#Unit tests
#Author: Paula Martinez Vaquero
####################################################################

test_that("expect data type",{
  expect_type(steps,"character")
})

test_that("expect data type",{
  expect_type(inputs.overall,"character")
})

test_that("expect data type",{
  expect_type(outputs.overall,"character")
})

test_that("expect data type",{
  expect_type(input.output,"list")
})

test_that("expect data type",{
  expect_type(x.parameters,"list")
})

test_that("expect data type",{
  expect_type(y.features,"list")
})

test_that("expect data type",{
  expect_type(sub,"closure")
})
