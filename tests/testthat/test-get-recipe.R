testthat::test_that("check if input url is from nytcooking", {
  test_url = "www.google.com"
  output = get_recipe(test_url)
  testthat::expect_false(output)
})
