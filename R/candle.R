#' Determine bearish candle using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if bullish candel detected
#'
#' @export
bearish_candle <- function(
    ohlc) {

  # 0) Check calling
  # function

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
#' @param x OHLC prices.
#' @return TRUE if bullish candle detected
#' @export
bullish_candle <- function(ohlc) {

  # 0) Check calling
  # function

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
