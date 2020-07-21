
# setup -------------------------------------------------------------------


knitr::opts_chunk$set(fig.cap = '')
knitr::opts_chunk$set(echo=F)

library(tidyverse)
library(ggthemes)
library(patchwork)
source("D:/Documents/git/exams_vspj/utils.R")
source("D:/Documents/git/exams_vspj/utils_probability.R", encoding = "utf-8")

theme_ix <- sample(1:6,1)

if(theme_ix == 1) {
  #possible_themes <- c("theme_bw","theme_dark","theme_minimal","theme_economist")
  
  #curr_theme <- sample(possible_themes,1)
  theme_set(theme_bw())
  
} else if(theme_ix == 2){
  theme_set(theme_dark())
} else if(theme_ix == 3){
  theme_set(theme_minimal())
} else if(theme_ix == 4){
  theme_set(theme_excel())
} else if(theme_ix == 5){
  theme_set(theme_wsj())
} else {
  theme_set(theme_economist())
}

# load_vars ---------------------------------------------------------------



