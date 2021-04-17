test_that("wrong input fails", {

  expect_error(create(name = 1, dir = tempdir()))
  expect_error(create(name = TRUE, tempdir()))
  expect_error(create(name = c("x", "y"), tempdir()))
  expect_error(create(name = list("x", "y"), tempdir()))

  expect_error(create(name = "x", dir = 1))
  expect_error(create(name = "x", dir = TRUE))
  expect_error(create(name = "x", dir = c("x", "y")))
  expect_error(create(name = "x", dir = list("x", "y")))

})

test_that("illegal names fail", {

 expect_error(create(name = "1x", dir = tempdir()))
 expect_error(create(name = "x.", dir = tempdir()))
 expect_error(create(name = "x y", dir = tempdir()))
 expect_error(create(name = "x_y", dir = tempdir()))

})

test_that("a non-existent directory fails", {

 expect_error(create(name = "x", dir = "x"))

})

test_that("valid input passes", {

 expect_output(create(name = "x", dir = tempdir()))

})

test_that("directory structure is created as expected", {

 unlink(file.path(tempdir(), "x"), recursive = TRUE)
 create(name = "x", dir = tempdir())
 expect_equal(list.files(tempdir(), pattern = "^x$"), "x")
 expect_equal(list.files(file.path(tempdir(), "x")), c("DESCRIPTION", "R"))
 expect_equal(list.files(file.path(tempdir(), "x", "R")), "functions.R")
 unlink(file.path(tempdir(), "x"), recursive = TRUE)

})

test_that("a negative readline input quits the process", {

 unlink(file.path(tempdir(), "x"), recursive = TRUE)
 create(name = "x", dir = tempdir())
 expect_error(create(name = "x", dir = tempdir()))
 unlink(file.path(tempdir(), "x"), recursive = TRUE)

})
