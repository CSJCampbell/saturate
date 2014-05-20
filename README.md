saturate
========

An [R package](http://www.r-project.org/) to adjust the saturation of a colour.

how to use this code
--------

To install this package you will need:
* R
* Rtools

Note that you must manually update your environmental variable PATH to include these utilities.

This package includes comments in **roxygen2** format. 
From R (and when located one level above folder saturate) run the command 
`roxygenise("saturate")` to build the help files. 
To build the package on Windows use the command `R CMD INSTALL --build saturate` from the command window.
This package also includes tests in **testthat** format. From R run the call `test_package("saturate")`.

what is this code for?
--------

This R package contains one top level function that adjusts the saturation of a colour.

```R
eg <- c("hotpink", "cornflowerblue", "#1100EE")
saturate(eg, sat = 20)
# [1] "#FF0984" "#085AED" "#1100EE"
saturate(eg, sat = 0.2)
# [1] "#FFC6E3" "#BACCED" "#1201EE"
set.seed(68331)
hist(rnorm(100), col = saturate(col = "red", sat = 4^(-10:1)))
```
![histogram with saturation updated](https://raw.githubusercontent.com/CSJCampbell/saturate/master/hist_rnorm_100.png "hist(rnorm(100), col = saturate(col = 'red', sat = 4^(-10:1)))")
