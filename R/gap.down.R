#' Determine gap down using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if bullish candel detected
#' @export


gap.down <- function(x) {
  OP <- Op(x)
  CL <- Cl(x)
  Lag.CL <- Lag(CL)
  Lag.OP <- Lag(OP)

  GAP <- pmax(OP,CL) - pmin(Lag.CL,Lag.OP)

  result <- reclass(GAP<0, x)
  colnames(result) <- "Gap down"
  return(result)
}
