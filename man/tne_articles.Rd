% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tne_articles.R
\docType{data}
\name{tne_articles}
\alias{tne_articles}
\title{A Text Corpus of Articles Published in The New Europe Foreign Policy Weekly}
\format{
A tibble with 2128 rows and 10 variables:
\describe{
\item{doc_id}{ID of the article published in \emph{The New Europe}}
\item{text}{dbl The full text of the article published in \emph{The New Europe}}
\item{title}{Title of the article}
\item{author}{Author of the article as it appeared on the page of \emph{The New Europe}}
\item{author_norm}{Normalized form of the name. When possible pseudonyms were resolved to real names.}
\item{date}{Publication date of the issue in which the article appeared}
\item{type}{Type of text in \emph{The New Europe} weekly, usually notes, articles, or reviews}
\item{volume}{Volume number of  \emph{The New Europe}}
\item{number}{Issue number of  \emph{The New Europe}}
}
}
\source{
The dataset \code{tne_articles} was created and edited by Stanislav Pejša.
}
\usage{
tne_articles
}
\description{
The \code{tne_articles} dataset contains a text corpus composed of full text
articles published in the foreign policy weekly \emph{The New Europe} between 1916
and 1920. The original OCR-ed text files were downloaded from the HathiTrust
Digital Library. The typos were corrected, various fragments introduced by
the OCR were removed. The individual individual texts of articles,
their authors, and titles were then extracted into a table. This corpus
provides a glimpse into thinking among the liberal European elites about
the rebuilding of the postwar world after the demise of the continental
empires in Europe.
}
\keyword{datasets}
