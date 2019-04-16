#' Determine bearish candle using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if bullish candel detected
#' @export

bearish.candle <- function(x) {
  OP <- Op(x)
  CL <- Cl(x)

  result <- reclass(OP > CL, x)
  colnames(result) <- "bearish candle"
  return(result)
}
