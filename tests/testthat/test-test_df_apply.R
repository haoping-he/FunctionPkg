
n <- 5L
TestData <-
  dplyr::tibble( double = c(5.002, 3.221, 4.008, 5.112, 4.779),
                 integer   = c(0, 10, 20, 30, 40),
                 cap = LETTERS[1L:n],
                 low = letters[1L:n])

test_that(
  "Every parts of df_apply function work.",
  {
    expect_equal(
      TestData |> df_apply(round, is.numeric, toupper, digits = 2),
      TestData |> dplyr::mutate(
        double    = c(5.00, 3.22, 4.01, 5.11, 4.78),
        integer   = c(0, 10, 20, 30, 40),
        low = toupper(letters[1L:n])
      )
    )
  }
)


test_that(
  "condition and execution functions work perfect.",
  {
    expect_equal(
      TestData |> df_apply(round, is.numeric, digits = 2),
      TestData |> dplyr::mutate(
        double    = c(5.00, 3.22, 4.01, 5.11, 4.78),
        integer   = c(0, 10, 20, 30, 40),
        low =  letters[1L:n] )
    )
    expect_equal(
      TestData |>  df_apply(toupper, is_character),
      TestData |> dplyr::mutate(
        double    = c(5.002, 3.221, 4.008, 5.112, 4.779),
        integer   = c(0, 10, 20, 30, 40),
        low =  toupper(letters[1L:n]) 
        )
    )
  }
)



test_that(
  "else function is optional but it works if added.",
  {
    expect_equal(
      TestData |> df_apply(round, is.numeric, digits = 2),
      TestData |> dplyr::mutate(
        double    = c(5.00, 3.22, 4.01, 5.11, 4.78),
        integer   = c(0, 10, 20, 30, 40),
        low =  letters[1L:n])
      )
  }
)

