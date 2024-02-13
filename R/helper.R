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
    ohlc,
    call = rlang::caller_env(n = 1)) {

  # 0) check if its a named list
  check_ohlc <- typeof(
    ohlc
  )

  if (!(check_ohlc %in% c('double', 'list'))) {
    cli::cli_abort(
      message = c(
        "x" = paste("Expected a", cli::code_highlight("typeof(ohlc)"), "{.cls list} or {.cls double}"),
        "i" = paste("Got a", cli::code_highlight("typeof(ohlc)"), "{.cls {typeof(ohlc)}}")
      ),
      call = call
    )
  }

  # 1) check if column names
  # exists

  # 1.1) list required
  # columns
  required_columns <- c(
    "Open",
    "High",
    "Low",
    "Close"
  )

  # 1.2) check if they exists
  # and pass warning if not
  check_column <- grep(
    pattern = paste(required_columns, collapse = "|"),
    x = colnames(ohlc),
    ignore.case = TRUE
  )

  if (length(check_column) != 4) {

    information_message <- ifelse(
      test = length(colnames(ohlc)[check_column]) == 0,
      yes  = "Found no suitable columns",
      no   = "Found {.val {paste(colnames(ohlc)[check_column])}}"
    )


    cli::cli_abort(
      message = c(
        "x" = "Expected to find {.val {paste({required_columns})}} columns.",
        "i" = information_message
      ),
      call = call
    )

  }

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
