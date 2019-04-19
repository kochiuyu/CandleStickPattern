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

  Lag4.D <- quantmod::Lag(D,4)

  Lag.U <- quantmod::Lag(U,1)
  Lag2.U <- quantmod::Lag(U,2)
  Lag3.U <- quantmod::Lag(U,3)

  LC <- long.candle(x,n,delta)
  Lag.LC <- quantmod::Lag(LC)
  Lag4.LC <- quantmod::Lag(LC,4)

  LO <- quantmod::Lo(x)
  MIN.LO <- TTR::runMin(LO,4)
  Lag.MIN.LO <- quantmod::Lag(MIN.LO)

  HI <- quantmod::Hi(x)
  MAX.HI <- TTR::runMax(HI,n=4)
  Lag4.HI <- quantmod::Lag(HI,4)

  result <- xts::reclass(D & LC &
                      Lag.U & Lag2.U & Lag3.U &
                      Lag4.D & Lag4.LC &
                      LO < Lag.MIN.LO &
                      Lag4.HI > MAX.HI,
                    x)
  colnames(result) <- "failling three"
  return(result)
}
