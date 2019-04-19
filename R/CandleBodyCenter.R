#' Determine candle body center using a OHLC price series
#'
#' @param x OHLC prices.
#' @return center of candle body
#' @export


CandleBodyCenter <- function(x) {
  BC <- (quantmod::Op(x) + quantmod::Cl(x))/2
  result <- xts::reclass(BC, x)
  colnames(result) <- "CandleBodyCenter"
  return(result)
}
