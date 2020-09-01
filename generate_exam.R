rm(list = ls())
library(tidyverse)
library(exams)
library(printr)

question_txt <- "<h4>Otazka</h4>"
solution_txt <- "<h4>Reseni</h4>"


set.seed(165)
exams2pdf(list("correlation/contingency_tables.Rmd",
               "correlation/contingency_tables_marginalization.Rmd",
               "correlation/contingency_tables_relative_freq.Rmd",
               "correlation/contingency_tables_creation.Rmd"),
          #"contingency_tables/contingency_tables_median_split.Rmd"),  
          mathjax = T, 
          question = question_txt, 
          solution = solution_txt 
)


set.seed(165)
exams2pdf(list("contingency_tables/contingency_tables.Rmd",
                "contingency_tables/contingency_tables_marginalization.Rmd",
                "contingency_tables/contingency_tables_relative_freq.Rmd",
                "contingency_tables/contingency_tables_creation.Rmd"),
                #"contingency_tables/contingency_tables_median_split.Rmd"),  
           mathjax = T, 
           question = question_txt, 
           solution = solution_txt 
           )

set.seed(164)
questions <- c("průměr", "median", "směrodatnou odchylku", "rozptyl", "dolní kvartil", "horní kvartil")
ix <- sample(1:length(questions),3)

exams2pdf(list(expar("desc_stat/desc_var.Rmd",ix = ix[1]),
                expar("desc_stat/desc_var.Rmd",ix = ix[2]),
                expar("desc_stat/desc_var.Rmd",ix = ix[3]),
                "desc_stat/desc_plot.Rmd",
                "desc_stat/density_plot.Rmd"
                ),  
           mathjax = T, 
           question = question_txt, 
           solution = solution_txt 
)
set.seed(167)
exams2pdf(list("probability/binomial_distribution.Rmd",
                "probability/poisson_distribution.Rmd",
                "probability/normal_distribution.Rmd",
                "probability/normal_distribution_mean.Rmd",
                "probability/normal_distribution_perc.Rmd",
                "probability/normal_distribution_range.Rmd",
                "probability/normal_distribution_sum.Rmd"),  
template = "exam",  
question = question_txt, 
solution = solution_txt 
)

set.seed(167)
exams2pdf(list("probability/binomial_distribution.Rmd",
               "probability/poisson_distribution.Rmd",
               "probability/normal_distribution.Rmd",
               "probability/normal_distribution_mean.Rmd",
               "probability/normal_distribution_perc.Rmd",
               "probability/normal_distribution_range.Rmd",
               "probability/normal_distribution_sum.Rmd"),  
          
          question = question_txt, 
          solution = solution_txt 
)

exams2html(list(expar("probability/normal_distribution_mean.Rmd",curr_theme = "laser_failure"),
                expar("probability/normal_distribution_perc.Rmd",curr_theme = "laser_failure"),
                expar("probability/normal_distribution_range.Rmd",curr_theme = "laser_failure"),
                expar("probability/normal_distribution_sum.Rmd",curr_theme = "laser_failure")),
           mathjax = T, 
           question = question_txt, 
           solution = solution_txt 
)


set.seed(193)
exams2pdf(list("intervals_estimation/point_estimate.Rmd",
               "intervals_estimation/range_estimate.Rmd",
               "intervals_estimation/range_estimate_size.Rmd",
               "intervals_estimation/confidence_intervals_logic.Rmd",
               "hypothesis_testing/t_test.Rmd",
               "hypothesis_testing/z_test.Rmd",
               "hypothesis_testing/hypothesis_testing.Rmd",
               "hypothesis_testing/chi_square_independence.Rmd",
               "hypothesis_testing/chi_square_independence_compute.Rmd",
               "hypothesis_testing/tailedness.Rmd"),  
          n = 2,  
          question = question_txt, 
          solution = solution_txt 
)


# test errorneus question -------------------------------------------------

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

exams2pdf(list("contingency_tables/contingency_tables_marginalization.Rmd"),
          n = 20,  
          question = question_txt, 
          solution = solution_txt 
)

# all questions -----------------------------------------------------------


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
exams2pdf(list(expar("desc_stat/desc_var.Rmd",ix = ix[1]),
               expar("desc_stat/desc_var.Rmd",ix = ix[2]),
               expar("desc_stat/desc_var.Rmd",ix = ix[3]),
               "misc/typ_grafu.Rmd",
               "correlation/correlation.Rmd",
               "correlation/correlation_positive_negative.Rmd",
               "correlation/correlation_larger_smaller.Rmd",
               "regression/regression_R2.Rmd",
               "regression/regression_intercept.Rmd",
               "regression/regression_slope.Rmd",
               "contingency_tables/contingency_tables_asoc.Rmd",
               "contingency_tables/contingency_tables_creation.Rmd",
               "contingency_tables/contingency_tables_marginalization.Rmd",
               "contingency_tables/contingency_tables_relative_freq.Rmd",
               "probability/binomial_distribution.Rmd",
               "probability/poisson_distribution.Rmd",
               "probability/normal_distribution.Rmd",
               "probability/normal_distribution_range.Rmd",
               "probability/normal_distribution_perc.Rmd",
               "probability/normal_distribution_sum.Rmd",
               "probability/normal_distribution_mean.Rmd",
               "intervals_estimation/point_estimate.Rmd",
               "intervals_estimation/range_estimate.Rmd",
               "intervals_estimation/range_estimate_size.Rmd",
               expar("intervals_estimation/confidence_intervals_logic.Rmd", question_type = qt[1]),
               expar("intervals_estimation/confidence_intervals_logic.Rmd", question_type = qt[2]),
               "hypothesis_testing/chi_square_independence.Rmd",
               "hypothesis_testing/chi_square_independence_compute.Rmd",
               "hypothesis_testing/z_test.Rmd",
               "hypothesis_testing/t_test.Rmd",
               "hypothesis_testing/hypothesis_testing.Rmd",
               "hypothesis_testing/error_type.Rmd",
               "hypothesis_testing/tailedness.Rmd"),
          n = 5,  
          question = question_txt, 
          solution = solution_txt,
          quiet = F
)
               
