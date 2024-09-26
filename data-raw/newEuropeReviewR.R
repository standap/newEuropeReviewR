## code to prepare `newEuropeReviewR`
library(tidyverse)

tne_articles <- read_csv("data-raw/newEurope_articles_singleGPE.csv") |> 
  arrange(doc_id)
usethis::use_data(tne_articles, overwrite = TRUE)

tne_entities <- read_csv("data-raw/cnlp_entities.csv") |> 
  arrange(doc_id)
usethis::use_data(tne_entities, overwrite = TRUE)

tne_countries <- read_csv("data-raw/newEurope_countries.csv") |> 
  arrange(doc_id) %>% 
  rename(code = countries)
usethis::use_data(tne_countries, overwrite = TRUE)

#read_csv("data-raw/top_15contributors_TNE.csv")
