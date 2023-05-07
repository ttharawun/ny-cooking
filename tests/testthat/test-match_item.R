testthat::test_that("return output if ingredients can be found in dataframe", {
  testthat::expect_visible(match_item(c("apple","egg","sugar","vanilla")))
})

testthat::test_that("unable to return recipes if ingredients are unable to be found", {
  testthat::expect_error(match_item(c("appppple", "e", "suggar", "vanil")))
})


