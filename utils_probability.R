probability_binomial_setting <- function(n, k, pi_param, quantifier) {
  
    if (quantifier == "právě") {
      solution <- dbinom(k, n, pi_param)
      explanation <- sprintf("V tomto případě nás zajímá P(X=%d). Dosadíme do vzorce pro binomické rozdělení s parametry \\pi=%s, k=%d, n=%d. Pravděpodobnost je %.3f", k, pi_param, k, n, solution)
    } else if (quantifier == "alespoň") {
      solution <- 1 - (pbinom(k, n, pi_param) - dbinom(k, n, pi_param))
      explanation <- sprintf("V tomto případě nás zajímá P(X >= %d) = 1 - P(X < %d) = 1 - P(X <= %d). Dosadíme do vzorce pro binomické rozdělení s parametry \\pi=%s, k=%d, n=%d. Pravděpodobnost je %.3f", k, k, k - 1, pi_param, k, n, solution)
    } else if (quantifier == "nejvýše") {
      solution <- pbinom(k, n, pi_param)
      explanation <- sprintf("V tomto případě nás zajímá P(X <= %d). Dosadíme do vzorce pro binomické rozdělení s parametry \\pi=%s, k=%d, n=%d. Pravděpodobnost je %.3f", k, pi_param, k, n, solution)
    } else if (quantifier == "méně než") {
      solution <- pbinom(k - 1, n, pi_param)
      explanation <- sprintf("V tomto případě nás zajímá P(X < %d) = P(X <= %d). Dosadíme do vzorce pro binomické rozdělení s parametry \\pi=%s, k=%d, n=%d. Pravděpodobnost je %.3f", k, k - 1, pi_param, k, n, solution)
    } else if (quantifier == "více než") {
      solution <- 1 - pbinom(k, n, pi_param)
      explanation <- sprintf("V tomto případě nás zajímá P(X > %d) = 1 - P(X <= %d). Dosadíme do vzorce pro binomické rozdělení s parametry \\pi=%s, k=%d, n=%d. Pravděpodobnost je %.3f", k, k, pi_param, k, n, solution)
    } else {
      
      stop(sprintf("incorrect settings: k=%d, quantifier = '%s'",k, quantifier))
    }
  
  l <- list(solution = solution, explanation=explanation)
  l
}

probability_poisson_setting <- function(lambda, k, quantifier) {
  
  if (quantifier == "právě") {
    solution <- dpois(k, n)
    explanation <- sprintf("V tomto případě nás zajímá P(X=%d). Dosadíme do vzorce pro Poissonovo rozdělení s parametry \\lambda=%d, k=%d. Pravděpodobnost je %.3f", k, lambda, k, solution)
  } else if (quantifier == "alespoň") {
    solution <- 1 - (ppois(k, lambda) - dpois(k, lambda))
    explanation <- sprintf("V tomto případě nás zajímá P(X >= %d) = 1 - P(X < %d) = 1 - P(X <= %d). Dosadíme do vzorce pro Poissonovo rozdělení s parametry \\lambda=%d, k=%d. Pravděpodobnost je %.3f", k, k, k - 1, lambda, k, solution)
  } else if (quantifier == "nejvýše") {
    solution <- ppois(k, lambda)
    explanation <- sprintf("V tomto případě nás zajímá P(X <= %d). Dosadíme do vzorce pro Poissonovo rozdělení s parametry \\lambda=%d, k=%d. Pravděpodobnost je %.3f", k, lambda, k, solution)
  } else if (quantifier == "méně než") {
    solution <- ppois(k - 1, lambda)
    explanation <- sprintf("V tomto případě nás zajímá P(X < %d) = P(X <= %d). Dosadíme do vzorce pro Poissonovo rozdělení s parametry \\lambda=%d, k=%d. Pravděpodobnost je %.3f", k, k - 1, lambda, k, solution)
  } else if (quantifier == "více než") {
    solution <- 1 - ppois(k, lambda)
    explanation <- sprintf("V tomto případě nás zajímá P(X > %d) = 1 - P(X <= %d). Dosadíme do vzorce pro Poissonovo rozdělení s parametry \\lambda=%d, k=%d. Pravděpodobnost je %.3f", k, k, lambda, k, solution)
  } else {
    
    stop(sprintf("incorrect settings: k=%d, quantifier = '%s'",lambda, quantifier))
  }
  
  l <- list(solution = solution, explanation=explanation)
  l
}

get_prob_var <- function(distr_type, curr_theme = NULL){
  if(distr_type== "binomial") {
    df1_vars <- readxl::read_excel("D:/Documents/git/exams_vspj/data/input_data.xlsx",sheet = "probability_theme_binomial",na="NA")  
  } else if(distr_type== "poisson") {
    df1_vars <- readxl::read_excel("D:/Documents/git/exams_vspj/data/input_data.xlsx",sheet = "probability_theme_poisson",na="NA")  
    
  } else if(distr_type== "normal") {
    df1_vars <- readxl::read_excel("D:/Documents/git/exams_vspj/data/input_data.xlsx",sheet = "probability_theme_normal",na="NA")  
  }
  
  #df1_questions <- readxl::read_excel("data/input_data.xlsx",sheet = "questions")
  
  themes <- df1_vars %>% pull(group_theme) %>% unique()
  if(is.null(curr_theme)) {
    curr_theme <- sample(themes,1)  
  }
  
  
  df_vars <- df1_vars %>% filter(group_theme == curr_theme)
  df_all <- tibble(question = df_vars$test_question, 
                   var_desc = nest(df_vars, data = everything()))
  df_all
}