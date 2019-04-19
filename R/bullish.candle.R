#' Determine bullish candle using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if bullish candle detected
#' @export


bullish.candle <- function(x) {
  OP <- quantmod::Op(x)
  Cl <- quantmod::Cl(x)

  result <- xts::reclass(OP < Cl, x)
  colnames(result) <- "bullish candle"
  return(result)
}
