# speedtest-r
I wrote this wrapper because I wanted to log available bandwidth as my internet provider does not provide the whole bandwidth they promise (in fact they limit downloads to 1/20 of available download speeds, but that's another story).

speedtest.sh: wrapper for speedtest-cli (https://github.com/sivel/speedtest-cli) that generates statistics of your internet connection every hour.

speedtest_r.sh: calls an R script and generates a diagram as pdf that shows the total bandwidth used from the speedtests.

Run the scripts more than twice to produce meaningful results.
