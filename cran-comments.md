## Test environments
* local Ubuntu 15.04, R 3.2.2

## R CMD check results
* In the previous submission, checked with r-devel version 
  (2015-11-07 r69612), there were no ERRORs, WARNINGs, or NOTEs.  
* However, Kurt Hornik reported a NOTE (... Undefined global 
  functions or variables: abline lines plot points ...)
* That issue has been fixed (imported graphics package 
  in NAMESPACE)
* Checked again --as-cran (just in case with the latest r-devel 
  version 2015-11-09 r69615) with no ERRORs, WARNINGs, or NOTES:   

```
* using log directory ‘/home/emilio/SixSigma.Rcheck’
* using R Under development (unstable) (2015-11-09 r69615)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--as-cran’
* checking for file ‘SixSigma/DESCRIPTION’ ... OK
* ... 
* ...
* checking PDF version of manual ... OK
* DONE

Status: OK
```

## Downstream dependencies

No downstream dependencies so far
