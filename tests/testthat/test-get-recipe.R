testthat::test_that("check if nytcooking url works and returns recipe object", {
  testthat::expect_visible(get_recipe("https://cooking.nytimes.com/recipes/1024156-toasted-sesame-and-scallion-waffles"))
})

testthat::test_that("check if input url is from nytcooking", {
  testthat::expect_warning(get_recipe("www.google.com"))
})


