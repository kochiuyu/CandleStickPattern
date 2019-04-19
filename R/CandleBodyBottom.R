#' Determine candle body bottom using a OHLC price series
#'
#' @param x OHLC prices.
#' @return bottom of candle body
#' @export

CandleBodyBottom <- function(x) {
  BT <- pmin(quantmod::Op(x), quantmod::Cl(x))
  result <- xts::reclass(BT, x)
  colnames(result) <- "CandleBodyBottom"
  return(result)
}
