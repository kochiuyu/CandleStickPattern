#' Determine lower shadow length using a OHLC price series
#'
#' @param x OHLC prices.
#' @return length of lower shadow;
#'
#' @author Ko Chiu Yu, \email{kochiuyu@@gmail.com}
#'
#' @export

LowerShadowLength <- function(x) {
  LS <- CandleBodyBottom(x) - Lo(x)
  result <- reclass(LS, x)
  colnames(result) <- "LowerShadowLength"
  return(result)
}
