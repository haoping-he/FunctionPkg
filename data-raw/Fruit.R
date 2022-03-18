#' @importFrom usethis use_data
#' @importFrom readr read_csv write_csv
#' @importFrom tidytuesdayR tt_load
#' @importFrom dplyr group_by summarize mutate case_when arrange

library(tidyverse)
library(mosaic)
library(purrr)
library(lubridate)


  #Average fruit consumption per person, measured in kilograms per year.
fruit <- read.csv("/home/yh38/DATA303/Data303-Project/303Visualization/docs/plotly-projects/Haoping-He/fruit-consumption-per-capita.csv")
  #Average fruit consumption per person, differentiated by fruit types, measured in kilograms per year.
fruittype <-  read.csv("/home/yh38/DATA303/Data303-Project/303Visualization/docs/plotly-projects/Haoping-He/fruit-consumption-by-fruit-type.csv")

Fruit<- fruit%>%filter(Year == 2013) %>% select(-Year)

Fruit_Type<- fruittype%>%filter(Year == 2013) %>% select(-Year, -Code) %>%
    rename(Bananas = Food.Supply...Crops.Primary.Equivalent...Bananas...2615...Food.supply.quantity..kg.capita.yr....645...kg,
           Dates = Food.Supply...Crops.Primary.Equivalent...Dates...2619...Food.supply.quantity..kg.capita.yr....645...kg,
           Citrus = Food.Supply...Crops.Primary.Equivalent...Citrus..Other...2614...Food.supply.quantity..kg.capita.yr....645...kg,
           Oranges = Food.Supply...Crops.Primary.Equivalent...Oranges..Mandarines...2611...Food.supply.quantity..kg.capita.yr....645...kg,
           Apples = Food.Supply...Crops.Primary.Equivalent...Apples.and.products...2617...Food.supply.quantity..kg.capita.yr....645...kg,
           Lemons = Food.Supply...Crops.Primary.Equivalent...Lemons..Limes.and.products...2612...Food.supply.quantity..kg.capita.yr....645...kg,
           Grapes = Food.Supply...Crops.Primary.Equivalent...Grapes.and.products..excl.wine....2620...Food.supply.quantity..kg.capita.yr....645...kg,
           Grapefruit = Food.Supply...Crops.Primary.Equivalent...Grapefruit.and.products...2613...Food.supply.quantity..kg.capita.yr....645...kg,
           Pineapples = Food.Supply...Crops.Primary.Equivalent...Pineapples.and.products...2618...Food.supply.quantity..kg.capita.yr....645...kg,
           Plantains = Food.Supply...Crops.Primary.Equivalent...Plantains...2616...Food.supply.quantity..kg.capita.yr....645...kg,
           Other = Food.Supply...Crops.Primary.Equivalent...Fruits..Other...2625...Food.supply.quantity..kg.capita.yr....645...kg)

FruitData <- Fruit %>% left_join(Fruit_Type, by = 'Entity') %>%
    rename(Country = Entity,
           Fruit = Fruits...Excluding.Wine...Food.supply.quantity..kg.capita.yr...FAO..2020.)

Pivot_Data <- FruitData%>%
    select("Country", 'Code', "Bananas" , "Oranges", "Apples" , "Grapes", "Plantains")%>%
    pivot_longer(
      cols = c("Bananas" , "Oranges", "Apples" , "Grapes", "Plantains"),
      names_to = 'FruitType',
      values_to = 'Consumption'
    )

Countries <- FruitData %>% arrange(desc(Fruit)) %>% head(10)%>% select(Country)


Pivot_Data_Country <- Pivot_Data %>%
    left_join(FruitData %>% select(Country, Fruit), on = Country) %>%
    filter(Country %in% Countries$Country)%>% arrange(desc(Fruit))



usethis::use_data(FruitData)
usethis::use_data(Pivot_Data_Country)

usethis::use_data(FruitData, FruitData, overwrite = TRUE)
usethis::use_data(Pivot_Data_Country, Pivot_Data_Country, overwrite = TRUE)

  
