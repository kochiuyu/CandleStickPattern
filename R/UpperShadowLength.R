#' Determine upper shadow length using a OHLC price series
#'
#' @param x OHLC prices.
#' @return length of upper shadow
#' @examples
#' getSymbols('AAPL',adjust=TRUE)
#' doji(AAPL)

UpperShadowLength <- function(x) {
  US <- Hi(x) - CandleBodyTop(x)
  result <- reclass(US, x)
  colnames(result) <- "UpperShadowLength"
  return(result)
}
