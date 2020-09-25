library(tidyverse)
library(testthat)

input_data <- readxl::read_excel("data/input_data.xlsx", na = "NA")
testthat::test_that("test input data", {
  expect_true(input_data %>% filter(type == "numeric") %>% mutate(correct = !is.na(round_val)) %>% pull(correct) %>% all())
  expect_true(min(input_data$round_val, na.rm = T)==0)
})
