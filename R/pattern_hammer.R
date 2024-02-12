# script: Hammer Patterns
# date: 2024-02-12
# author: Serkan Korkmaz, serkor1@duck.com
# objective: Collect Hammer Patterns
#
# Hammer
# Inverted Hammer
#
# script start;


#' Identify Hammer patterns in OHLC-series
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#'
#' @param ohlc A data.frame containing Open, High, Low, Close prices
#' @param delta A named [list] of sensitivity parameters
#' \itemize{
#'  \item upper_shadow
#'  \item lower_shadow
#' }
#'
#' @family hammer
#'
#' @returns Returns a data.frame-object with identified patterns
#'
#' @author Chiu-Yu Ko
#'
#' @export
hammer <- function(
    ohlc,
    delta = list(
      upper_shadow = 0.7,
      lower_shadow = 0.1
    )) {

  # 0) determine delta-list
  default_delta <- list(
    upper_shadow = 0.7,
    lower_shadow = 0.1
  )


  delta <- utils::modifyList(
    x   = default_delta,
    val = delta,
    keep.null = FALSE
  )

  # 1) calculate parameters
  candle_length <- candle_feature(ohlc = ohlc,feature = "length")
  upper_shadow_length <- shadow_feature(ohlc = ohlc,feature = "upper_length")
  lower_shadow_length <- shadow_feature(ohlc = ohlc,feature = "lower_length")


  # 2) Return
  (delta$upper_shadow * candle_length >= upper_shadow_length) & (delta$lower_shadow * candle_length <= lower_shadow_length)

}

#' Identify Inverted Hammer patterns in OHLC-series
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#'
#' @param ohlc A data.frame containing Open, High, Low, Close prices
#' @param delta A named [list] of sensitivity parameters
#' \itemize{
#'  \item upper_shadow
#'  \item lower_shadow
#' }
#'
#' @family hammer
#'
#' @returns Returns a data.frame-object with identified patterns
#'
#' @author Chiu-Yu Ko
#'
#' @export
inverted_hammer <- function(
    ohlc,
    delta = list(
      upper_shadow = 0.7,
      lower_shadow = 0.1
    )) {

  # 0) determine delta-list
  default_delta <- list(
    upper_shadow = 0.7,
    lower_shadow = 0.1
  )


  delta <- utils::modifyList(
    x   = default_delta,
    val = delta,
    keep.null = FALSE
  )

  # 1) calculate parameters
  candle_length <- candle_feature(ohlc = ohlc,feature = "length")
  upper_shadow_length <- shadow_feature(ohlc = ohlc,feature = "upper_length")
  lower_shadow_length <- shadow_feature(ohlc = ohlc,feature = "lower_length")


  # 2) Return
  (delta$upper_shadow * candle_length <= upper_shadow_length) & (delta$lower_shadow * candle_length >= lower_shadow_length)

}


# script end;
