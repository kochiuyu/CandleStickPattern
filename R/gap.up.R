#' Determine gap up using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if bullish candel detected
#' @export


gap.up <- function(x) {
  OP <- Op(x)
  CL <- Cl(x)
  Lag.CL <- Lag(CL)
  Lag.OP <- Lag(OP)

  GAP <- pmin(OP,CL) - pmax(Lag.CL,Lag.OP)

  result <- reclass(GAP>0, x)
  colnames(result) <- "Gap up"
  return(result)
}
