#' Netflix subscription fee in different countries
#'
#' A dataset containing the prices of Netflix subscription plans (basic, standard, premium) along with number of TV shows and movies.
#'
#' @format A data frame with 63 rows and 9 variables:
#'   * {Country}{Country name}
#'   *{Code}{Country code}
#'   *{Total.Library.Size}{Number of total TV shows and movies available for that country}
#'   *{No..of.TV.Shows}{Number of total TV show available for that country}
#'   *{No..of.Movies}{Number of total movies available for that country}
#'   *{Cost_basic}{Cost in USD, basic subscription plan}
#'   *{Cost_standard}{Cost in USD, standard subscription plan}
#'   *{Cost_premium}{Cost in USD, premium subscription plan}
#'   *{Cost_per_title_basic}{Cost in USD, # of titles / cost of basic subscription plan}
#'   ...
#'   
#' @examples mean_basic_plan <- mean(df3$Cost_basic)
#' 
#' @source \url{https://www.kaggle.com/prasertk/netflix-subscription-price-in-different-countries}

"df3"