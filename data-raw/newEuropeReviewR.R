## code to prepare `newEuropeReviewR`

## Several dates of publication were incorrect due to OCR errors

# No. 60 of Volume V. was published on 6 December 1917
# not on 1917-12-05

# No. 144 of Volume XII was published on 17 July 1919
# not on 1919-07-15

# No. 153 of Volume XII was published on 18 September 1919
# not on 1919-09-19  

## WRONG DATES - OCR errors - Date check
tne_articles |> 
  mutate(day = wday(date, label = TRUE, abbr = FALSE)) |> 
  filter(day != "Thursday") |> 
#  filter(year(date)== 1919, month(date) %in% c(7,9)) |> 
  count(date, day)


library(tidyverse)

tne_articles <- read_csv("data-raw/newEurope_articles_singleGPE.csv") |> 
  select(doc_id, text, article, author:number) %>% 
  rename(title = article) %>% 
  mutate(date = case_when(date == "1917-12-05" ~ ymd("1917-12-06"),
                          date == "1919-07-15" ~ ymd("1919-07-17"),
                          date == "1919-09-19" ~ ymd("1919-09-18"),
                          .default = date)) |> 
  arrange(doc_id)

usethis::use_data(tne_articles, overwrite = TRUE)

usethis::use_r("tne_articles")

usethis::use_package_doc()

tne_countries <- read_csv("data-raw/newEurope_countries.csv") |> 
  arrange(doc_id) %>% 
  rename(code = countries) %>% 
  select(-year)
usethis::use_data(tne_countries, overwrite = TRUE)

