context("Do helpers work as expected?")

nums <- c(1:10)
chars <- letters
mix <- c(nums, chars)

expect_true(all_char_are_numeric(nums))
expect_false(all_char_are_numeric(chars))
expect_false(all_char_are_numeric(mix))

