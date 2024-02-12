# script: Collect Three-patters
# date: 2024-02-12
# author: Serkan Korkmaz, serkor1@duck.com
# objective:
#
# Falling Three
# Rising Three
#
# Black Crows
# White Soldiers
#
# script start;


#' Determine falling three pattern using a OHLC price series
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#'
#' @param ohlc OHLC prices.
#' @param n description
#' @param delta sensitivity
#'
#' @family three-method-patterns
#' @family 5-day patterns
#'
#' @returns A [logical]-vector of same length
#'
#' @author Chiu-Yu Ko
#'
#' @export
falling_three <- function(
    ohlc,
    n = 20,
    delta = 1) {

  bull_candle <- bullish_candle(ohlc)
  bear_candle <- bearish_candle(ohlc)

  l4_bear_candle <- xts::lag.xts(bear_candle,4)

  l_bull_candle <- xts::lag.xts(bull_candle,1)
  l2_bull_candle <- xts::lag.xts(bull_candle,2)
  l3_bull_candle <- xts::lag.xts(bull_candle,3)

  long_candle <- candle_feature(ohlc = ohlc, feature = "is_long", n = n, delta = delta)
  l_long_candle <- xts::lag.xts(long_candle)
  l4_long_candle <- xts::lag.xts(long_candle,4)

  lowest_price <- extract_column(ohlc, pattern = "low", column_names = colnames(ohlc))
  l4_lowest_price <- TTR::runMin(lowest_price,4)
  l_lowest_price <- xts::lag.xts(l4_lowest_price)

  highest_price <- extract_column(ohlc, pattern = "high", column_names = colnames(ohlc))
  l4_highest_price <- TTR::runMax(highest_price,n=4)
  l_highest_price <- xts::lag.xts(highest_price,4)

  bear_candle & long_candle &
    l_bull_candle & l2_bull_candle & l3_bull_candle &
    l4_bear_candle & l4_long_candle &
    lowest_price < l_lowest_price &
    l_highest_price > l4_highest_price

}


#' Determine rising three pattern using a OHLC price series
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#'
#' @param ohlc OHLC prices.
#' @param n description
#' @param delta sensitivity
#'
#' @family three-method-patterns
#' @family 5-day patterns
#'
#' @returns A [logical]-vector of same length
#'
#' @author Chiu-Yu Ko
#'
#' @export


rising_three <- function(
    ohlc,
    n=20,
    delta=1) {

  bull_candle <- bullish_candle(ohlc)
  bear_candle <- bearish_candle(ohlc)

  l4_bull_candle <- xts::lag.xts(bull_candle,4)

  l_bear_candle <- xts::lag.xts(bear_candle,1)
  l2_bear_candle <- xts::lag.xts(bear_candle,2)
  l3_bear_candle <- xts::lag.xts(bear_candle,3)

  long_candle <- candle_feature(ohlc = ohlc, feature = "is_long", n = n, delta = delta)
  l_long_candle <- xts::lag.xts(long_candle)
  l4_long_candle <- xts::lag.xts(long_candle,4)

  lowest_price <- extract_column(ohlc, pattern = "low", column_names = colnames(ohlc))
  l4_lowest_price <- TTR::runMin(lowest_price,4)

  l_lowest_price <- xts::lag.xts(lowest_price,4)

  high_price <- extract_column(ohlc, pattern = "high", column_names = colnames(ohlc))
  highest_price <- TTR::runMax(high_price,n=4)
  l_highest_price <- xts::lag.xts(highest_price)

  bull_candle & long_candle &
    l_bear_candle & l2_bear_candle & l3_bear_candle &
    l4_bull_candle & l4_long_candle &
    high_price > l_highest_price &
    l_lowest_price < l4_lowest_price
}


#' Determine three black crows pattern using a OHLC price series
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#'
#' @param ohlc OHLC prices.
#' @param n description
#' @param delta sensitivity
#'
#' @family three-in-a-row patterns
#' @family 3-day patterns
#'
#' @returns A [logical]-vector of same length
#'
#' @author Chiu-Yu Ko
#'
#' @export


three_black_crows <- function(
    ohlc,
    n=20,
    delta=1) {

  bear_candle <- bearish_candle(ohlc)
  l_bear_candle <- xts::lag.xts(bear_candle)
  l2_bear_candle <- xts::lag.xts(bear_candle,2)

  long_candle <- candle_feature(ohlc = ohlc, feature = "is_long", n = n, delta = delta)
  l_long_candle <- xts::lag.xts(long_candle)
  l2_long_candle <- xts::lag.xts(long_candle,2)

  close_price <-  extract_column(ohlc, pattern = "close", column_names = colnames(ohlc))
  l_close_price <- xts::lag.xts(close_price)
  l2_close_price <-xts::lag.xts(close_price,2)

  open_price <- extract_column(ohlc, pattern = "open", column_names = colnames(ohlc))
  l_open_price <- xts::lag.xts(open_price)
  l2_open_price <-xts::lag.xts(open_price,2)

  bear_candle & l_bear_candle & l2_bear_candle &
    long_candle & l_long_candle & l2_long_candle &
    close_price < l_close_price & l_close_price < l2_close_price &
    open_price < l_open_price & l_open_price < l2_open_price
}

#' Determine three white soldiers pattern using a OHLC price series
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#'
#' @param ohlc OHLC prices.
#' @param n description
#' @param delta sensitivity
#'
#' @family three-in-a-row patterns
#' @family 3-day patterns
#'
#' @returns A [logical]-vector of same length
#'
#' @author Chiu-Yu Ko
#'
#' @export


three_white_soldiers <- function(
    ohlc,
    n=20,
    delta=1) {

  bull_candle <- bullish_candle(ohlc)
  l_bull_candle <- xts::lag.xts(bull_candle)
  l2_bull_candle <- xts::lag.xts(bull_candle,2)

  long_candle <-  candle_feature(ohlc = ohlc, feature = "is_long", n = n, delta = delta)
  l_long_candle <- xts::lag.xts(long_candle)
  l2_long_candle <- xts::lag.xts(long_candle,2)

  price_close <- extract_column(ohlc, pattern = "close", column_names = colnames(ohlc))
  l_price_close <- xts::lag.xts(price_close)
  l2_price_close <-xts::lag.xts(price_close,2)

  price_open <- extract_column(ohlc, pattern = "open", column_names = colnames(ohlc))
  l_price_open <- xts::lag.xts(price_open)
  l2_price_open <-xts::lag.xts(price_open,2)

  bull_candle & l_bull_candle & l2_bull_candle &
    long_candle & l_long_candle & l2_long_candle &
    price_close > l_price_close & l_price_close > l2_price_close &
    price_open > l_price_open & l_price_open > l2_price_open
}

# script end;
