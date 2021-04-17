
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pico

<!-- badges: start -->

[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![R-CMD-check](https://github.com/matt-dray/pico/workflows/R-CMD-check/badge.svg)](https://github.com/matt-dray/pico/actions)
[![Codecov test
coverage](https://codecov.io/gh/matt-dray/pico/branch/main/graph/badge.svg)](https://codecov.io/gh/matt-dray/pico?branch=main)
<!-- badges: end -->

Create a ‘pico package’: an R package with the minimum required
structure and content.

## What

{pico} is a toy package that generates [the absolute bare-bones skeleton
of an R package](http://kbroman.org/pkg_primer/pages/minimal.html). It
may be a useful teaching aid to demystify the perceived complexity of R
packages, or a quick-start to create a package of your often-used
personal functions.

<details>
<summary>
Click for (free) resources for ‘proper’ package-writing
</summary>

-   [Hilary Parker’s *Writing an R Package from Scratch*
    post](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)
    (beginner)
-   [Tom Westlake’s update to Hilary’s
    post](https://r-mageddon.netlify.com/post/writing-an-r-package-from-scratch/)
    (beginner)
-   [I wrote some slides about {usethis} for package
    development](https://www.rostrum.blog/2019/11/01/usethis/)
-   [Emil Hvitfeldt’s {usethis}
    workflow](https://www.hvitfeldt.me/blog/usethis-workflow-for-package-development/)
    (beginner/intermediate)
-   [Karl Broman’s *R Package Primer*
    site](https://kbroman.org/pkg_primer/), a primer for package
    development (intermediate)
-   [Hadley Wickham’s *R Packages* book](http://r-pkgs.had.co.nz/)
    (intermediate/advanced)

</details>

## Install

Install {pico} from GitHub with help from {remotes}:

``` r
install.packages("remotes")
remotes::install_github("matt-dray/pico")
```

## Example

### Create

Use the `create()` function to generate a ‘pico package’ with the
minimum required content. You supply a package `name` and a `dir`ectory
where the package’s folder will be written.

As a demonstration, here’s how to create a pico package called {mypkg}
in a temporary folder (you may want to put yours somewhere more
convenient like `~/Documents` on macOS, for example):

``` r
pico::create(
 name = "mypkg",
 dir = tempdir()
)
#> Pico package {mypkg} written to:
#>   /var/folders/y5/ts9sjlt10x1d7qpkgbhy3smh0000gn/T//RtmplriyXP/mypkg
```

Note that the name will be checked against package-naming standards
(i.e. it should contain alphanumeric characters or periods only and it
cannot start with a number nor end with a period). The provided
directory also will be checked for existence and—if it already contains
a folder with the proposed name of your package—you’ll be asked
interactively if you want to overwrite it.

### Structure

The minimum package content has now been created at the specified path.
The package structure looks like this:

    mypkg/
    ├── R/
    │   └── functions.R
    └── DESCRIPTION

The `R/` directory contains a `functions.R` file, which is pre-filled
with the dummy function `say_hi()` for demonstration purposes. The only
other content is a special `DESCRIPTION` text-file that contains only
the name and version number of the package.

### Modify

To add your own functions to the package:

1.  Open the `mypkg/R/functions.R` file
2.  Paste in your function specifications (i.e. like
    `add_one <- function(x) { x + 1 }`)
3.  Save the file

You can create multiple `.R` files in `R/` to help you manage your
functions.

### Install

How do you use your package? It lives on your computer (it’s ‘local’),
so we can use the `install_local()` function from the {remotes} package
(which we installed earlier). Pass the package’s filepath to the
function:

``` r
remotes::install_local(
 path = file.path(tempdir(), "mypkg")
)
#>      checking for file ‘/private/var/folders/y5/ts9sjlt10x1d7qpkgbhy3smh0000gn/T/RtmplriyXP/file16c07c9d14ec/mypkg/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/y5/ts9sjlt10x1d7qpkgbhy3smh0000gn/T/RtmplriyXP/file16c07c9d14ec/mypkg/DESCRIPTION’
#>   ─  preparing ‘mypkg’:
#>   ✓  checking DESCRIPTION meta-information
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#> ─  creating default NAMESPACE file
#>   ─  building ‘mypkg_0.0.9000.tar.gz’
#>    
#> 
```

The package is now installed into your R package library and can be
attached like any other package.

``` r
library(mypkg)
```

So, for example, here’s the dummy function `say_hi()` in action:

``` r
say_hi("Matthew")
#> [1] "Ahoy-hoy Matthew!"
```

### Develop

You might want to add more functions later to `R/functions.R`. Paste
them in and save the file. Now re-run `install_local()` with
`force = TRUE` to overwrite the old version in the package library.

``` r
remotes::install_local(
 path = file.path(tempdir(), "mypkg"),
 force = TRUE
)
#>      checking for file ‘/private/var/folders/y5/ts9sjlt10x1d7qpkgbhy3smh0000gn/T/RtmplriyXP/file16c0160d83cc/mypkg/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/y5/ts9sjlt10x1d7qpkgbhy3smh0000gn/T/RtmplriyXP/file16c0160d83cc/mypkg/DESCRIPTION’
#>   ─  preparing ‘mypkg’:
#>   ✓  checking DESCRIPTION meta-information
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#> ─  creating default NAMESPACE file
#>   ─  building ‘mypkg_0.0.9000.tar.gz’
#>    
#> 
```

Restart R and the new functions will be available from your package.

## Code of Conduct

Please note that the {pico} project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
