# Scientific names exctracted from Ruhoff 1980

The goal of this project is to extract scientific names from
[Ruhoff 1980](https://repository.si.edu/handle/10088/5331)


## Process

[x] Make [OCR](data/01-ocr.txt)

[x] [Concatenate lines](data/03-concat.txt)

[x] [Fix spaces](data/04-sortfix.txt) in species names

[x] [Fix commas](data/04-sortfix.txt) which were recognized as periods.

[x] [Fix years](data/05-year.txt)

[x] [Extract name part](data/06-names.csv) (06-names.csv first column is the place to fix errors)

[x] [Reformat name part](data/07-fmt-names.csv)

[x] [Fix spellings in names](data/07-fmt-names.csv)

[ ] Run reconciliation using GNverifier

