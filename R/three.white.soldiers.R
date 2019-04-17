#' Determine three white soldiers pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @param n number of period of trend
#' @param delta sensitivity for long candle
#' @return TRUE if kicking up pattern detected
#' @export


three.white.soldiers <- function(x,n=20,delta=1) {
  U <- bullish.candle(x)
  Lag.U <- Lag(U)
  Lag2.U <- Lag(U,2)

  LC <- long.candle(x,n,delta)
  Lag.LC <- Lag(LC)
  Lag2.LC <- Lag(LC,2)

  CL <- Cl(x)
  Lag.CL <- Lag(CL)
  Lag2.CL <-Lag(CL,2)

  OP <- Op(x)
  Lag.OP <- Lag(OP)
  Lag2.OP <-Lag(OP,2)

  result <- reclass(U & Lag.U & Lag2.U &
                    LC & Lag.LC & Lag2.LC &
                    CL > Lag.CL & Lag.CL > Lag2.CL &
                    OP > Lag.OP & Lag.OP > Lag2.OP,
                    x)
  colnames(result) <- "three white soliders"
  return(result)
}
