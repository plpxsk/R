# Get better at R

  * [helpers.R](helpers.R)
	
	Helper functions I (re)use in my projects, and so can you

  * [snippets.md](snippets.md)
	
	Reusable R snippets I frequently need but forget

  * [style.md](style.md)
    
    Style/workflow tips for programming in R that *amplify* existing guides
	
  * [test.md](test.md)
  
    Set up a basic test suite in 2 minutes.


# Associated examples

  * [examples/analysis.md](examples/analysis.md)
  
    An example data analysis workflow with `Makefile` and
    [New Project Template](https://github.com/pavopax/new-project-template)

  * [examples/r-testing](examples/r-testing)

    An example of an R analysis with a basic testing suite

# Summary tables in R

Try [`tableone`](https://cran.r-project.org/web/packages/tableone/vignettes/introduction.html)

Other options:
* [manual purrr/dplyr workflows](https://stackoverflow.com/a/39586168/3217870)
* xtable

# More

[Essential R packages that will dramatically improve your
workflow (2016)](http://pavopax.github.io/2016/06/a-new-R-workflow-with-dplyr/)

[Popular R packages (2016)](http://pavopax.github.io/2016/09/r-packages/)

[`dplyr` is a top 10 invention in past 10
years](http://pavopax.github.io/2017/02/dplyr-top-10-invention/)

# Recommended R packages

(working list)

data manipulation

  * tidyverse, incl. purrr, etc
  * magrittr for pipes %T>%, %<>%, etc
  
analysis

  * broom for tidying model results
  * ggsurvplot for survival plots

input/output

  * writexl for writing lists of dfs to Excel
  * readxl from tidyverse for reading Excel files
  
misc

  * testthat (use it for [pipeline
    tests](https://github.com/great-expectations/great_expectations))


