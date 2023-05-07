testthat::test_that("print messages if all correct ingredients", {
  testthat::expect_message(match_item(c("apple","egg","sugar","vanilla")))
})

testthat::test_that("unable to return", {
  testthat::expect_error(match_item(c("appppple", "e", "suggar", "vanil")))
})


