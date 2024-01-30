testthat::test_that("Doji", {
  x <- doji(MSFT)
  testthat::expect_true(x['2011-07-11'])
  testthat::expect_true(x['2011-07-12'])
  testthat::expect_true(x['2011-07-13'])
  testthat::expect_false(x['2011-07-14'])
  testthat::expect_false(x['2011-07-15'])
  testthat::expect_true(x['2011-07-18'])
  testthat::expect_false(x['2011-07-19'])
})

testthat::test_that("Dragonfly Doji", {
  x <- dragonfly.doji(MSFT)
  testthat::expect_false(x['2014-10-30'])
  testthat::expect_true(x['2014-10-31'])
  testthat::expect_false(x['2014-11-03'])
})


testthat::test_that("Gravestone Doji", {
  x <- gravestone.doji(MSFT)
  testthat::expect_false(x['2015-04-29'])
  testthat::expect_true(x['2015-04-30'])
  testthat::expect_false(x['2015-05-01'])
})



