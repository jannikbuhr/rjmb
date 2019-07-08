test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("math converter works", {
  xs <- list("delta and 1 + 2",
             "1 + 1",
             "1+1==2",
             "1+1==2",
             "delta + 1")
  expect_error(purrr::walk(xs, convert_to_math), NA)
})
