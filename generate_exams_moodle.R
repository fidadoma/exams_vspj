
rm(list = ls())
library(tidyverse)
library(exams)
library(printr)

themes <- readxl::read_excel("data/input_data.xlsx") %>% pull(group_theme) %>% unique()
bank_prefix <- "vsechny ulohy"
n_total <- 50
out_dir <- "generated_questions"

set.seed(1)

current_group <- "Deskriptivni statistika"

exams2moodle(file = list(expar("desc_stat/desc_var.Rmd",ix = 1)),name = "Deskriptivni statistika1", stitle = sprintf("%s/%s/Vypocet prumeru",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list(expar("desc_stat/desc_var.Rmd",ix = 2)),name = "Deskriptivni statistika2", stitle = sprintf("%s/%s/Vypocet medianu",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list(expar("desc_stat/desc_var.Rmd",ix = 3)),name = "Deskriptivni statistika3", stitle = sprintf("%s/%s/Vypocet smd. odchylky",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list(expar("desc_stat/desc_var.Rmd",ix = 4)),name = "Deskriptivni statistika4", stitle = sprintf("%s/%s/Vypocet rozptylu",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list(expar("desc_stat/desc_var.Rmd",ix = 5)),name = "Deskriptivni statistika5", stitle = sprintf("%s/%s/Vypocet dolniho kvartilu",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list(expar("desc_stat/desc_var.Rmd",ix = 6)),name = "Deskriptivni statistika6", stitle = sprintf("%s/%s/Vypocet horniho kvartilu",bank_prefix,current_group),n = n_total, dir = out_dir)

set.seed(123)
current_group <- "Deskriptivni statistika"
exams2moodle(file = list("misc/typ_grafu.Rmd"),name = "Deskriptivni statistika_misc", stitle = sprintf("%s/%s/Typ grafu",bank_prefix,current_group),n = n_total, dir = out_dir)

set.seed(11)
current_group <- "Deskriptivni statistika"
exams2moodle(file = list("desc_stat/desc_plot.Rmd"),name = "Deskriptivni statistika7", stitle = sprintf("%s/%s/Vizualizace dat",bank_prefix,current_group),n = n_total, dir = out_dir)

set.seed(2)
current_group <- "Korelace a regrese"

exams2moodle(file = list("correlation/correlation.Rmd"),name = "Korelace_a_regrese1", stitle = sprintf("%s/%s/Korelace/Vypocet korelace",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("correlation/correlation_positive_negative.Rmd"),name = "Korelace_a_regrese2", stitle = sprintf("%s/%s/Korelace/Korelace - kladna-zaporna",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("correlation/correlation_larger_smaller.Rmd"),name = "Korelace_a_regrese3", stitle = sprintf("%s/%s/Korelace/Korelace - vetsi-mensi",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("regression/regression_R2.Rmd"),name = "Korelace_a_regrese4", stitle = sprintf("%s/%s/Regrese/Regrese - vypocet R2",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("regression/regression_intercept.Rmd"),name = "Korelace_a_regrese5", stitle = sprintf("%s/%s/Regrese/Regrese - vypocet interceptu",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("regression/regression_slope.Rmd"),name = "Korelace_a_regrese6", stitle = sprintf("%s/%s/Regrese/Regrese - vypocet slope",bank_prefix,current_group),n = n_total, dir = out_dir)

set.seed(3)
current_group <- "Kontingencni tabulka"

exams2moodle(file = list("contingency_tables/contingency_tables_asoc.Rmd"),name = "Kontingencni_tabulka1", stitle = sprintf("%s/%s/Kontingencni tabulka - asociace",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("contingency_tables/contingency_tables_creation.Rmd"),name = "Kontingencni_tabulka2", stitle = sprintf("%s/%s/Kontingencni tabulka - vytvoreni",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("contingency_tables/contingency_tables_marginalization.Rmd"),name = "Kontingencni_tabulka3", stitle = sprintf("%s/%s/Kontingencni tabulka - marginalizace",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("contingency_tables/contingency_tables_relative_freq.Rmd"),name = "Kontingencni_tabulka4", stitle = sprintf("%s/%s/Kontingencni tabulka - relativni frekvence",bank_prefix,current_group),n = n_total, dir = out_dir)

set.seed(4)
current_group <- "Pravdepodobnost"

exams2moodle(file = list("probability/binomial_distribution.Rmd"),name = "Pravdepodobnost1", stitle = sprintf("%s/%s/Binomicke rozdeleni",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("probability/poisson_distribution.Rmd"),name = "Pravdepodobnost2", stitle = sprintf("%s/%s/Poissonovo rozdeleni",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("probability/normal_distribution.Rmd"),name = "Pravdepodobnost3", stitle = sprintf("%s/%s/Normalni rozdeleni",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("probability/normal_distribution_mean.Rmd"),name = "Pravdepodobnost4", stitle = sprintf("%s/%s/Normalni rozdeleni - prumer",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("probability/normal_distribution_sum.Rmd"),name = "Pravdepodobnost5", stitle = sprintf("%s/%s/Normalni rozdeleni - suma",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("probability/normal_distribution_perc.Rmd"),name = "Pravdepodobnost6", stitle = sprintf("%s/%s/Normalni rozdeleni - inverz",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("probability/normal_distribution_range.Rmd"),name = "Pravdepodobnost7", stitle = sprintf("%s/%s/Normalni rozdeleni - rozsah",bank_prefix,current_group),n = n_total, dir = out_dir)

set.seed(5)
current_group <- "Odhady a testovani hypotez"

exams2moodle(file = list("interval_estimation/confidence_intervals_logic.Rmd"),name = "Intervaly_hypotezy1", stitle = sprintf("%s/%s/Intervaly/Logika konfidencnich intervalu",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("interval_estimation/point_estimate.Rmd"),name = "Intervaly_hypotezy2", stitle = sprintf("%s/%s/Intervaly/Bodovy odhad",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("interval_estimation/range_estimate.Rmd"),name = "Intervaly_hypotezy3", stitle = sprintf("%s/%s/Intervaly/Intervalovy odhad",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("interval_estimation/range_estimate_size.Rmd"),name = "Intervaly_hypotezy4", stitle = sprintf("%s/%s/Intervaly/Intervalovy odhad - sire intervalu",bank_prefix,current_group),n = n_total, dir = out_dir)

set.seed(6)
current_group <- "Odhady a testovani hypotez"

exams2moodle(file = list("intervals_estimation/confidence_intervals_logic.Rmd"),name = "Intervaly_hypotezy1", stitle = sprintf("%s/%s/Intervaly/Logika konfidencnich intervalu",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("intervals_estimation/point_estimate.Rmd"),name = "Intervaly_hypotezy2", stitle = sprintf("%s/%s/Intervaly/Bodovy odhad",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("intervals_estimation/range_estimate.Rmd"),name = "Intervaly_hypotezy3", stitle = sprintf("%s/%s/Intervaly/Intervalovy odhad",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("intervals_estimation/range_estimate_size.Rmd"),name = "Intervaly_hypotezy4", stitle = sprintf("%s/%s/Intervaly/Intervalovy odhad - sire intervalu",bank_prefix,current_group),n = n_total, dir = out_dir)

exams2moodle(file = list("hypothesis_testing/chi_square_independence.Rmd"),name = "Intervaly_hypotezy5", stitle = sprintf("%s/%s/Hypotezy/Chi kvadrat",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("hypothesis_testing/chi_square_independence_compute.Rmd"),name = "Intervaly_hypotezy6", stitle = sprintf("%s/%s/Hypotezy/Chi kvadrat vypocet",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("hypothesis_testing/error_type.Rmd"),name = "Intervaly_hypotezy7", stitle = sprintf("%s/%s/Hypotezy/Chyba I a II druhu",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("hypothesis_testing/hypothesis_testing.Rmd"),name = "Intervaly_hypotezy8", stitle = sprintf("%s/%s/Hypotezy/Testovani hypotez - obecne",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("hypothesis_testing/t_test.Rmd"),name = "Intervaly_hypotezy9", stitle = sprintf("%s/%s/Hypotezy/t-test",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("hypothesis_testing/tailedness.Rmd"),name = "Intervaly_hypotezy10", stitle = sprintf("%s/%s/Hypotezy/Jedno-dvoustranny test",bank_prefix,current_group),n = n_total, dir = out_dir)
exams2moodle(file = list("hypothesis_testing/z_test.Rmd"),name = "Intervaly_hypotezy11", stitle = sprintf("%s/%s/Hypotezy/z-test",bank_prefix,current_group),n = n_total, dir = out_dir)

clean_moodle_categories <- function(exam_dir, bank_root) {
  fs <- dir(exam_dir, full.names = T)
  for (i in 1:length(fs)) {
    f <- fs[i]
    txt <- read_file(f)
    txt <- str_replace(txt, sprintf("(<text>\\$course\\$)/.*/(%s)",bank_root),"\\1/\\2")
    write_file(txt, fs[i])
  }
}


clean_moodle_categories("generated_questions", "vsechny ulohy")

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


