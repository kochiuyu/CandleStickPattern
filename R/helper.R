# script: Helper functions
# date: 2024-02-10
# author: Serkan Korkmaz, serkor1@duck.com
# objective: These helper functions reduces
# the amount of coding needed
# script start;

# extract column;
#
# This function extracts
# the relevant column
# as numeric vector
extract_column <- function(
    ohlc,
    pattern,
    column_names) {

  # 1) locate column
  # and extract
  column <- column_names[
    grep(
      pattern = pattern,
      ignore.case = TRUE,
      x = column_names
    )
  ]

  # 2) return
  # columns as numeric
  as.numeric(
    do.call(
      what = `$`,
      args = list(
        ohlc,
        column
      )
    )
  )

}

# script end;
