#' "Transform" a data frame
#' @param .data – a data frame
#' @param .f – a function
#' @param .condition – a function – the default should TRUE for numeric columns and false for other columns
#' @param .else – a function to apply when .condition() evaluates to FALSE
#' @param ... – additional arguments that will be passed to .f()
#'
#' @return a data frame with specific change made to it.
#' @examples
#' @export 
#' n <- 5L
#' TestData <- dplyr::tibble( double = c(5.002, 3.221, 4.008, 5.112, 4.779),
#'                 integer   = c(0, 10, 20, 30, 40),
#'                 cap = LETTERS[1L:n],
#'                 low = letters[1L:n])
#' df_apply(test_data, round, toupper, digits = 1)
#' TestData |>  df_apply(toupper, purrr::is_character)
#' TestData |> df_apply(round, is.numeric, toupper, digits = 2),


df_apply <- function(.data, .f, .condition = is.numeric, .else = identity, ...){
  .data |>
    lapply( function(.x) if(.condition(.x)) .f(.x, ...) else .else(.x)) %>%
    as_tibble()
}


