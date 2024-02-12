# script: Star-pattern example
# date: 2024-02-12
# author: Serkan Korkmaz, serkor1@duck.com
# objective: A trivial Example
# script start;

# gc
rm(list = ls()); invisible(gc());

# 1) using the pattern function
head(
  candle_pattern(
    ohlc = MSFT,
    pattern = list(
      morning_star(),
      evening_star()
    )
  )
)

# 2) using the function
# itself for each pattern

# 2.1) morning start
head(
  morning_star(
    ohlc = MSFT
  )
)

# 2.2) evening star
head(
  evening_star(
    ohlc = MSFT
  )
)

# script end;
