#' Determine up trend based on moving average using a OHLC price series
#'
#' @param x OHLC prices.
#' @param delta sensitivity
#' @param S number of short period for short-run moving average
#' @param L number of short period for short-run SMA
#' @return length of upper shadow
#' @export

up.trend <- function(x, delta=0.01, S=5, L=20) {
  Cl <- quantmod::Cl(x)
  r <- TTR::EMA(Cl,n=S)/TTR::EMA(Cl,n=L)-1
  result <- xts::reclass(r > delta, x)
  colnames(result) <- "Up Trend"
  return(result)
}
