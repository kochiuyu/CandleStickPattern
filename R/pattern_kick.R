# script: Kick Patterns
# date: 2024-02-12
# author: Serkan Korkmaz, serkor1@duck.com
# objective: Collect all kick
# patterns
#
# Kick Up
# Kick Down
#
# script start;

#' Determine kicking up pattern using a OHLC price series
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' @param ohlc OHLC prices.
#' @return TRUE if kicking up pattern detected
#' @export


kick_up <- function(
    ohlc) {
  bull_candle <- bullish_candle(ohlc)
  bear_candle <- bearish_candle(ohlc)
  gap_up <- gap_up(ohlc)

  Lag.D <- xts::lag.xts(bear_candle)

  bull_candle  &
    Lag.D &
    gap_up
}


#' Determine kicking down pattern using a OHLC price series
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' @param ohlc OHLC prices.
#' @return TRUE if kicking down pattern detected
#' @export


kick_down <- function(
    ohlc) {
  bull_candle <- bullish_candle(ohlc)
  bear_candle <- bearish_candle(ohlc)
  gap_down <- gap_down(ohlc)

  Lag.U <- xts::lag.xts(bull_candle)

  bear_candle  &
    Lag.U &
    gap_down
}
# script end;
