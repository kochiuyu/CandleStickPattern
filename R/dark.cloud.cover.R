#' Determine dark cloud cover pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if dark cloud cover pattern detected

dark.cloud.cover<- function(x) {
  CL <- Cl(x)
  M <- CandleBodyCenter(x)

  Lag.M <- Lag(M)

  U <- bullish.candle(x)
  D <- bearish.candle(x)

  Lag.U <- Lag(U)

  result <- reclass(D  &
                    Lag.U &
                    CL <= Lag.M,
                    x)
  colnames(result) <- "dark cloud cover"
  return(result)
}
