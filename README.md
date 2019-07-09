rjmb: Readme and Manual
================

  - [Installation](#installation)
  - [Usage](#usage)
      - [Big Changes](#big-changes)
          - [String Addition](#string-addition)
      - [Helper Functions](#helper-functions)
          - [str\_to\_math()](#str_to_math)

<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

<!-- badges: end -->

The goal of rjmb is to provide some helper functions for data analysis
and visualization in R.

All the little things I run into end up
here.

# Installation

<!-- You can install the released version of rjmb from [CRAN](https://CRAN.R-project.org) with: -->

<!-- ``` r -->

<!-- install.packages("rjmb") -->

<!-- ``` -->

Install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jannikbuhr/rjmb")
```

# Usage

``` r
library(rjmb)
#> 
#> Attaching package: 'rjmb'
#> The following object is masked from 'package:base':
#> 
#>     +
library(tidyverse)
```

## Big Changes

### String Addition

Note, that loading this package overrides to `+`-operator to work with
strings (i.e. character vectors) as well\[1\]. For non-strings, the
default primitive `+` is still used so this should not break any
existing code unless it relies on addition of strings failing.
Internally, it uses `paste`, thus numbers are silently converted to
strings when added to strings. As the first type (LHS of `+`) determines
method dispatch, when adding strings and numbers, the first argument
needs to be a string (can be an empty string `""`).

``` r
"Hello " + "World"
#> [1] "Hello World"
"" + 1 + " duck."
#> [1] "1 duck."
x = 2
"" + x + " ducks."
#> [1] "2 ducks."
```

## Helper Functions

### str\_to\_math()

Adding expressions from strings containing whitespace to a plot.

``` r
df <- tibble(
  x = c("delta+1", "Delta AB", "alpha"),
  y = rep(1, length(x))
)

df %>%
  ggplot(aes(x, y)) +
  geom_point() +
  scale_x_discrete(labels = str_to_math()) +
  theme(axis.text.x = element_text(size = 12))
```

<img src="man/figures/README-example-1.png" width="100%" />

1.  this is similar to python
