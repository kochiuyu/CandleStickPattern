# script: Harami Patterns
# date: 2024-02-10
# author: Serkan Korkmaz, serkor1@duck.com
# objective: Collect Harami Patterns
# script start;

#' Determine bearish harami pattern using a OHLC price series
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#'
#' @param ohlc OHLC prices.
#'
#' @family harami-patterns
#' @family 2-day patterns
#'
#' @returns A [logical]-vector of same length
#'
#' @author Chiu-Yu Ko
#'
#' @export

bearish_harami <- function(
    ohlc) {

  # check ohlc input
  # before anything
  is_ohlc(ohlc = ohlc)

   body_top <- body_feature(
    ohlc = ohlc,
    feature = "top"
  )

  body_bottom <- body_feature(
    ohlc = ohlc,
    feature = "bottom"
  )

  l_body_top <- xts::lag.xts(body_top)
  l_body_bottom <-  xts::lag.xts(body_bottom)

  bull_candle <- bullish_candle(ohlc = ohlc)
  bear_candle <- bearish_candle(ohlc = ohlc)

  l_bull_candle <-  xts::lag.xts(bull_candle)

  bear_candle  &
    l_bull_candle &
    body_top <= l_body_top &
    body_bottom >= l_body_bottom
}

#' Determine bullish harami pattern using a OHLC price series
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#'
#' @param ohlc OHLC prices.
#'
#' @family harami-patterns
#' @family 2-day patterns
#'
#' @returns A [logical]-vector of same length
#'
#' @author Chiu-Yu Ko
#'
#' @export
bullish_harami <- function(
    ohlc) {

  # check ohlc input
  # before anything
  is_ohlc(ohlc = ohlc)

  body_top <- body_feature(
    ohlc = ohlc,
    feature = "top"
  )

  body_bottom <- body_feature(
    ohlc = ohlc,
    feature = "bottom"
  )

  l_body_top <-  xts::lag.xts(body_top)
  l_body_bottom <-  xts::lag.xts(body_bottom)

  bull_candle <- bullish_candle(ohlc = ohlc)
  bear_candle <- bearish_candle(ohlc = ohlc)

  l_bear_candle <-  xts::lag.xts(bear_candle)

  bull_candle  &
    l_bear_candle &
    body_top <= l_body_top &
    body_bottom >= l_body_bottom
}

# script end;
