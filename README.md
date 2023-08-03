# Scientific names extracted from Ruhoff 1980

The goal of this project is to extract scientific names from
[Ruhoff 1980](https://doi.org/10.5479/si.00810282.294)

Cleaned up data [file](data/08-reconcile.csv)


## Process

[x] Make [OCR](data/01-ocr.txt)

[x] [Concatenate lines](data/03-concat.txt)

[x] [Fix spaces](data/04-sortfix.txt) in species names

[x] [Fix commas](data/04-sortfix.txt) which were recognized as periods.

[x] [Fix years](data/05-year.txt)

[x] [Extract name part](data/06-names.csv) (06-names.csv first column is the place to fix errors)

[x] [Reformat name part](data/07-fmt-names.csv)

[x] [Fix spellings in names](data/07-fmt-names.csv)

[x] [Run reconciliation using GNverifier with OpenRefine](data/08-reconcile.csv)

## Stats

| Names                           | Number      | Percentage
| ------------------------------- | ----------- | ------------
| Total                           | 35487       | 100%
| All Matches                     | 26799       | 75.4%
| No Match                        |  8688       | 24.6%
| Canonical + Auth. Match         | 22311       | 62.8%
| Canonical Match                 |  3448       | 9.7%
| Fuzzy Canonical Match           |  1040       | 2.9%

