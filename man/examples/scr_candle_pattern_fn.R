# script: Candlestick Patters
# date: 2024-02-09
# author: Serkan Korkmaz, serkor1@duck.com
# objective: Create an example of the
# usage of the function candle_pattern
# script start;

# garbage collection
rm(list = ls()); invisible(gc());

# library
library(candlestickpatterns)

# 1) add pattern indicators
# to MSFT
MSFT <- candle_pattern(
  ohlc    = MSFT,
  pattern = list(
    # 1) Bullish patterns
    bullish_engulfing(),
    bullish_harami(),

    # 2) Bearish patterns
    bearish_engulfing(),
    bearish_harami()

  )
)

# 2) head data
head(
  MSFT
)

# script end;
