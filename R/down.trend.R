#' Determine down trend based on moving average using a OHLC price series
#'
#' @param x OHLC prices.
#' @param S number of short period for short-run moving average
#' @param L number of short period for short-run SMA
#' @return length of upper shadow
#' @export

down.trend <- function(x, delta=0.01, S=5, L=20) {
  CL <- Cl(x)
  r <- EMA(CL,n=S)/EMA(CL,n=L)-1
  result <- reclass(r < - delta, x)
  colnames(result) <- "Down Trend"
  return(result)
}
