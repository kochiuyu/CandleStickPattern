# script: Trend Patterns
# date: 2024-02-12
# author: Serkan Korkmaz, serkor1@duck.com
# objective: Collect all
# Trend patterns
#
# up_trend
# down_trend
#
# script start;

#' Determine up trend based on moving average using a OHLC price series
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' @param ohlc OHLC prices.
#' @param delta sensitivity
#' @param S number of short period for short-run moving average
#' @param L number of short period for short-run SMA
#'
#'
#' @family Trend patterns
#'
#' @returns length of upper shadow
#' @export

trend_up <- function(
    ohlc,
    delta=0.01,
    S=5,
    L=20) {

  # check ohlc input
  # before anything
  is_ohlc(ohlc = ohlc)

  close_price <- extract_column(
    ohlc,
    pattern = "close",
    column_names = colnames(ohlc)
  )

  r <- TTR::EMA(close_price,n=S)/TTR::EMA(close_price,n=L)-1


  r > delta
}

#' Determine down trend based on moving average using a OHLC price series
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' @param ohlc OHLC prices.
#' @param delta sensitivity
#' @param S number of short period for short-run moving average
#' @param L number of short period for short-run SMA
#'
#' @family Trend patterns
#'
#' @returns length of upper shadow
#' @export

trend_down <- function(
    ohlc,
    delta=0.01,
    S=5,
    L=20) {

  # check ohlc input
  # before anything
  is_ohlc(ohlc = ohlc)

  close_price <- extract_column(
    ohlc,
    pattern = "close",
    column_names = colnames(ohlc)
  )


  r <- TTR::EMA(close_price,n=S)/TTR::EMA(close_price,n=L)-1
  r < (-delta)
}


# script end;
