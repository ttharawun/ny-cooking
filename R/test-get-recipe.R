testthat::test_that("Are input url from New York Times Cooking?", {
  test_url = "www.google.com"
  output=NewYorkTimesCooking::get_recipe(test_url)
  testthat::expect_false(output)
})
