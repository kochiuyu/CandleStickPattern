context("Checking Doji")

# library(quantmod)
# getSymbols("MSFT")

test_that("Doji", {
  x <- doji(MSFT)
  expect_true(x['2011-07-11'])
  expect_true(x['2011-07-12'])
  expect_true(x['2011-07-13'])
  expect_false(x['2011-07-14'])
  expect_false(x['2011-07-15'])
  expect_true(x['2011-07-18'])
  expect_false(x['2011-07-19'])
})

test_that("Dragonfly Doji", {
  x <- dragonfly.doji(MSFT)
  expect_false(x['2014-10-30'])
  expect_true(x['2014-10-31'])
  expect_false(x['2014-11-03'])
})


test_that("Gravestone Doji", {
  x <- gravestone.doji(MSFT)
  expect_false(x['2015-04-29'])
  expect_true(x['2015-04-30'])
  expect_false(x['2015-05-01'])
})



