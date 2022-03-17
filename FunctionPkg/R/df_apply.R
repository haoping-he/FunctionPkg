#' "Transform" a data frame
#' @.data – a data frame
#' @.f – a function
#' @.condition – a function – the default should TRUE for numeric columns and false for other columns
#' @.else – a function to apply when .condition() evaluates to FALSE
#' @... – additional arguments that will be passed to .f()



df_apply <- function(.data, .f, .condition, .else, ...){
  .data |>
    lapply( function(.x) if(.condition(.x)) .f(.x, ...) else .else(.x)) %>%
    as.data.frame()
}


