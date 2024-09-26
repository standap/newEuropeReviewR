# newEuropeReviewR
This is repository contains an R data package that consists of text corpus of a complete run of the foreign policy weekly *The New Europe* that was published between 1916 and 1921. 



## tne_countries
This dataset was created with a dictionary running against a the whole corpus using a `quanteda` package. Unlike a a regular frequency count that simply count how many times a token was found in the corpus. The dictionary based approach allows for a more robust tally as it looks for multiple terms that are associated with the concept in the dictionary. Below is an example of terms associated with the two-letter codes.

EUROPE:

  EAST:
     AH': [Austria-Hungar*, Austro-Hungar*, Ballhausplatz, Habsburg]
    'BG': [Bulgaria*, Bulgarian*, Bulgars, Sofia]
    'CS': [Czechoslovak*, Czecho-Slovakia, Czech*, Slovak*, Slovakia, Prague, Bratislava, Ruthenian*, Pressburg, Bohemia, Moravia]
#    'CZ': [Czech Republic, Czech*, Prague]
    'HU': [Hungary, Hungarian*, Budapest, Magyar*]
    'PL': [Poland, Polish, Pole*, Warsaw, Cracow, Danzig]
    'RO': [Ro*mania, Ro*manian*, Bucharest, Transylvania*, Bessarabia*, Bukovina, Wallachia*, Dobrudja]
    'JW': [Jews, Jewish, Hebrew, Zionis*, Jerusalem]
   contains a code 

The `tne_countries` dataset contains six columns. The document identifier, two-letter  country code, number of times a term related to the identifier was mentioned , the date when the document was publish, extracted year of publication, and the type of text in the New Europe weekly. 


```
remotes::install_github("standap/newEuropeReviewR")
```
