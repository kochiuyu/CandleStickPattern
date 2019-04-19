#' Determine three white soldiers pattern using a OHLC price series
#'
#' @param x OHLC prices.
#' @param n number of period of trend
#' @param delta sensitivity for long candle
#' @return TRUE if kicking up pattern detected
#' @export


three.white.soldiers <- function(x,n=20,delta=1) {
  U <- bullish.candle(x)
  Lag.U <- quantmod::Lag(U)
  Lag2.U <- quantmod::Lag(U,2)

  LC <- long.candle(x,n,delta)
  Lag.LC <- quantmod::Lag(LC)
  Lag2.LC <- quantmod::Lag(LC,2)

  Cl <- quantmod::Cl(x)
  Lag.Cl <- quantmod::Lag(Cl)
  Lag2.Cl <-quantmod::Lag(Cl,2)

  OP <- quantmod::Op(x)
  Lag.OP <- quantmod::Lag(OP)
  Lag2.OP <-quantmod::Lag(OP,2)

  result <- xts::reclass(U & Lag.U & Lag2.U &
                    LC & Lag.LC & Lag2.LC &
                    Cl > Lag.Cl & Lag.Cl > Lag2.Cl &
                    OP > Lag.OP & Lag.OP > Lag2.OP,
                    x)
  colnames(result) <- "three white soliders"
  return(result)
}
