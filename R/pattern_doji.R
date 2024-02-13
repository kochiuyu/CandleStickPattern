# script: Doji-patterns
# date: 2024-02-10
# author: Serkan Korkmaz, serkor1@duck.com
# objective: Collect all Doji-patterns
# script start;


#' Determine Doji Pattern using a OHLC price series
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#'
#' @param ohlc OHLC prices.
#' @param delta Sensivity
#'
#' @family doji-patterns
#' @family 1-day patterns
#'
#' @returns A [logical]-vector of same length
#'
#' @author Chiu-Yu Ko
#'
#' @export

doji <- function(
    ohlc,
    delta = 0.1) {

  # check ohlc input
  # before anything
  is_ohlc(ohlc = ohlc)

  candle_length <- candle_feature(ohlc,feature = 'length')
  body_length <- body_feature(ohlc,feature = 'length')


  delta * candle_length >= body_length

}

#' Determine Dragon Doji Pattern using a OHLC price series
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#'
#' @param ohlc OHLC prices.
#' @param delta Sensivity
#'
#' @family doji-patterns
#' @family 1-day patterns
#'
#' @returns A [logical]-vector of same length
#'
#' @author Chiu-Yu Ko
#'
#' @export

dragonfly_doji <- function(
    ohlc,
    delta=0.1) {

  # check ohlc input
  # before anything
  is_ohlc(ohlc = ohlc)

  candle_length <- candle_feature(ohlc,feature = 'length')
  upper_shadow <- shadow_feature(ohlc,feature = 'upper_length')

  delta * candle_length >= upper_shadow & doji(ohlc = ohlc,delta)
}

#' Determine Gravestoen Doji Pattern using a OHLC price series
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#'
#' @param ohlc OHLC prices.
#' @param delta Sensivity
#'
#' @family doji-patterns
#' @family 1-day patterns
#'
#' @returns A [logical]-vector of same length
#'
#' @author Chiu-Yu Ko
#'
#' @export
gravestone_doji <- function(
    ohlc,
    delta=0.1) {

  # check ohlc input
  # before anything
  is_ohlc(ohlc = ohlc)

  candle_length <- candle_feature(ohlc,feature = 'length')
  lower_shadow <- shadow_feature(ohlc,feature = 'lower_length')

  delta * candle_length >= lower_shadow & doji(ohlc,delta)
}



# script end;
