# Test for loss function analysis function
# 
# Author: Emilio L. Cano
###############################################################################


lfaNominal <- ss.lfa(ss.data.bolts, "diameter", 
  lfa.Delta = 0.5, lfa.L0 = 0.001, lfa.Y0 = 10, lfa.output = "text")
lfaSmaller <- ss.lfa(ss.data.bolts, "diameter", 
  lfa.Delta = 0.5, lfa.L0 = 0.001, lfa.Y0 = 0, lfa.output = "text")
lfaLarger <- ss.lfa(ss.data.bolts, "diameter", 
  lfa.Delta = 0.5, lfa.L0 = 0.001, lfa.Y0 = Inf, lfa.output = "text")

test_that("Constant k is correctly computed",{
    expect_equal(lfaNominal$lfa.k, 0.001/(0.5^2))
    expect_equal(lfaSmaller$lfa.k, 0.001/(0.5^2))
    expect_equal(lfaLarger$lfa.k, 0.001*(0.5^2))
  })

