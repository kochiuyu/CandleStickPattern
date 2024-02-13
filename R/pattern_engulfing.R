# script: Engulfing Patterns
# date: 2024-02-10
# author: Serkan Korkmaz, serkor1@duck.com
# objective: Collect Bearish and Bullish Engulfing
# patterns
# script start;


#' Determine bearish engulfing pattern using a OHLC price series
#'
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#'
#'
#' @param ohlc A data.frame containing Open, High, Low, Close prices
#'
#' @family engulfing patterns
#' @family 2-day patterns
#'
#' @returns A [logical]-vector of same length
#'
#' @author Chiu-Yu Ko
#'
#' @export
bearish_engulfing <- function(
    ohlc) {

  # check ohlc input
  # before anything
  is_ohlc(ohlc = ohlc)

  # 0) parameters
  candle_top <- body_feature(
    ohlc = ohlc,
    feature = "top"
  )


  candle_bottom <- body_feature(
    ohlc = ohlc,
    feature = "bottom"
  )

  l_candle_top <- xts::lag.xts(
    candle_top
  )

  l_candle_bottom <- xts::lag.xts(
    candle_bottom
  )


  l_bull_candle <- xts::lag.xts(
    bullish_candle(
      ohlc
    )
  )

  bear_candle <- bearish_candle(
    ohlc
  )

  bear_candle &
    l_bull_candle &
    candle_top >= l_candle_top &
    candle_bottom <= l_candle_bottom

}


#' Determine bullish engulfing pattern using a OHLC price series
#'
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#'
#'
#' @param ohlc A data.frame containing Open, High, Low, Close prices
#'
#' @family engulfing patterns
#' @family 2-day patterns
#'
#' @returns Returns a data.frame-object with identified patterns
#'
#' @author Chiu-Yu Ko
#'
#' @export
bullish_engulfing <- function(
    ohlc) {

  # check ohlc input
  # before anything
  is_ohlc(ohlc = ohlc)


  # 0) parameters
  candle_top <- body_feature(
    ohlc = ohlc,
    feature = "top"
  )


  candle_bottom <- body_feature(
    ohlc = ohlc,
    feature = "bottom"
  )

  l_candle_top <- xts::lag.xts(
    candle_top
  )

  l_candle_bottom <- xts::lag.xts(
    candle_bottom
  )


  bull_candle <- bullish_candle(
    ohlc
  )

  l_bear_candle <- xts::lag.xts(
    bearish_candle(
    ohlc
  )
  )

  bull_candle  &
    l_bear_candle &
    candle_top >= l_candle_top &
    candle_bottom <= l_candle_bottom
}


# script end;
