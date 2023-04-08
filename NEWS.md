# SixSigma (development version)

* Add colours to .ss.prepCanvas (#16 @k-tatgenhorst)
* Fix deprecated ..density.. issue in ggplot2 
* Add unit testing (#15 @paulamarv8)
* Add codecov
* Add urls to DESCRIPTION
* Stick News.md to tidyverse style guide
* Improve pkgdown doc

# SixSigma 0.10.3

* Fix more moved urls in documentation

# SixSigma 0.10.2

* Fix moved urls in documentation (.rd files)

* Fix example of ss.heli() (avoid generate pdf on checks)

# SixSigma 0.10.1

* Fix moved urls in documentation

# SixSigma 0.10.0

* Fix `ss.rr()` issue on x-bar subgraph (#9).

* `ss.rr()` gains an argument `signifstars` that avoids overwriting the global option. FALSE by default. (@Yoshinobu-Ishizaki, #10).

* NEWS -> NEWS.md

* Documentation with pkgdown at http://emilopezcano.github.io/SixSigma/

# SixSigma 0.9-58

* Remove dependency on the `qcc` package, only used in examples.

* Update documentation

* Fix testing issues

# SixSigma 0.9-57

* Fix bug on `ss.rr()` when no variation, with thanks to Gilles Chassat.

# SixSigma 0.9-56

* Fix bug on `ss.cc()` when plotting MR control chart, with thanks to Jl Z.


# SixSigma 0.9-55

* `ss.rr()` gains a `print_plot` argument.

# SixSigma 0.9-54

* Allow nested designs in R&R Gage studies (ss.rr)

# SixSigma 0.9-53

* Add option f.colours to ss.study.ca

# SixSigma 0.9-52

* Fix bug on computation of `Z_lt` in `ss.ca()`.

* Improve graphical output of `ss.study.ca()`: remove "NA" strings.

# SixSigma 0.9-5

* Include ISBNs in the DESCRIPTION file.

# SixSigma 0.9-4

* Avoid rounding of variance component to zero in `ss.rr()`.

* Correct %Tolerance column in `ss.rr()`.

* Show %Tolerance in the output of `ss.rr()`.

* Fix reference in the package manual.

# SixSigma 0.9-3

* Improvements in `ss.rr()`: allow arguments errorTerm and alphaLim; changes in computations for compliance with AIAG MSA.

* By default, error term in ANOVA table of `ss.rr()` is interaction, so results with
the default values may differ from the ones obtained in previous versions.

* Default value of sigma in `ss.rr()` is 6 instead of 5.15.

* Control limits of the range control chart in `ss.rr()` are now correctly computed.

* Add profiles examples to package help file.

# SixSigma 0.9-2

* Fix all issues and warnings with `ggplot2`.

# SixSigma 0.9-1

* `ss.study.ca()`: fix issue and warning with ggplot2.

* `ss.rr()`: allow character strings as input.

# SixSigma 0.9-0

* Functions for monitoring non-linear profiles.

* Data sets for the example in the book "Quality Control with R".

* Some bug fixes.

# SixSigma 0.8-2

* Fixed hard-coded axis limits and positions in `ss.study.ca()`.

* CRAN policy fixes.

# SixSigma 0.8-1

* Fixed NOTES not accepted by CRAN CHECK.

# SixSigma 0.8-0

* `ss.rr()` now allows one single appraiser.

* `ss.rr()` now accepts the sigma level and tolerance. Thanks Kevin C Limburg for suggesting and contributing with the code.

* Adapted DESCRIPTION and NAMESPACE file to CRAN policies.

* Removed welcome messages when loading package.

# SixSigma 0.7-2 (not uploaded to CRAN)

* Fixed bug on ss.cc when passing climits argument

# SixSigma 0.7-1

* Fixed roxygen code to allow `example(SixSigma)` to work

# SixSigma 0.7-0

* New `ss.cc()` for control charts 
(currently supporting moving-range control chart).

* roxygen2 documentation.

* Updated URL in DESCRIPTION.

* Added compatibility with R-2.14.2.

* Fixed Encoding field in DESCRIPTION.

# SixSigma 0.6.3

* Fixed encoding field in DESCRIPTION.

* ggplot2 0.9.2 compatibility implemented.

# SixSigma 0.6.2

* Bug fixed in `ss.lfa()` (thanks to Sanjay Shinde for reporting).

* ggplot2 0.9.2 compatibility update.

* NEWS file format fixed.

* Code tests implemented for `ss.lfa()` .

# SixSigma 0.6.1

* New dataset `ss.data.batteries`.

* New and updated references in help files.

* `ss.lfa()` now allows smaller-the-better and
  larger-the-better CTQs, besides nominal-the-best.

# SixSigma 0.6.0

* New datasets (ss.data.doe1, ss.data.doe2, ss.data.pb1, ss.data.pb2, 
  ss.data.pb3, ss.data.pb4) for running examples in book "Six Sigma with R".

* Minor modifications for ggplot2 0.9.0 compatibility 

# SixSigma 0.5.0

* Improvements to ss.ci function: density line, normal qq-plot, warnings when
  normality test fails.

* Improvements to capability analysis functions (ss.stuty.ca, ss.cp, ss.cpk), 
  warnings and bug corrections.

* New function ss.cc.getc4 to compute constant c4 for the unbiased estimator of the 
  standard deviation.
  
* New functions ss.cc.getd2 and ss.cc.getd3 to compute mean and variance of
  the relative range distribution (R/sigma)

* New dataframes ss.data.pc, ss.data.pc.big and ss.data.pc.r

* New dataframe ss.data.strings

* Now ss.rr function uses the new functions ss.cc.getd2 and ss.cc.getd3 to
  calculate control limits.

