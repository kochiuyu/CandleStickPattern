## code to prepare `MSFT` dataset goes here

# 1) get Symbol
MSFT <- quantmod::getSymbols(
  Symbols = "MSFT",
  env = FALSE,
  auto.assign = FALSE
)

# 2) convert
# to data.frame
MSFT <- as.data.frame(
  MSFT
)


# 3) write to
# library
usethis::use_data(MSFT, overwrite = TRUE)
