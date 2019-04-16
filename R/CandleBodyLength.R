#' Determine candle body length using a OHLC price series
#'
#' @param x OHLC prices.
#' @return length of candle body


CandleBodyLength <- function(x) {
  BL <- abs(Op(x) - Cl(x))
  result <- reclass(BL, x)
  colnames(result) <- "CandleBodyLength"
  return(result)
}
