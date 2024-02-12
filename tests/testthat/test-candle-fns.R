testthat::test_that(
  desc = "Test that the candle_pattern-function can run without issues",
  code = {

    # 1) run without errors
    testthat::expect_no_error(
      object = candle_pattern(
        pattern = list(
          three_black_crows(),
          three_white_soldiers(),
          rising_three(),
          falling_three()
        ),
        ohlc = MSFT
      )
    )

  }
)
