#' Count of References to Countries and Related Terms in the New Europe weekly
#'
#' This dataset was created with a dictionary running against a the
#' `NewEuropeWeekly` corpus using a `quanteda` package. Unlike regular frequency
#' count that simply counts how many times a token was found in the corpus,
#' This approach tallies multiple terms that are in associated with two-letter
#' country code in the dictionary file. 
#' The document identifier, two-letter  country code, number of times a term related to the identifier was mentioned , the date when the document was publish, extracted year of publication, and the type of text in the New Europe weekly. 
#'
#' @format A tibble with 16158 rows and 6 columns:
#' \describe{
#'   \item{doc_id}{Document identifier - id of the article published in the New Europe Review}
#'   \item{text}{dbl Month price was recorded. Ranges from 1-12 for January - December} 
#'   \item{code}{Two letter country code}
#'   \item{count}{Count of references associated with the country code in an article}
#'   \item{date}{Publication date of the issue in whihc the article appeared}
#'   \item{type}{Type of text in The New Europe weekly, usually notes, articles, or reviews}
#' }
#' @source Extracted, edited, and transformed into a dataset by Stanislav Pejša.
#'
#' @examples
#'   tne_countries
"tne_countries"

