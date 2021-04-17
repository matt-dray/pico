#' Create a Minimal Package Skeleton
#'
#' Generate a named directory in a specified location that contains the absolute
#' bare minimum content for an R package: a \code{DESCRIPTION} file and an
#' \code{R/} folder, which contains a demo \code{functions.R} script file. The
#' user will be prompted interactively to overwrite if the directory already
#' exists.
#'
#' @param name Character string, length 1. Name for your package. Alphanumeric
#'     or period characters only. Can't start with a number nor end with a
#'     period.
#' @param dir Character string, length 1. Path to the directory where you want
#'     the package folder to be created.
#'
#' @return Nothing. A directory called \code{name} is created or overwritten at
#'     location \code{dir}.
#' @export
#'
#' @examples \dontrun{create("mypkg", "~/Desktop")}
create <- function(name, dir) {

 # Check input classes
 if (class(name) != "character" | class(dir) != "character" |
     length(name) != 1 | length(dir) != 1) {
  stop("Arguments must be character strings of length 1.\n")
 }

 # Check that directory exists
 if (!dir.exists(dir)) {
  stop("Can't find provided 'dir'. Check that it exists.\n")
 }

 # Check package naming rules
 if (!all(grepl("[a-z]|[A-Z]|[0-9]\\.", strsplit(name, "")[[1]])) |
     grepl("^[0-9]|\\.$", name)) {
  stop(
   "'name' must be alphanumeric/period characters only.\n",
   "Can't start with a number nor end with period.\n"
  )
 }

 # Location for package
 dir_pkg <- file.path(dir, name)

 # Check if directory already exists
 if (dir.exists(dir_pkg)) {

  response <- readline("Directory already exists. Overwrite? [y]es/[n]o: ")

  if (tolower(response) %in% c("n", "no", "")) {

   stop("The directory won't be overwritten. Quitting.\n")

  } else if (tolower(response) %in% c("y", "yes")) {

   cat("Overwriting.\n")
   unlink(dir_pkg, recursive = TRUE)

  } else {

   stop("Your response must be 'y' or 'n'. Quitting.\n")

  }

 }

 # Location for R function scripts
 dir_r <- file.path(dir_pkg, "R")

 # Create folders
 dir.create(dir_pkg)
 dir.create(dir_r)

 # Create files
 file.create(
  file.path(dir_pkg, "DESCRIPTION"),
  file.path(dir_r, "functions.R")
 )

 # Add minimal DESCRIPTION
 writeLines(
  paste0("Package: ", name , "\nVersion: 0.0.9000\n"),
  file.path(dir_pkg, "DESCRIPTION")
 )

 # Add demo function
 writeLines(
  paste0(
   'say_hi <- function(name = "buddy") {\n  paste0("Ahoy-hoy ", name, "!")\n}\n'
  ),
  file.path(dir_r, "functions.R")
 )

 # Report success
 cat(paste0("Pico package {", name, "} written to:\n  ", dir_pkg, "\n"))

}
