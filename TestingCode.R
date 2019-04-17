# install package

library(devtools)
install_github("kochiuyu/CandleStickPattern")
library(CandleStickPattern)
library(quantmod)
# Testing

getSymbols("MSFT")
MSFT['2011-07-11/2011-07-19']
x <- doji(MSFT)
x['2011-07-11/2011-07-19']
# doji
# 2011-07-11  TRUE
# 2011-07-12  TRUE
# 2011-07-13  TRUE
# 2011-07-14 FALSE
# 2011-07-15 FALSE
# 2011-07-18  TRUE
# 2011-07-19 FALSE

x <- dragonfly.doji(MSFT)
x['2014-10-28/2014-11-03']

# dragon.doji
# 2014-10-28       FALSE
# 2014-10-29       FALSE
# 2014-10-30       FALSE
# 2014-10-31        TRUE
# 2014-11-03       FALSE


x <- gravestone.doji(MSFT)
x['2015-04-28/2015-05-01']

# gravestone.doji
# 2015-04-28           FALSE
# 2015-04-29           FALSE
# 2015-04-30            TRUE
# 2015-05-01           FALSE

x <- hammer(MSFT)
x['2011-10-18/2011-10-25']

# hammer
# 2011-10-18  FALSE
# 2011-10-19  FALSE
# 2011-10-20  FALSE
# 2011-10-21   TRUE
# 2011-10-24  FALSE
# 2011-10-25  FALSE

x <- inverted.hammer(MSFT)
x['2011-11-20/2011-11-30']

# inverted hammer
# 2011-11-21           FALSE
# 2011-11-22           FALSE
# 2011-11-23           FALSE
# 2011-11-25            TRUE
# 2011-11-28           FALSE
# 2011-11-29           FALSE
# 2011-11-30           FALSE

x <- bullish.engulf(MSFT)
x['2011-11-02/2011-11-08']

# bullish engulfing
# 2011-11-02          FALSE
# 2011-11-03          FALSE
# 2011-11-04          FALSE
# 2011-11-07           TRUE
# 2011-11-08          FALSE

x <- bearish.engulf(MSFT)
x['2011-12-15/2011-12-20']
# bearish engulfing
# 2011-12-15             FALSE
# 2011-12-16             FALSE
# 2011-12-19              TRUE
# 2011-12-20             FALSE

x <- bullish.harami(MSFT)
x['2011-12-27/2011-12-30']
# bearish engulfing
# 2011-12-15             FALSE
# 2011-12-16             FALSE
# 2011-12-19              TRUE
# 2011-12-20             FALSE

x <- bearish.harami(MSFT)
x['2011-11-02/2011-11-07']
#            bearish haraming
# 2011-11-02            FALSE
# 2011-11-03            FALSE
# 2011-11-04             TRUE
# 2011-11-07            FALSE

x <- piercing.line(MSFT)
x['2011-07-26/2011-07-30']
#           piercing line
# 2011-07-26         FALSE
# 2011-07-27         FALSE
# 2011-07-28          TRUE
# 2011-07-29         FALSE

x <- dark.cloud.cover(MSFT)
x['2011-09-16/2011-09-21']
#            dark cloud cover
# 2011-09-16            FALSE
# 2011-09-19            FALSE
# 2011-09-20             TRUE
# 2011-09-21            FALSE

x <- kick.up(MSFT)
x['2011-11-08/2011-11-14']
#           kick up
# 2011-11-08   FALSE
# 2011-11-09   FALSE
# 2011-11-10   FALSE
# 2011-11-11    TRUE
# 2011-11-14   FALSE

x <- kick.down(MSFT)
x['2010-08-16/2010-08-19']
#           kick up
# 2011-11-08   FALSE
# 2011-11-09   FALSE
# 2011-11-10   FALSE
# 2011-11-11    TRUE
# 2011-11-14   FALSE


candleChart(MSFT, theme='white')
addTA(up.trend(MSFT), on=1,col='green')
addTA(down.trend(MSFT), on=1,col='red')

x <- three.white.soldiers(MSFT, n=10)
x['2007-05-30/2007-06-11']
candleChart(MSFT['2007-05-20/2007-06-01'], theme='white')

x <- three.black.crows(MSFT, n=10)
x['2010-01-15/2010-01-25']
candleChart(MSFT['2010-01-15/2010-02-09'], theme='white')

x <- rising.three(MSFT, n=10)
x['2012-01-10/2012-01-22']
candleChart(MSFT['2012-01-10/2012-01-22'], theme='white')


x <- morning.star(MSFT)
candleChart(MSFT['2013-06-10/2013-06-18'], theme='white')
x['2013-06-10/2013-06-18']
# morning star
# 2013-06-10        FALSE
# 2013-06-11        FALSE
# 2013-06-12        FALSE
# 2013-06-13        FALSE
# 2013-06-14        FALSE
# 2013-06-17         TRUE
# 2013-06-18        FALSE

x <- evening.star(MSFT)
candleChart(MSFT['2011-11-01/2011-11-11'], theme='white')
x['2011-11-01/2011-11-11']
