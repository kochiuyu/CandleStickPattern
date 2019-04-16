#' Determine gap down using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if bullish candel detected
#' @examples
#' getSymbols('AAPL',adjust=TRUE)
#' doji(AAPL)

gap.down <- function(x) {
  OP <- Op(x)
  CL <- Cl(x)
  Lag.CL <- Lag(CL)

  result <- reclass(OP < Lag.CL, x)
  colnames(result) <- "Gap down"
  return(result)
}
