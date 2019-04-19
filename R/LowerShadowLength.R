#' Determine lower shadow length using a OHLC price series
#'
#' Lower shadow length is the differernce between the low price and the minimium of open and close price.
#'
#' @param x OHLC prices.
#' @return length of lower shadow;
#'
#' @author Ko Chiu Yu, \email{kochiuyu@@gmail.com}
#'
#' @export

LowerShadowLength <- function(x) {
  LS <- CandleBodyBottom(x) - quantmod::Lo(x)
  result <- xts::reclass(LS, x)
  colnames(result) <- "LowerShadowLength"
  return(result)
}
