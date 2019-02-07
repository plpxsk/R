An example analysis, which follows [New Project Template](https://github.com/pavopax/new-project-template).

From a real analysis. Some data redacted.

# Makefile

Makefile contains the recipe to run the entire analysis. [Learn more about
Makefile](https://github.com/pavopax/gists/blob/master/makefile-quick-start.md)

Eg, to rerun the whole thing, just type `make all` and press ENTER.


```
all: clean data process combine

clean:
	rm -rf cache derived

.PHONY: data
data:
	mkdir -p data/...
	sas code/make_specs.sas
	Rscript code/get_data_from_system.R

process:
	mkdir -p cache/...
	Rscript code/process_this.R
	Rscript code/process_that.R
	Rscript code/process_final.R

combine:
	mkdir -p derived/more
	echo "analysis.csv consists of only analysis-ready variables" > derived/README.md
	Rscript code/combine.R

adhoc:
	Rscript code/obtain_prior_info.R

docs:
	@echo “Copying files from remote...”
	scp ...

tweak:
	git commit -m 'Tweak'; git push
```


# directories

```
/cache
/code
/data
/derived
/notebooks
/output
/references
```

important directories are `/code` (ETL, data munging),  `/notebooks` (data summaries and results), and `/derived` for analysis datasets


# /code
```
get_data_from_*.R
make_specs.sas
obtain_prior_*.R
combine.R
process_this.R
process_that.R
process_final.R

helpers.R
README.md
```


# /notebooks

```
checks.Rmd
checks.md
checks_cache
data-report.Rmd
predictive-prognostic.Rmd
predictive-prognostic.html
predictive-prognostic.md
predictive-prognostic_files
summary-full.Rmd
summary-full.md
summary.Rmd
summary.html
summary.md
t*-comparison.Rmd
t*-comparison.md
validation.Rmd
validation.html
validation.md

README.md
```
