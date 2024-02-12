# script: Gap Patterns
# date: 2024-02-12
# author: Serkan Korkmaz, serkor1@duck.com
# objective: Collect Gap Patterns
#
# Gap Up
# Gap Down
# script start;

#' Determine gap up using a OHLC price series
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' @param ohlc OHLC prices.
#'
#' @family gap
#'
#' @returns A [logical]-vector of same [length] with identified gaps.
#'
#' @author Chiu-Yu Ko
#'
#' @example man/examples/scr_gap.R
#'
#' @export
gap_up <- function(ohlc) {

  column_names <- colnames(ohlc)

  open_price <- extract_column(ohlc = ohlc,pattern = "open",column_names = column_names)
  close_price <- extract_column(ohlc = ohlc,pattern = "close",column_names = column_names)

  l_close_price <- xts::lag.xts(close_price)
  l_open_price <-  xts::lag.xts(open_price)

  price_gap <- pmin(open_price,close_price) - pmax(l_close_price,l_open_price)

  price_gap > 0
}


#' Determine gap down using a OHLC price series
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' @param ohlc OHLC prices.
#'
#' @family gap
#'
#' @returns A [logical]-vector of same [length] with identified gaps.
#'
#' @author Chiu-Yu Ko
#'
#' @example man/examples/scr_gap.R
#'
#' @export

gap_down <- function(ohlc) {

  column_names <- colnames(ohlc)

  open_price <- extract_column(ohlc = ohlc,pattern = "open",column_names = column_names)
  close_price <- extract_column(ohlc = ohlc,pattern = "close",column_names = column_names)

  l_close_price <- xts::lag.xts(close_price)
  l_open_price <-  xts::lag.xts(open_price)

  price_gap <- pmin(open_price,close_price) - pmax(l_close_price,l_open_price)

  price_gap > 0

  price_gap < 0
}

# script end;
