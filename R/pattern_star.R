# script: Star Patterns
# date: 2024-02-12
# author: Serkan Korkmaz, serkor1@duck.com
# objective: Collect all Star-patterns
#
# Morning Star
# Evening Star
#
# script start;

#' Determine morning star pattern using a OHLC price series
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#'
#' @param ohlc A [data.frame] containing Open, High, Low, Close prices
#' @param n number of period of trend
#' @param delta A named [list] of sensitivity parameters
#'
#' @family star
#'
#' @returns TRUE if kicking up pattern detected
#'
#' @author Chiu-Yu Ko
#'
#' @example man/examples/scr_star.R
#'
#' @export
morning_star <- function(
    ohlc,
    n = 20,
    delta = list(
      long_candle  = 1,
      short_candle = 1
    )) {

  bull_candle <- bullish_candle(ohlc)
  bear_candle <- bearish_candle(ohlc)

  l_bear_candle <- xts::lag.xts(bear_candle,2)

  long_candle <- candle_feature(ohlc = ohlc,feature = 'is_long',n = n, delta = delta$long_candle)
  l_long_candle <-  xts::lag.xts(long_candle,2)

  short_candle <- candle_feature(ohlc = ohlc,feature = 'is_short',n = n, delta = delta$short_candle)
  l_short_candle <-  xts::lag.xts(short_candle)

  upside_gap <- gap_up(ohlc)
  downside_gap <- gap_down(ohlc)
  l_downside_gap <-  xts::lag.xts(downside_gap)


  bull_candle & long_candle & l_short_candle & l_bear_candle & l_long_candle & upside_gap & l_downside_gap

}

#' Determine evening star pattern using a OHLC price series
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#'
#' @param ohlc A [data.frame] containing Open, High, Low, Close prices
#' @param n number of period of trend
#' @param delta A named [list] of sensitivity parameters
#'
#' @family star
#'
#' @returns TRUE if kicking up pattern detected
#'
#' @author Chiu-Yu Ko
#'
#' @example man/examples/scr_star.R
#'
#' @export


evening_star <- function(
    ohlc,
    n = 20,
    delta = list(
      long_candle  = 1,
      short_candle = 1
    )) {

  bull_candle <- bullish_candle(ohlc)
  bear_candle <- bearish_candle(ohlc)

  l_bull_candle <- xts::lag.xts(bull_candle,2)

  long_candle <- candle_feature(ohlc = ohlc,feature = 'is_long',n = n, delta = delta$long_candle)
  l_long_candle <-  xts::lag.xts(long_candle,2)

  short_candle <- candle_feature(ohlc = ohlc,feature = 'is_short',n = n, delta = delta$short_candle)
  l_short_candle <-  xts::lag.xts(short_candle)

  upside_gap <- gap_up(ohlc)
  downside_gap <- gap_down(ohlc)

  l_downside_gap <-  xts::lag.xts(upside_gap)


  bear_candle & long_candle &
    l_short_candle &
    l_bull_candle & l_long_candle &
    downside_gap &
    l_downside_gap
}

# script end;
