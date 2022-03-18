
n <- 7L
TestData <-
  tibble( double = rnorm(n, 100, 10),
          x = 123400 / 10^(1L:n),
          integer = (1L:n) * (1L:n),    # ^2 would return a double!!
          character = LETTERS[1L:n],
          factor = factor(letters[1L:n]),
          logical = rep(c(TRUE, FALSE), length.out = n) )


test_that(
  "functions works",
  {
    expect_equal(
      test_data |> df_apply(round, is.numeric),
      test_data |> dplyr::mutate(double = c(95, 99, 97, 89, 90, 95, 98))
    )
    expect_equal(
      test_data |> df_apply(tolower, is.character),
      test_data |> dplyr::mutate(character = tolower(LETTERS[1L:n]))
    )
  }
)