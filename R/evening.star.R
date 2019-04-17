#' Determine everning star pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @param n number of period of trend
#' @param L.delta sensitivity for long candle
#' @param S.delta sensitivity for short candle
#' @return TRUE if kicking up pattern detected
#' @export


evening.star <- function(x,n=20,L.delta=1,S.delta=1) {
  U <- bullish.candle(x)
  D <- bearish.candle(x)

  Lag2.U <- Lag(U,2)

  LC <- long.candle(x,n,delta)
  Lag2.LC <- Lag(LC,2)

  SC <- short.candle(x,n,delta)
  Lag.SC <- Lag(SC)

  GU <- gap.up(x)
  GD <- gap.down(x)
  Lag.GU <- Lag(GU)


  result <- reclass(D & LC &
                      Lag.SC &
                      Lag2.U & Lag2.LC &
                      GD &
                      Lag.GU,
                    x)
  colnames(result) <- "evening star"
  return(result)
}
