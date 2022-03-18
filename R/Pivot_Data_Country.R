#' Fruit Consumption by country (Pivot_Data_Country)
#'
#' This data set contains countries and their fruit consumptions
#'
#' @format A data frame with 50 rows and 5 variables:
#'   *{Country}{which country}
#'   *{Code}{Country code}
#'   *{FruitType}{Fruit Type}
#'   *{Consumption}{Fruit consumption}
#'   *{Fruit}{total fruit consumption by that country}
#' @examples
#' Bananasmax <- Pivot_Data_Country %>%  dplyr::filter(FruitType == "Bananas") %>% max(Consumption)
#' @source \url{https://ourworldindata.org/grapher/fruit-consumption-per-capita}
#' 
#' "Pivot_Data_Country"