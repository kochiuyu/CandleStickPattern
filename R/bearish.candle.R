#' Determine bearish candle using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if bullish candel detected
#'
#' @export
bearish_candle <- function(
    ohlc,
    colname = "bearish_candle") {
  rlang::expr(
    {

      # 0) extract parameters
      ohlc <- !!ohlc
      column_names <- colnames(ohlc)

      # 1) define Open and Close
      # prices
      OP <- as.numeric(
        do.call(
          `$`,
          args = list(
            ohlc,
            column_names[grepl(pattern = "open", ignore.case = TRUE, x = column_names)]
          )
        )
      )

      CL <- as.numeric(
        do.call(
          `$`,
          args = list(
            ohlc,
            column_names[grepl(pattern = "close", ignore.case = TRUE, x = column_names)]
          )
        )
      )

      # 2) Return values
      `$<-`(
        ohlc,
        !!colname,
        OP > CL
      )


    }
  )
}

#' Determine bullish candle using a OHLC price series
#'
#' @param x OHLC prices.
#' @return TRUE if bullish candle detected
#' @export
bullish_candle <- function(
    ohlc,
    colname = "bullish_candle") {
  rlang::expr(
    {

      # 0) extract parameters
      ohlc <- !!ohlc
      column_names <- colnames(ohlc)

      # 1) define Open and Close
      # prices
      OP <- as.numeric(
        do.call(
          `$`,
          args = list(
            ohlc,
            column_names[grepl(pattern = "open", ignore.case = TRUE, x = column_names)]
          )
        )
      )

      CL <- as.numeric(
        do.call(
          `$`,
          args = list(
            ohlc,
            column_names[grepl(pattern = "close", ignore.case = TRUE, x = column_names)]
          )
        )
      )

      # 2) Return values
      `$<-`(
        ohlc,
        !!colname,
        OP < CL
      )

    }
  )
}
