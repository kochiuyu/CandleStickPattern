#' Determine upper shadow length using a OHLC price series
#'
#' @param x OHLC prices.
#' @return length of upper shadow
#' @export

UpperShadowLength <- function(x) {
  US <- quantmod::Hi(x) - CandleBodyTop(x)
  result <- xts::reclass(US, x)
  colnames(result) <- "UpperShadowLength"
  return(result)
}
