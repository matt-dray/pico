#' Create Pico Package Skeleton
#'
#' Generate a directory containing the absolute bare minimum content
#' for a package.
#'
#' @param name Character. Name for the package.
#' @param dir Character. Folder location to write the package.
#'
#' @return Nothing. Directory written or not.
#' @export
#'
#' @examples \dontrun{create("mypkg", "~/Desktop")}
create <- function(name, dir) {

 # Check input classes
 if (class(name) != "character" | class(dir) != "character" |
     length(name) != 1 | length(dir) != 1) {
  stop("Arguments must be character strings of length 1.")
 }

 # Check that directory exists
 if (!dir.exists(dir)) {
  stop("That directory doesn't seem to exist.")
 }

 # Check package naming rules
 if (!all(grepl("[a-z]|[A-Z]|[0-9]\\.", strsplit(name, "")[[1]])) |
     grepl("^[0-9]|\\.$", name)) {
  stop("Name can only contain alphanumerics and periods.\n",
       "Cannot start with number; cannot end with period."
  )
 }

 # Location for package
 dir_pkg <- file.path(dir, name)

 # Check if directory already exists
 if (dir.exists(dir_pkg)) {
  response <- readline("Directory already exists. Overwrite? y/n: ")
  if (response %in% c("n", "")) {
   stop("Quitting.\n")
  } else if (response == "y") {
   cat("Overwriting.\n")
   unlink(dir_pkg, recursive = TRUE)
  } else {
   cat("Didn't understand response. Quitting.\n")
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

 cat(paste0("Pico package {", name, "} written to:\n  ", dir_pkg, "\n"))

}
