
rm(list = ls())
library(tidyverse)
library(exams)
library(printr)

question_txt <- "<h4>Otazka</h4>"
solution_txt <- "<h4>Reseni</h4>"

set.seed(1)
questions <- c("průměr", "median", "směrodatnou odchylku", "rozptyl", "dolní kvartil", "horní kvartil")
ix <- sample(1:length(questions),3)
qt <- sample(1:6,2)

exams2moodle(file = list(expar("desc_stat/desc_var.Rmd",ix = 1)),name = "mean", n = 50)
exams2moodle(file = list(expar("desc_stat/desc_var.Rmd",ix = 2)),name = "median", n = 50)
exams2moodle(file = list(expar("desc_stat/desc_var.Rmd",ix = 3)),name = "sd", n = 50)
exams2moodle(file = list(expar("desc_stat/desc_var.Rmd",ix = 4)),name = "var", n = 50)
exams2moodle(file = list(expar("desc_stat/desc_var.Rmd",ix = 5)),name = "lower_quartile", n = 50)
exams2moodle(file = list(expar("desc_stat/desc_var.Rmd",ix = 6)),name = "upper_quartile", n = 50)



# whole test --------------------------------------------------------------

rm(list = ls())
library(tidyverse)
library(exams)
library(printr)

question_txt <- "<h4>Otazka</h4>"
solution_txt <- "<h4>Reseni</h4>"

set.seed(1)
questions <- c("průměr", "median", "směrodatnou odchylku", "rozptyl", "dolní kvartil", "horní kvartil")
ix <- sample(1:length(questions),3)
qt <- sample(1:6,2)
exams2moodle(list(c(expar("desc_stat/desc_var.Rmd",ix = ix[1]),
               expar("desc_stat/desc_var.Rmd",ix = ix[2])),
               "misc/typ_grafu.Rmd",
               c("correlation/correlation.Rmd",
               "correlation/correlation_positive_negative.Rmd",
               "correlation/correlation_larger_smaller.Rmd"),
               c("regression/regression_R2.Rmd",
               "regression/regression_intercept.Rmd",
               "regression/regression_slope.Rmd",
               "contingency_tables/contingency_tables_asoc.Rmd",
               "contingency_tables/contingency_tables_creation.Rmd",
               "contingency_tables/contingency_tables_marginalization.Rmd",
               "contingency_tables/contingency_tables_relative_freq.Rmd"),
               c("intervals_estimation/point_estimate.Rmd",
               "intervals_estimation/range_estimate.Rmd"),
               
               c(expar("intervals_estimation/confidence_intervals_logic.Rmd", question_type = qt[1]),
               expar("intervals_estimation/confidence_intervals_logic.Rmd", question_type = qt[2])),
               c("hypothesis_testing/chi_square_independence.Rmd",
               "hypothesis_testing/chi_square_independence_compute.Rmd",
               "hypothesis_testing/t_test.Rmd",
               "hypothesis_testing/hypothesis_testing.Rmd",
               "hypothesis_testing/error_type.Rmd",
               "hypothesis_testing/tailedness.Rmd")),
          n = 1,  
          name = "test_FR"
)
