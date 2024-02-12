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


# check if column names
# exists and are numeric
is_ohlc <- function(
    ohlc) {

  # 1) check if column names
  # exists

  # 1.1) list required
  # columns
  required_columns <- c(
    "open",
    "high",
    "low",
    "close"
  )

  # 1.2) check if they exists
  # and pass warning if not
  check_column <- vapply(
    X = required_columns,
    FUN.VALUE = logical(1),
    FUN = function(required_column){

      any(
        grepl(
          pattern = required_column,
          x = colnames(ohlc),
          ignore.case = TRUE
        )
      )

    }
  )

  if (!all(check_column)) {

    cli::cli_abort(
      message = c(
        "x" = "Expected some form of {paste({required_columns})}",
        "i" = "Only found some form of {paste(required_columns[check_column])}"
      )
    )

  }

  # 2) check if they are all numeric or double
  vapply(
    ohlc,
    FUN.VALUE = logical(1),
    FUN = rlang::inherits_any,
    class = c(
      "integer",
      "double",
      "numeric"
    )
  )



}



# startup message
startup_message <- function(
    pkgname,
    pkgversion) {

  cli::rule(
    left = cli::style_bold(pkgname),
    right = cli::style_bold(pkgversion),
    line = 1,
    line_col = cli::make_ansi_style(
      "cyan"
    )
  )

}
# script end;
