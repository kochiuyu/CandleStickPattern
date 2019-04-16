#' Determine upper shadow length using a OHLC price series
#'
#' @param x OHLC prices.
#' @return length of upper shadow


UpperShadowLength <- function(x) {
  US <- Hi(x) - CandleBodyTop(x)
  result <- reclass(US, x)
  colnames(result) <- "UpperShadowLength"
  return(result)
}
