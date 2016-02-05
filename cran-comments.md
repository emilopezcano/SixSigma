## Test environments
* local Ubuntu 15.10, R 3.2.3
* Source file built from RStudio
* Documented via roxygen2

## R CMD check results
* Checked with R CMD check --as-cran, using devel version 2016-02-05 r70103
* Only one NOTE, I think it is because the package has been archived. Apologies 
  for not having fixed before, I am aware that Hadley sent a message with the possible problems of the
  dependencies with ggplot2. In any case, I would have expected a message from CRAN before (or just
  after) archiving.

* This is an excerpt of 00check.log file:

```
* using log directory ‘/home/emilio/SixSigma.Rcheck’
* using R Under development (unstable) (2016-02-05 r70103)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--as-cran’
* checking for file ‘SixSigma/DESCRIPTION’ ... OK
[...]
* checking CRAN incoming feasibility ... NOTE
Maintainer: ‘Emilio L. Cano <emilio.lopez@urjc.es>’

New submission

Package was archived on CRAN

CRAN repository db overrides:
  X-CRAN-Comment: Archived on 2016-01-27 as check problems were not
    corrected despite reminders.
* checking package namespace information ... OK
[...]
* checking PDF version of manual ... OK
* DONE
Status: 1 NOTE
```

## Downstream dependencies

No downstream dependencies so far
