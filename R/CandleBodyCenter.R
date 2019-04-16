#' Determine candle body center using a OHLC price series
#'
#' @param x OHLC prices.
#' @return center of candle body
#' @export


CandleBodyCenter <- function(x) {
  BC <- (Op(x) + Cl(x))/2
  result <- reclass(BC, x)
  colnames(result) <- "CandleBodyCenter"
  return(result)
}
