#' Determine falling three pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @param n number of period of trend
#' @param delta sensitivity for long candle
#' @return TRUE if kicking up pattern detected
#' @export


falling.three <- function(x,n=20,delta=1) {
  U <- bullish.candle(x)
  D <- bearish.candle(x)

  Lag4.D <- Lag(D,4)

  Lag.U <- Lag(U,1)
  Lag2.U <- Lag(U,2)
  Lag3.U <- Lag(U,3)

  LC <- long.candle(x,n,delta)
  Lag.LC <- Lag(LC)
  Lag4.LC <- Lag(LC,4)

  LO <- Lo(x)
  MIN.LO <- runMin(LO,4)
  Lag.MIN.LO <- Lag(MIN.LO)

  HI <- Hi(x)
  MAX.HI <- runMax(HI,n=4)
  Lag4.HI <- Lag(HI,4)

  result <- reclass(D & LC &
                      Lag.U & Lag2.U & Lag3.U &
                      Lag4.D & Lag4.LC &
                      LO < Lag.MIN.LO &
                      Lag4.HI > MAX.HI,
                    x)
  colnames(result) <- "failling three"
  return(result)
}
