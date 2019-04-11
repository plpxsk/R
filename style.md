# Style/workflow tips for programming in R

> It is always easier to write code than it is to read it.

Just some thoughts from my experience which aim to amplify existing guides.

# Workflow

For more complicated/larger analyses, try to work with R scripts instead of long Rmd documents
- consider limiting an Rmd document to a quick summary with a few plots, or some one-off analysis
- rationale:
    - large Rmd files, especially if written by <= 1 human, can be unwieldy to manage by others, or by the author in the future
    - splitting one large file into more reusable pieces will make your code more reusable
    - smaller pieces will run faster if you only need to run a part of it
    


# Style - good practices

Define functions near top of your program/script. Or in a separate `helpers.R` or similar file and then `source(“helpers.R”)` near top

Define constants near the top of the program (possibly using VARIABLES_IN_CAPS)
- you can even use separate `config.R` file with constants and other config variables that your reference throughout your project

Try to use 0/1 (or logical true, etc) binary variables instead of some more complicated strings

write out tidy CSV files - do not write row names to output CSVs. Use:
- readr::write_csv (available in tidyverse), OR:
- write.csv(..., row.names=FALSE)

Do not add dates to output file names. Latest dataset should always have the same, fixed, name.
Overwrite old files (and possibly move older versions to /old folder if you really need them).
- filenames with dates mean you have to change your code if the filename changes

When programming, consider [the rule of three](http://pavopax.github.io/2017/08/use-the-rule-of-three/)




## For Rmd documents

Rmd files are not overly long (a few hundred lines max)

Place `library()` calls on top, not throughout

Add contact/email at top in case others find the analysis in the wild and/or are interested in the code

limit code lines to 79 or 80 characters max

To reuse data processing and potentially speed up knitting to html or PDF, put data cleaning/processing into a separate file
- for example, create and run separate R scripts (see below) that clean/process data and create "derived" datasets, and then just read in the derived data at top of your Rmd file


## For R scripts

R scripts (.R) should run with zero (minimal) messages/warnings:
- use `suppressPackageStartupMessages(library(tidyverse))` etc
- in joining, use explicit `by` variables
- in reading csv's with read_csv, specify column types, eg with `read_csv("file.csv", col_types = list())`
- rationale: when you run these from command line, with fewer messages, it will be easier to find real/important warnings/messages/errors. If everything is good, you will see zero messages.

Limit all lines to 79 or 80 characters max (for exceptions like long file paths, etc, tag the end with something line `# noqa`)
          
# Testing

I'm still trying to figure out best practices for "testing" in *analysis* code. Send me your thoughts [@pavopax](https://twitter.com/pavopax).

In the meantime, here are two references:
* This repo includes a guideline doc for writing tests: [Simple, sane testing in R](https://github.com/pavopax/betR/blob/master/test.md)
* [assertr](https://cran.r-project.org/web/packages/assertr/vignettes/assertr.html)

# References

Pause and re-organize your code and projects:
* [Organizational Skills Beat Algorithmic Wizardry](http://prog21.dadgum.com/177.html), also summarized on [John Cook's blog](https://www.johndcook.com/blog/2015/06/18/most-important-skill-in-software/)
