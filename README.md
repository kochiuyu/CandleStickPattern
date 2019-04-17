
CandleStickPattern
==================

This is package for candle stick pattern based on simple calculation.

Overview
--------

Currently, it covers the following patterns:

-   Doji family
    -   Doji
    -   Dragonfly Doji
    -   Gravestone Doji
-   Harmer family
    -   Harmer
    -   Hangman
    -   Inverted Harmer
    -   Shooting Star
-   Engulfing family
    -   Bullish Engulfing
    -   Bearish Engulfing
-   Harami family
    -   Bullish Harami
    -   Bearish Harami
-   Reversal family
    -   Pierceing line
    -   Dark cloud Cover
-   Kicking family
    -   Kicking up
    -   Kicking down

Installation
------------

To install this package, it is the easist to use devtools:

``` r
#install.packages("devtools")
library(devtools)
```

Then we can use the `install_github` to get the package directly:

``` r
#install_github("kochiuyu/CandleStickPattern")
library(CandleStickPattern)
```

Usage
-----

The following demonstrates the usage of the pacakge using Microsoft (ticker: MSFT). We use **quantmod** package to download data:

``` r
library(quantmod)
getSymbols("MSFT", from = "2011-07-08" , to = "2011-07-19")
```

We first plot the candle chart first:

``` r
candleChart(MSFT,theme='white')
```

![](README_files/figure-markdown_github/unnamed-chunk-4-1.png)

We can see that July 11, 12 and 13 are likely to have a doji. Let us see this using the function `doji`:

``` r
library(CandleStickPattern)
doji(MSFT)
```

    ##             doji
    ## 2011-07-11  TRUE
    ## 2011-07-12  TRUE
    ## 2011-07-13  TRUE
    ## 2011-07-14 FALSE
    ## 2011-07-15 FALSE
    ## 2011-07-18  TRUE
