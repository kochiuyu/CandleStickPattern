#' Determine candle body length using a OHLC price series
#'
#' @param x OHLC prices.
#' @return length of candle body
#' @export


CandleBodyLength <- function(x) {
  BL <- abs(quantmod::Op(x) - quantmod::Cl(x))
  result <- xts::reclass(BL, x)
  colnames(result) <- "CandleBodyLength"
  return(result)
}
