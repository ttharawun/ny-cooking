testthat::test_that("print messages if all correct ingredients", {
  testthat::expect_message(get_ingredients(c("milk", "egg", "water")))
})

testthat::test_that("print messages if some correct ingredients", {
  testthat::expect_message(get_ingredients(c("milk", "eggggg", "water")))
})

testthat::test_that("print warning if no correct ingredients", {
  testthat::expect_warning(get_ingredients(c("milkkkkk", "eggggg", "wa")))
})
