#' Count of References to Countries and Related Terms in the New Europe weekly
#'
#' The `tne_countries` dataset was created with a dictionary running against the
#' `NewEuropeWeekly` corpus using a `quanteda` package. Unlike regular frequency
#' count that simply counts how many times a token was found in the corpus,
#' this approach tallies multiple terms that are associated with the two-letter
#' country code in the dictionary file. 
#'
#' @format A tibble with 16158 rows and 5 columns:
#' \describe{
#'   \item{doc_id}{Document identifier - id of the article published in the New Europe Review}
#'   \item{code}{Two letter country code}
#'   \item{count}{Count of references associated with the country code in an article}
#'   \item{date}{Publication date of the issue in which the article appeared}
#'   \item{type}{Type of text in _The New Europe_ weekly, usually notes, articles, or reviews}
#' }
#' @source The dataset `tne_countries` was created and edited by Stanislav Pejša.
"tne_countries"

