#' A Text Corpus of Articles Published in The New Europe Foreign Policy Weekly
#'
#' The `tne_articles` dataset contains a text corpus composed of articles 
#' published in the foreign policy weekly _The New Europe_ between 1916
#' and 1920. The original OCR-ed text files were downloaded from the HathiTrust
#' Digital Library. Typos were corrected and various fragments introduced by 
#' OCR were removed. The individual texts of articles, their authors and titles 
#' were extracted into a table. This corpus provides a glimpse into the visions
#' of the postwar world held by liberal European elites following the demise of 
#' the continental empires.   
#'
#' @format A tibble with 2128 rows and 9 variables:
#' \describe{
#'   \item{doc_id}{ID of the article published in _The New Europe_}
#'   \item{text}{The full text of the article published in _The New Europe_}
#'   \item{title}{Title of the article} 
#'   \item{author}{Author of the article as it appeared on the page of _The New Europe_}
#'   \item{author_norm}{Normalized form of the name. When possible, pseudonyms were resolved to real names.}
#'   \item{date}{Publication date of the issue in which the article appeared (YYYY-MM-DD)}
#'   \item{type}{Type of text in _The New Europe_ weekly, usually notes, articles, or reviews}
#'   \item{volume}{Volume number of _The New Europe_}
#'   \item{number}{Issue number of  _The New Europe_}
#' }
#' @source The dataset `tne_articles` was created and edited by Stanislav Pejša.
"tne_articles"