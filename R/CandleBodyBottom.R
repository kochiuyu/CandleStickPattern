#' Determine candle body bottom using a OHLC price series
#'
#' @param x OHLC prices.
#' @return bottom of candle body
#' @examples
#' getSymbols('AAPL',adjust=TRUE)
#' doji(AAPL)

CandleBodyBottom <- function(x) {
  BT <- pmin(Op(x), Cl(x))
  result <- reclass(BT, x)
  colnames(result) <- "CandleBodyBottom"
  return(result)
}
