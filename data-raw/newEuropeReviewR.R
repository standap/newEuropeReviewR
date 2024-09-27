## code to prepare `newEuropeReviewR`
library(tidyverse)

tne_articles <- read_csv("data-raw/newEurope_articles_singleGPE.csv") |> 
  select(doc_id, text, article, author:number) %>% 
  rename(title = article) %>% 
  arrange(doc_id)
usethis::use_data(tne_articles, overwrite = TRUE)

tne_countries <- read_csv("data-raw/newEurope_countries.csv") |> 
  arrange(doc_id) %>% 
  rename(code = countries) %>% 
  select(-year)
usethis::use_data(tne_countries, overwrite = TRUE)

