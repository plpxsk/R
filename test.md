# Simple, sane testing in R

This workflow doesn't require your project directory to be an R package.

# Step 0

Somewhere in your project directory, you have a file `add.R` which contains a
few functions you want to test.

Example: file `utils/add.R` has:

```r
add_one <- function(x) {
    return(x+1)
}
```


# Set up

```r
install.packages('testthat') 
```

Make the following directories/files in your root project directory:

```
tests/testthat/test_add.R     # to test utils/add.R
tests/run_tests.R
```

# Add test cases

Files in `test/testthat` contain test suites, start with `test` prefix, and:

  * should not load libraries, nor `source()` any files. That comes in next
    step.
  * first line should have some `context(...)`, a phrase to describe this test
    suite
  * includes some `expect_*` style checks from the `testthat` library
  
Example: `test_add.R` has:

```r
context("Adding functions")

result <- add_one(20)

expect_equal(result, 21)
```


# Prepare test run

In `tests/run_tests.R`, write:

```r
library(testthat)

source("utils/add.R")  # or, wherever your actual add.R file is

test_dir("tests/testthat", reporter="Summary")
```

# Run

In your project root folder, execute:

```bash
Rscript tests/run_tests.R
```

If everything passes on first try without errors, get yourself some ice cream :)

# Add more

Add more test cases into files like `tests/testthat/test_add.R`. Don't
forget to source any new files in `tests/run_tests.R`.

Tip: add the test run as `make test` to your
[`Makefile`](https://github.com/pavopax/gists/blob/master/makefile-quick-start.md)


# References

Thank you to
[www.johnmyleswhite.com/notebook/2010/08/17/unit-testing-in-r-the-bare-minimum/](http://www.johnmyleswhite.com/notebook/2010/08/17/unit-testing-in-r-the-bare-minimum/)

And Hadley, including
[github.com/r-lib/testthat](https://github.com/r-lib/testthat).
