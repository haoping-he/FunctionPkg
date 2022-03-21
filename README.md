
# DFapplyFunction Package

<!-- badges: start -->
<!-- badges: end -->

Create an R package with df_apply() function in it.

## Installation

Follow the blow instruction to install the Function_Pkg package:

``` r
devtools::install_github('haoping-he/Function_Pkg')
```

## Example

This is an example to show you how to apply the function df_apply() to
your desired dataframe in order to convert it into a different format.

``` r
library(FunctionPkg)
 n <- 5L
 TestData <- dplyr::tibble( 
                 double = c(5.002, 3.221, 4.008, 5.112, 4.779),
                 integer = c(0, 10, 20, 30, 40),
                cap = LETTERS[1L:n],
                 low = letters[1L:n])

TestData  
#> # A tibble: 5 × 4
#>   double integer cap   low  
#>    <dbl>   <dbl> <chr> <chr>
#> 1   5.00       0 A     a    
#> 2   3.22      10 B     b    
#> 3   4.01      20 C     c    
#> 4   5.11      30 D     d    
#> 5   4.78      40 E     e
 
df_apply(TestData, round, is.numeric, digits = 1)
#> # A tibble: 5 × 4
#>   double integer cap   low  
#>    <dbl>   <dbl> <chr> <chr>
#> 1    5         0 A     a    
#> 2    3.2      10 B     b    
#> 3    4        20 C     c    
#> 4    5.1      30 D     d    
#> 5    4.8      40 E     e


TestData |>  df_apply(toupper, is_character)
#> # A tibble: 5 × 4
#>   double integer cap   low  
#>    <dbl>   <dbl> <chr> <chr>
#> 1   5.00       0 A     A    
#> 2   3.22      10 B     B    
#> 3   4.01      20 C     C    
#> 4   5.11      30 D     D    
#> 5   4.78      40 E     E
TestData |> df_apply(round, is.numeric, toupper, digits = 2)
#> # A tibble: 5 × 4
#>   double integer cap   low  
#>    <dbl>   <dbl> <chr> <chr>
#> 1   5          0 A     A    
#> 2   3.22      10 B     B    
#> 3   4.01      20 C     C    
#> 4   5.11      30 D     D    
#> 5   4.78      40 E     E
TestData |> df_apply(round, is.numeric, as.factor, digits = -1)
#> # A tibble: 5 × 4
#>   double integer cap   low  
#>    <dbl>   <dbl> <fct> <fct>
#> 1     10       0 A     a    
#> 2      0      10 B     b    
#> 3      0      20 C     c    
#> 4     10      30 D     d    
#> 5      0      40 E     e
```
