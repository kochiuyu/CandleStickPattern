# script: Candle patterns
# date: 2024-02-12
# author: Serkan Korkmaz, serkor1@duck.com
# objective: Collect all candle
# patterns
#
# bearish candle
# bullish candle
# script start;

#' Determine bearish candle using a OHLC price series
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#' @param ohlc OHLC prices.
#'
#' @returns A [logical]-vector of same length of identifed bearish candles
#'
#' @author Chiu-Yu Ko
#'
#' @export
bearish_candle <- function(
    ohlc) {

  # check ohlc input
  # before anything
  is_ohlc(ohlc = ohlc)

  # 0) extract parameters
  column_names <- colnames(ohlc)

  # 1) define Open and Close
  # prices
  OP <- extract_column(
    ohlc = ohlc,
    pattern = "open",
    column_names = column_names
  )

  CL <- extract_column(
    ohlc = ohlc,
    pattern = "close",
    column_names = column_names
  )


  OP > CL

}

#' Determine bullish candle using a OHLC price series
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#' @param ohlc OHLC prices.
#'
#' @returns A [logical]-vector of same length of identifed bearish candles
#'
#' @author Chiu-Yu Ko
#'
#' @export
bullish_candle <- function(ohlc) {

  # check ohlc input
  # before anything
  is_ohlc(ohlc = ohlc)

  # 0) extract parameters
  column_names <- colnames(ohlc)

  # 1) define Open and Close
  # prices
  OP <- extract_column(
    ohlc = ohlc,
    pattern = "open",
    column_names = column_names
  )

  CL <- extract_column(
    ohlc = ohlc,
    pattern = "close",
    column_names = column_names
  )



  OP < CL

}
# script end;

