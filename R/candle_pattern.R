#' Find Candlestick Patterns
#'
#'
#' @param ohlc A xts object with Open, High, Low, Close and Volume columns
#' @param pattern A candlestick pattern function
#' @param ... Additional parameters passed to each pattern function
#'
#'
#' @returns An xts-object with OHLC-V and the pattern indicator
candle_pattern <- function(
    pattern,
    ohlc,
    ...) {

  # 1) extract pattern as function call
  # fn_call <- rlang::enexpr(
  #   pattern
  # )

  # # 1) extract all arguments
  # # passed into dots
  # dots <- rlang::enquos(...)
  #
  # # 2) evaluate
  # # all values
  # dots <- lapply(
  #   X   = dots,
  #   FUN = rlang::eval_tidy
  #   )
  #
  # # 2.1) identify the
  # # data.frame
  # idx <- vapply(
  #   dots,
  #   rlang::inherits_any,
  #   FUN.VALUE = logical(1),
  #   c("data.frame", "xts", "zoo")
  #   )

  # 2) modify calls
  fn_call <- rlang::call_modify(
    .call = rlang::enexpr(pattern),
    ohlc   = ohlc,
    ...
  )

  rlang::eval_bare(
    rlang::eval_bare(fn_call)
  )

}
