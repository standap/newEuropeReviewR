# newEuropeReviewR

<!-- [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) -->
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html)
<!-- [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.XXXXXXX.svg)](https://doi.org/10.5281/zenodo.XXXXXXX) -->
[![ORCID](https://img.shields.io/badge/ORCID-0000--0001--5057--262X-green.svg)](https://orcid.org/0000-0001-5057-262X)

This R data package contains a text corpus of articles from the complete run of the foreign policy weekly _The New Europe_ that were published between 1916 and 1920. It also contains an additional file with frequencies of terms that are associated with countries mentioned in the pages of _The New Europe_ weekly. Although the texts deal mainly with analysis of the wartime developments, many contributions contain early concepts of political changes in Europe that envisioned political borders more closely aligned along the ethnic and linguistic lines. The weekly offered a radical and unconventional view of the postwar Europe. The corpus reveals how the views of _The New Europe_'s authors were anchored in the prewar political theory and how this thinking evolved during the First World War. Crucially, the texts reveal how this thinking impacted the shaping of the new postwar world order at the Paris Peace Conference in 1919.

_The New Europe_ corpus contains 2128 texts: 1442 articles, 411 notes typically unsigned and contributed by the editors, 266 reviews, and 9 letters to the editors. 210 numbered issues were bound in seventeen volumes. On average, there were ten texts in each issue. In the dataset, each text is identified by a sequential identifier, but the bibliographic metadata for each text are also part of the dataset.

The `newEuropeReviewR` data package contains two datasets, `tne_articles` and `tne_countries`. 

## Data
The `tne_articles` dataset contains the full-text of published articles together with their metadata (author, the normalised name of the author, title, date of publication, type of text, and volume and issue numbers) per line.

In order to track the geographic distribution of coverage of _The New Europe_, the `tne_countries` dataset was created. This dataset contains five columns: the document identifier (which links the two datasets), a two-letter country code, the number of times a term related to the identifier was mentioned, the date when the article was published, and the type of text in _The New Europe_ weekly. The `tne_countries` dataset was created with a yaml dictionary run against the whole _The New Europe_  corpus using the `quanteda` package. The dictionary is uploaded to this repository in the directory `dictionary`. 

## Installation

```
remotes::install_github("standap/newEuropeReviewR")
```

## Run the data

After installing `newEuropeReviewR`, simply write the name of the dataset. The data frame is ready to be used as is. The data are already in the tidy format. 

No additional packages are required to use this data package. The `quanteda` code below is provided for documentation and transparency, showing how the tne_countries dataset was created.

```
tne_articles
```

### Usage examples
```
# Five top authors. Most contributions are not signed, often written by Seton-Watson.

tne_articles |> 
  count(author_norm, sort = TRUE) |> 
  head(5)
```

```
# Most frequently mentioned countries and the related terms

tne_countries |> 
  count(code, wt = count, sort = TRUE) |> 
  head(5)
```

### Dictionary processing

**Example of the hierarchical structure of the yaml dictionary:**   
```
EUROPE:
  EAST:
     AH': [Austria-Hungar*, Austro-Hungar*, Ballhausplatz, Habsburg]  
    'BG': [Bulgaria*, Bulgarian*, Bulgars, Sofia] 
    # A historically more relevent entry for Czechoslovakia
    'CS': [Czechoslovak*, Czecho-Slovakia, Czech*, Slovak*, Slovakia, Prague, Bratislava, Ruthenian*, Pressburg, Bohemia, Moravia]  
    #'CZ': [Czech Republic, Czech*, Prague]  
    'HU': [Hungary, Hungarian*, Budapest, Magyar*]  
    'PL': [Poland, Polish, Pole*, Warsaw, Cracow, Danzig]  
    'RO': [Ro*mania, Ro*manian*, Bucharest, Transylvania*, Bessarabia*, Bukovina, Wallachia*, Dobrudja]  
    'JW': [Jews, Jewish, Hebrew, Zionis*, Jerusalem]  
    
```

```
# How was the dictionary run
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
## Processing of the corpus
The texts downloaded from the HathiTrust Digital Library were unstructured and full of OCR errors. The raw text files, therefore, underwent several processing steps to produce a clean corpus ready for analysis.

- The HATHI/Google introductory sections in each volume were removed from the raw downloaded text files.  
- Peritext sections were annotated, first with a script, and then manually.  
- The identified peritext segments such as covers, table of contents, running titles, advertisements, indices, colophon, printer statements, and page numbers were removed.  
- Important metadata, such as titles of the articles, names of authors, and footnotes were also annotated. After the metadata were transferred into the data table, lines with titles, names of authors, and footnotes were removed.  
- Individual texts were classified into broad categories, e.g., articles, letters to the editor, notes, and reviews.  
- Introductory paragraphs by the editors for several articles or letters to the editor were removed from the corpus.
- The content of the literary and art sections that were introduced toward the end of the review's existence was removed from the corpus.  
- All texts were manually inspected for typos and OCR errors, which were removed.

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

## Updates
The package was updated on 2026-03-24 when publication dates for three issues were corrected due to an OCR error. This is version 1.0.0. 
