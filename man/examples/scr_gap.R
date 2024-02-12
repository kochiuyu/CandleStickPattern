# script: Gap-pattern example
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
      gap_up(),
      gap_down()
    )
  )
)

# 2) using the function
# itself for each pattern

# 2.1) gap down
head(
  gap_down(
    ohlc = MSFT
  )
)

# 2.2) gap up
head(
  gap_up(
    ohlc = MSFT
  )
)

# script end;
