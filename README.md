
<!-- README.md is generated from README.Rmd. Please edit that file -->

<img src="https://raw.githubusercontent.com/matt-dray/stickers/master/output/pico_hex.png" width="150" align="right">

# {pico}

<!-- badges: start -->

[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![R-CMD-check](https://github.com/matt-dray/pico/workflows/R-CMD-check/badge.svg)](https://github.com/matt-dray/pico/actions)
[![Codecov test
coverage](https://codecov.io/gh/matt-dray/pico/branch/main/graph/badge.svg)](https://codecov.io/gh/matt-dray/pico?branch=main)
[![CodeFactor](https://www.codefactor.io/repository/github/matt-dray/pico/badge)](https://www.codefactor.io/repository/github/matt-dray/pico)
[![Blog
post](https://img.shields.io/badge/rostrum.blog-post-008900?labelColor=000000&logo=data%3Aimage%2Fgif%3Bbase64%2CR0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh%2BQQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/2021/04/18/pico-pkg/)
<!-- badges: end -->

Create a ‘pico package’: an R package with the minimum required
structure and content.

## What

{pico} is a toy package that generates [the absolute bare-bones skeleton
of an R package](http://kbroman.org/pkg_primer/pages/minimal.html). It
may be a useful teaching aid to demystify the perceived complexity of R
packages, or a quick-start to create a package of your often-used
personal functions. Read more in [the accompanying blog
post](https://www.rostrum.blog/2021/04/18/pico-pkg/).

<details>
<summary>
Click for (free) resources for ‘proper’ package-writing
</summary>

-   [Hilary Parker’s *Writing an R Package from Scratch*
    post](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)
-   [Tom Westlake’s update to Hilary’s
    post](https://r-mageddon.netlify.com/post/writing-an-r-package-from-scratch/)
-   [Fabio Votta’s fun slides](https://develop-rpkgs.netlify.app/)
-   [I wrote some slides about {usethis} for package
    development](https://www.rostrum.blog/2019/11/01/usethis/)
-   [Emil Hvitfeldt’s {usethis}
    workflow](https://www.hvitfeldt.me/blog/usethis-workflow-for-package-development/)
-   [Karl Broman’s *R Package Primer*
    site](https://kbroman.org/pkg_primer/)
-   [Hadley Wickham’s *R Packages* book](http://r-pkgs.had.co.nz/)

</details>

## Install

Install {pico} from GitHub with help from {remotes}:

``` r
install.packages("remotes")
remotes::install_github("matt-dray/pico")
```

## Example

### Create

Use the `create()` function to generate a ‘pico package’ in a specified
location with the minimum required content. For example, to create
{mypkg} in a temporary folder:

``` r
pico::create(
 name = "mypkg",
 dir = tempdir()
)
#> Pico package {mypkg} written to:
#>   /var/folders/y5/ts9sjlt10x1d7qpkgbhy3smh0000gn/T//RtmpMmOHDt/mypkg
```

### Structure

At your specified path, you’ll get the minimum required package
structure:

    mypkg/
    ├── R/
    │   └── functions.R
    └── DESCRIPTION

The `R/` directory has the script file `functions.R`, pre-filled with
the dummy function `say_hi()`. The `DESCRIPTION` text-file is a special
file that earmarks the directory as an R package. It contains only the
name and version number of the package.

### Install

Install the package from your machine (i.e. it’s ‘local’ to you) with
`install_local()` from {remotes}:

``` r
remotes::install_local(
 path = file.path(tempdir(), "mypkg")
)
#>      checking for file ‘/private/var/folders/y5/ts9sjlt10x1d7qpkgbhy3smh0000gn/T/RtmpMmOHDt/file3dd21d3084a/mypkg/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/y5/ts9sjlt10x1d7qpkgbhy3smh0000gn/T/RtmpMmOHDt/file3dd21d3084a/mypkg/DESCRIPTION’ (490ms)
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

Now you can use the provided dummy function `say_hi()`:

``` r
say_hi("Matthew")
#> [1] "Ahoy-hoy Matthew!"
```

### Develop

To add your own functions to the package:

1.  Paste your functions into `functions.R` and save
2.  Re-run `install_local()` as above, but with `force = TRUE` to
    overwrite the old version
3.  Restart R

The new functions will now be available from your package.

## Code of Conduct

Please note that the {pico} project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
