rm(list = ls())
library(tidyverse)
library(exams)
library(printr)

question_txt <- "<h4>Otazka</h4>"
solution_txt <- "<h4>Reseni</h4>"


exams2html(list("contingency_tables/contingency_tables.Rmd",
                "contingency_tables/contingency_tables_marginalization.Rmd",
                "contingency_tables/contingency_tables_relative_freq.Rmd",
                "contingency_tables/contingency_tables_median_split.Rmd"),  
           mathjax = T, 
           question = question_txt, 
           solution = solution_txt 
           )
