#' Fruit Consumption by country (Pivot_Data_Country)
#'
#' This data set contains countries and their fruit consumptions
#'
#' @format A data frame with 50 rows and 5 variables:
#' \describe{
#'   \item{Country}{which country}
#'   \item{Code}{Country code}
#'   \item{FruitType}{Fruit Type}
#'   \item{Consumption}{Fruit consumption}
#'   \item{Fruit}{total fruit consumption by that country}

#'   }
#' @examples
#' Bananasmax <- Pivot_Data_Country %>%  dplyr::filter(FruitType == "Bananas") %>% max(Consumption)
#' @source \url{https://ourworldindata.org/grapher/fruit-consumption-per-capita}