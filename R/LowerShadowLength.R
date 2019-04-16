#' Determine lower shadow length using a OHLC price series
#'
#' @param x OHLC prices.
#' @return length of lower shadow

LowerShadowLength <- function(x) {
  LS <- CandleBodyBottom(x) - Lo(x)
  result <- reclass(LS, x)
  colnames(result) <- "LowerShadowLength"
  return(result)
}
