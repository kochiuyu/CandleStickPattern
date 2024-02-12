#' Find Candlestick Patterns
#'
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' The [candle_pattern()]-function returns
#'
#'
#' @param ohlc A two-dimensional tabular data.frame with Open, High, Low and Close prices.
#' @param pattern A [list] of candlestick patterns
#'
#'
#' @returns An object of same [class], with candlestick pattern indicators
#'
#' @example man/examples/scr_candle_pattern_fn.R
#'
#' @export
#' @author Serkan Korkmaz
candle_pattern <- function(
    pattern,
    ohlc) {

  # 0) extract list of calls
  pattern_calls <- rlang::enexpr(pattern)[-1]
  pattern_names <- vapply(
    X = pattern_calls,
    FUN = rlang::call_name,
    FUN.VALUE = character(1)
  )

  fn_call <- lapply(
    pattern_calls,
    rlang::call_modify,
    ohlc = ohlc
    )

  evaluated_calls <- vapply(
    fn_call,
    function(call){

      rlang::eval_bare(
        rlang::eval_bare(
          call
        )
      )

    },
    FUN.VALUE = numeric(
      nrow(ohlc)
    )
  )

  colnames(evaluated_calls) <- pattern_names

  cbind(
    ohlc,
    evaluated_calls
  )


}





