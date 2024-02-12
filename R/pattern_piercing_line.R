# script: Piercing Line Pattern
# date: 2024-02-12
# author: Serkan Korkmaz, serkor1@duck.com
# objective: Collect the piercing line pattern
# script start;
#
#' Determine piercing line pattern using a OHLC price series
#' @description
#' `r lifecycle::badge("experimental")`
#' @param ohlc OHLC prices.
#' @return TRUE if hammer pattern detected
#' @export

piercing_line <- function(ohlc) {

  close_price <- extract_column(
    ohlc,
    pattern="close",
    column_names = colnames(ohlc)
  )

  body_center <- body_feature(
    ohlc,
    feature = "center"
  )

  l_body_center <- xts::lag.xts(body_center)

  bull_candle <- bullish_candle(ohlc)
  bear_candle <- bearish_candle(ohlc)

  l_bear_candle <- xts::lag.xts(bear_candle)

  bull_candle  &
    l_bear_candle &
    close_price >= l_body_center
}

# script end;
