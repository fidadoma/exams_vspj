rm(list = ls())
library(tidyverse)
library(exams)
library(printr)

question_txt <- "<h4>Otazka</h4>"
solution_txt <- "<h4>Reseni</h4>"


exams2html(list("contingency_tables/contingency_tables.Rmd",
                "contingency_tables/contingency_tables_marginalization.Rmd",
                "contingency_tables/contingency_tables_relative_freq.Rmd",
                "contingency_tables/contingency_tables_creation.Rmd",
                "contingency_tables/contingency_tables_median_split.Rmd"),  
           mathjax = T, 
           question = question_txt, 
           solution = solution_txt 
           )

questions <- c("průměr", "median", "směrodatnou odchylku", "rozptyl", "dolní kvartil", "horní kvartil")
ix <- sample(1:length(questions),3)

exams2html(list(expar("desc_stat/desc_var.Rmd",ix = ix[1]),
                expar("desc_stat/desc_var.Rmd",ix = ix[2]),
                expar("desc_stat/desc_var.Rmd",ix = ix[3]),
                "desc_stat/desc_plot.Rmd",
                "desc_stat/density_plot.Rmd"
                ),  
           mathjax = T, 
           question = question_txt, 
           solution = solution_txt 
)

exams2html(list("probability/binomial_distribution.Rmd",
                "probability/poisson_distribution.Rmd",
                "probability/normal_distribution.Rmd",
                "probability/normal_distribution_mean.Rmd",
                "probability/normal_distribution_perc.Rmd",
                "probability/normal_distribution_range.Rmd",
                "probability/normal_distribution_sum.Rmd"),  
mathjax = T, 
question = question_txt, 
solution = solution_txt 
)
