# script: Add pkg startup message
# date: 2024-02-12
# author: Serkan Korkmaz, serkor1@duck.com
# objective: Using rlang and cli we are constructing
# a package startup message
# script start;

.onAttach <- function(libname, pkgname,...) {

  # 1) startup message with
  # using cli::rule
  msg <- startup_message(
    pkgname = pkgname,
    pkgversion = utils::packageVersion(
      pkgname
    )
  )

  rlang::inform(
    msg
    ,
    ...,
    class = "packageStartupMessage"
  )

}

# script end;
