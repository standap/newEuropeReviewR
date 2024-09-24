## code to prepare `newEurope_articles`

library(tidyverse)

tne_articles <- read_csv("data-raw/newEurope_articles_singleGPE.csv") |> 
  arrange(doc_id)

usethis::use_data(tne_articles, overwrite = TRUE)


tne_entities <- read_csv("data-raw/cnlp_entities.csv") |> 
  arrange(doc_id)
usethis::use_data(tne_entities, overwrite = TRUE)

#tne_countries <- read_csv("data-raw/newEurope_quanteda_all_countries.csv") |> 
#  arrange(doc_id)

#usethis::use_data(tne_entities, overwrite = TRUE)

#read_csv("data-raw/top_15contributors_TNE.csv")
