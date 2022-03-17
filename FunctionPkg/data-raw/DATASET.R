# Prep dataset
df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv')
colnames(df) <- c('Country')
df2 <- read.csv("data-raw/netflix_price.csv")

df3 <- merge(df, df2)

# Rename columns
names(df3)[3] <- 'Code'
names(df3)[7] <- 'Cost_basic'
names(df3)[8] <- 'Cost_standard'
names(df3)[9] <- 'Cost_premium'

df3 <- df3[ -c(2) ]

# Add column cost per title (Basic plan)
df3 <- df3 %>%
  select(Country,Code,Total.Library.Size,No..of.TV.Shows,No..of.Movies,Cost_basic,Cost_standard,Cost_premium) %>%
  mutate(Cost_per_title_basic = Cost_basic / Total.Library.Size)

usethis::use_data(df3)
