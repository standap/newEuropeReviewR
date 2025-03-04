# newEuropeReviewR
This R data package contains an R data package that consists of text corpus of articles from the complete run of the foreign policy weekly _The New Europe_ that were published between 1916 and 1921. It also contains an additional file with frequencies of terms that are associated with a great number of countries mentioned on the pages of _The New Europe_ weekly. The texts deal mainly with analysis of the war developments. Many of the authors envisioned changes of political borders in Europe that would be more closely aligned along the ethnic lines. The weekly offered a relatively radical and unconventional view of the postwar Europe. The corpus reveals how was this opinion anchored in the prewar political theory and how this thinking evolved during the First World War, and impacted shaping of the new postwar world order at the Paris Peace Conference in 1919.

_The New Europe_ corpus contains 2118 texts. 1442 articles, 411 notes typically unsigned and contributed by the editors, 266 reviews, and 9 letters to editors. 210 numbered issues were bound in seventeen volumes. In average, there was ten texts in each issue. In the dataset, each text identified by the sequential identifier, but the bibliographic metadata for each text are also part of the dataset.

The `newEuropeReviewR` data package contains two datasets `tne_articles` and `tne_countries`. 

## Data
The `tne_articles` dataset contains dataframe with text of an article together with its metadata (author, the normalised name of the author, ttitle, date of publication, type of text, and volume and issue numbers) per line.

The `tne_countries` dataset contains five columns: the document identifier, two-letter  country code, number of times a term related to the identifier was mentioned, the date when the article was published, and the type of text in _The New Europe_ weekly. The `tne_countries` dataset was created with a dictionary running against a the whole _The New Europe_  corpus using a `quanteda` package. The dictionary is uploaded to this repository. 

**Example of the used dictionary:**   
EUROPE:
  EAST:
     AH': [Austria-Hungar*, Austro-Hungar*, Ballhausplatz, Habsburg]  
    'BG': [Bulgaria*, Bulgarian*, Bulgars, Sofia]  
    'CS': [Czechoslovak*, Czecho-Slovakia, Czech*, Slovak*, Slovakia, Prague, Bratislava, Ruthenian*, Pressburg, Bohemia, Moravia]  
\#  'CZ': [Czech Republic, Czech*, Prague]  
    'HU': [Hungary, Hungarian*, Budapest, Magyar*]  
    'PL': [Poland, Polish, Pole*, Warsaw, Cracow, Danzig]  
    'RO': [Ro*mania, Ro*manian*, Bucharest, Transylvania*, Bessarabia*, Bukovina, Wallachia*, Dobrudja]  
    'JW': [Jews, Jewish, Hebrew, Zionis*, Jerusalem]  
   contains a code 


## Installation

```
remotes::install_github("standap/newEuropeReviewR")
```

## Run the data

After installing `newEuropeReviewR`, simply write the name of the dataset. The data frame is ready to be used as is. The data are already in the tidy format.

```
# Five top authors of the authors. Most contributions are not signed, often written by Seton_Watson.
tne_articles |> 
  count(author_norm, sort = TRUE) |> 
  head(5)
```

```
# Most frequently mentined countries and the related terms
tne_countries |> 
  count(code, wt = count, sort = TRUE) |> 
  head(5)
```

```
# how was the dictionary run
library(quanteda)
articles_corp <- corpus(tne_articles)
articles_tokens <- tokens(articles_corp, 
                        remove_punct = TRUE, 
                        remove_numbers = TRUE)
articles_cln <- tokens_remove(articles_tokens, pattern = stopwords("en"))

dict_newsmap <- dictionary(file = "dictionary/newEurope1918-1920.yml")

countries <- tokens_lookup(articles_cln, dictionary = dict_newsmap, levels = 3)
regions_dfm <- dfm(countries)
```
## Preparing the corpus
The introductory sections in each volume were removed from the raw downloaded text files. Afterwards, the peritext sections were annotated, first with a script, and then manually. Then the identified peritext segments such as covers, table of contents, running titles, advertisements indices, colophon, printer statement, page numbers etc. were removed. Besides para text, important metadata, such as titles of the articles, names of authors, footnotes were  also annotated and the individual texts were classified into fairly broad categories, e.g., articles, letter to the editor, notes and reviews. Introductory paragraphs by the editors for several articles or letters to the editor were removed from the corpus, as well as content of the literary and art section that was introduced to the end of the review's existence. All text were manually inspected and all typos and OCR fragments were removed

## Provenance

The corpus was created from seventeen bound volumes in the [Hathi Trust Digital Library](https://www.hathitrust.org/). 

Table: List of bound volumes with number of issues that make up the `newEuropeReview` corpus.
   
|htid               |volume | issues|
|:------------------|:------|------:|
|njp.32101059985000 |I      |     13|
|umn.31951000751810 |II     |     13|
|njp.32101059985026 |III    |     13|
|njp.32101059985034 |IV     |     13|
|njp.32101059985042 |V      |     13|
|njp.32101059985059 |VI     |     12|
|njp.32101059985067 |VII    |     13|
|njp.32101059985075 |VIII   |     13|
|njp.32101059985083 |IX     |     13|
|njp.32101059985091 |X      |     13|
|njp.32101059985109 |XI     |     13|
|njp.32101059985117 |XII    |     13|
|njp.32101059985125 |XIII   |     13|
|njp.32101059985133 |XIV    |     13|
|njp.32101059985141 |XV     |     13|
|njp.32101059985158 |XVI    |     13|
|njp.32101059985166 |XVII   |      3|


