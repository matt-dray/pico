
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pico

<!-- badges: start -->

[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
<!-- badges: end -->

Create an R package with the minimum requirements.

## What

The aim of {pico} is to set up a skeleton directory with the *absolute
minimum* requirements for an R package.

This is a curio to demonstrate the bare bones of package requirements;
it might be useful for intimidated R users who are creating packages for
the very first time, perhaps to house frequently-used personal
functions.

{pico} is absolutely not for ‘serious’ development of packages. There
are many resources out there for proper package development that include
all the additional stuff like documentation, testing, etc. For example:

-   [Hilary Parker’s
    post](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)
    to write a package from scratch (beginner)
-   [Tom Westlake’s
    update](https://r-mageddon.netlify.com/post/writing-an-r-package-from-scratch/)
    to Hilary’s post (beginner)
-   [Emil Hvitfeldt’s
    post](https://www.hvitfeldt.me/blog/usethis-workflow-for-package-development/),
    focusing on {usethis} (beginner/intermediate)
-   [Karl Broman’s site](https://kbroman.org/pkg_primer/), a primer for
    package development (intermediate)
-   [Hadley Wickham’s book](http://r-pkgs.had.co.nz/)
    (intermediate/advanced)

## Install

Install {pico} from GitHub with help from {remotes}:

``` r
install.packages("remotes")
remotes::install_github("matt-dray/pico")
```

## Example

You can create a pico package with the `create()` function. To
demonstrate, we can write the package ‘picopkg’ to a temporary folder.

``` r
pico::create("picopkg", tempdir())
#> Pico package {picopkg} written to
#>   /var/folders/y5/ts9sjlt10x1d7qpkgbhy3smh0000gn/T//Rtmp8E9Mkv/picopkg
```

The minimum package content has now been created at the specified path.
It comprises of:

-   an `R/` directory with a `functions.R` file (which contains a dummy
    function called `say_hi()`)
-   a `DESCRIPTION` file that contains only the name and version number
    of the package

<!-- -->

    picopkg/
    ├── R/
    │   └── functions.R
    └── DESCRIPTION

To add your functions, open the `picopkg/R/functions.R` file, add your
function specifications and then save.

Now you can install your package (again with help from {remotes}):

``` r
remotes::install_local(file.path(tempdir(), "picopkg"))
#> Skipping install of 'picopkg' from a local remote, the SHA1 (0.0.9000) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

The functions from your pico package are now available to you. Here’s
the dummy function `say_hi()` in action:

``` r
picopkg::say_hi("Matthew")
#> [1] "Ahoy-hoy Matthew!"
```