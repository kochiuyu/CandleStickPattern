#' Determine candle body top using a OHLC price series
#'
#' @param x OHLC prices.
#' @return top of candle body
#' @examples
#' getSymbols('AAPL',adjust=TRUE)
#' doji(AAPL)

CandleBodyTop <- function(x) {
  BT <- pmax(Op(x), Cl(x))
  result <- reclass(BT, x)
  colnames(result) <- "CandleBodyTop"
  return(result)
}
