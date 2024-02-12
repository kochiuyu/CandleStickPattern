# script: Utilities
# date: 2024-02-10
# author: Serkan Korkmaz, serkor1@duck.com
# objective: Create utility functions that
# are fixed but not exported
# script start;

body_feature <- function(
    ohlc,
    feature = "length"
){

  # 0) Set up local environment
  ohlc <- ohlc
  column_names <- colnames(ohlc)

  # 1) locate columns
  #
  # open and close
  open <- extract_column(
    ohlc = ohlc,
    pattern = "open",
    column_names = column_names
  )

  close <- extract_column(
    ohlc = ohlc,
    pattern = "close",
    column_names = column_names
  )


  # 0) determine candle
  # feature


  feature <- switch(EXPR = feature,
                    length = rlang::expr(
                      {

                        # 2) calculate body length
                        abs(
                          !!open - !!close
                        )


                      }
                    ),
                    top = rlang::expr(
                      {


                        pmax(!!open, !!close)
                      }
                    ),
                    bottom = rlang::expr(
                      {


                        pmin(!!open, !!close)
                      }
                    ),
                    center = rlang::expr(
                      {


                        (!!open + !!close)/2
                      }
                    )
  )

  # 1) evalaute
  # feature
  rlang::eval_bare(
    feature
  )

}


shadow_feature <- function(
    ohlc,
    feature) {


  # 0) Set up local environment
  ohlc <- ohlc
  column_names <- colnames(ohlc)

  feature <- switch (feature,
                     lower_length = rlang::expr(
                       {
                         body_feature(!!ohlc, "bottom") - extract_column(
                           ohlc = ohlc,
                           pattern = "low",
                           column_names = column_names
                         )
                       }
                     ),
                     upper_length = rlang::expr(
                       {
                         extract_column(
                           ohlc = ohlc,
                           pattern = "high",
                           column_names = column_names
                         ) -  body_feature(!!ohlc, "top")
                       }
                     )
  )

  rlang::eval_bare(
    feature
  )


}


candle_feature <- function(
    ohlc,
    feature,
    n = 20,
    delta = 1) {

  # 0) Set up local environment
  ohlc <- ohlc
  column_names <- colnames(ohlc)

  feature <- switch(
    feature,
    length = rlang::expr(
      {
        extract_column(
          ohlc = !!ohlc,
          pattern = "high",
          column_names = !!column_names
        ) - extract_column(
          ohlc = !!ohlc,
          pattern = "low",
          column_names = !!column_names
        )
      }
    ),
    is_long = rlang::expr(
      {
        # 1) calculate candle
        # body length
        body_length <- body_feature(
          ohlc = !!ohlc,
          feature = 'length'
        )

        # 2) calculate rolling
        # median
        body_length_median <- TTR::runMedian(
          x = body_length,
          n = !!n
        )

        body_length >= body_length_median * delta

      }

    ),
    is_short = rlang::expr(
      {

        # 1) calculate candle
        # body length
        body_length <- body_feature(
          ohlc = !!ohlc,
          feature = 'length'
        )

        # 2) calculate rolling
        # median
        body_length_median <- TTR::runMedian(
          x = body_length,
          n = !!n
        )

        body_length <= body_length_median * delta

      }
    )
  )


  rlang::eval_bare(
    feature
  )

}

# script end;
