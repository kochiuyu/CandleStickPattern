# script: Pattern Cloud Cover
# date: 2024-02-12
# author: Serkan Korkmaz, serkor1@duck.com
# objective: Collect the Cloud Cover
# pattern
# script start;

#' Determine dark cloud cover pattern using a OHLC price series
#'
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' @param ohlc OHLC prices.
#' @return TRUE if dark cloud cover pattern detected
#' @export

dark_cloud_cover<- function(
    ohlc) {

  # check ohlc input
  # before anything
  is_ohlc(ohlc = ohlc)

  close_price <- extract_column(
    ohlc,
    pattern = "close",
    column_names = colnames(ohlc)
    )


  body_center <- body_feature(
    ohlc,
    feature = "center"
    )

  l_body_center <- xts::lag.xts(body_center)

  bull_candle <- bullish_candle(ohlc)
  bear_candle <- bearish_candle(ohlc)

  Lag.U <-xts::lag.xts(bull_candle)

  bear_candle  &
    Lag.U &
    close_price <= l_body_center
}


# script end;
