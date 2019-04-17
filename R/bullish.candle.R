#' Determine bullish candle using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if bullish candle detected
#' @export


bullish.candle <- function(x) {
  OP <- Op(x)
  CL <- Cl(x)

  result <- reclass(OP < CL, x)
  colnames(result) <- "bullish candle"
  return(result)
}
