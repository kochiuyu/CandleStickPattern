#' Determine rising three pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @param n number of period of trend
#' @param delta sensitivity for long candle
#' @return TRUE if kicking up pattern detected
#' @export


rising.three <- function(x,n=20,delta=1) {
  U <- bullish.candle(x)
  D <- bearish.candle(x)

  Lag4.U <- Lag(U,4)

  Lag.D <- Lag(D,1)
  Lag2.D <- Lag(D,2)
  Lag3.D <- Lag(D,3)

  LC <- long.candle(x,n,delta)
  Lag.LC <- Lag(LC)
  Lag4.LC <- Lag(LC,4)

  LO <- Lo(x)
  MIN.LO <- runMin(LO,4)

  Lag4.LO <- Lag(LO,4)

  HI <- Hi(x)
  MAX.HI <- runMax(HI,n=4)
  Lag.MAX.HI <- Lag(MAX.HI)

  result <- reclass(U & LC &
                      Lag.D & Lag2.D & Lag3.D &
                      Lag4.U & Lag4.LC &
                      HI > Lag.MAX.HI &
                      Lag4.LO < MIN.LO,
                    x)
  colnames(result) <- "rising three"
  return(result)
}
