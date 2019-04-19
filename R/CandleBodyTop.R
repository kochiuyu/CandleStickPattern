#' Determine candle body top using a OHLC price series
#'
#' @param x OHLC prices.
#' @return top of candle body


CandleBodyTop <- function(x) {
  BT <- pmax(quantmod::Op(x), quantmod::Cl(x))
  result <- xts::reclass(BT, x)
  colnames(result) <- "CandleBodyTop"
  return(result)
}
