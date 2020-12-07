probability_binomial_setting <- function(n, k, pi_param, quantifier, language = "CZ") {
  pi_param <- round(pi_param,2)
  if(language == "CZ") {
    if (quantifier == "právě") {
      solution <- dbinom(k, n, pi_param)
      explanation <- sprintf("V tomto případě nás zajímá P(X=%d). Dosadíme do vzorce pro binomické rozdělení s parametry $\\pi$=%s, k=%d, n=%d. Pravděpodobnost je %.3f", k, pi_param, k, n, solution)
    } else if (quantifier == "alespoň") {
      solution <- 1 - (pbinom(k, n, pi_param) - dbinom(k, n, pi_param))
      explanation <- sprintf("V tomto případě nás zajímá P(X >= %d) = 1 - P(X < %d) = 1 - P(X <= %d). Dosadíme do vzorce pro binomické rozdělení s parametry $\\pi$=%s, k=%d, n=%d. Pravděpodobnost je %.3f", k, k, k - 1, pi_param, k, n, solution)
    } else if (quantifier == "nejvýše") {
      solution <- pbinom(k, n, pi_param)
      explanation <- sprintf("V tomto případě nás zajímá P(X <= %d). Dosadíme do vzorce pro binomické rozdělení s parametry $\\pi$=%s, k=%d, n=%d. Pravděpodobnost je %.3f", k, pi_param, k, n, solution)
    } else if (quantifier == "méně než") {
      solution <- pbinom(k - 1, n, pi_param)
      explanation <- sprintf("V tomto případě nás zajímá P(X < %d) = P(X <= %d). Dosadíme do vzorce pro binomické rozdělení s parametry $\\pi$=%s, k=%d, n=%d. Pravděpodobnost je %.3f", k, k - 1, pi_param, k, n, solution)
    } else if (quantifier == "více než") {
      solution <- 1 - pbinom(k, n, pi_param)
      explanation <- sprintf("V tomto případě nás zajímá P(X > %d) = 1 - P(X <= %d). Dosadíme do vzorce pro binomické rozdělení s parametry $\\pi$=%s, k=%d, n=%d. Pravděpodobnost je %.3f", k, k, pi_param, k, n, solution)
    } else {
      
      stop(sprintf("incorrect settings: k=%d, quantifier = '%s'",k, quantifier))
    }
    
  } else {
    if (quantifier == "just") {
      solution <- dbinom(k, n, pi_param)
      explanation <- sprintf("In this case we are interested in P(X=%d). We fill in the formula for binomial distribution with parameters $\\pi$=%s, k=%d, n=%d. Probability is %.3f", k, pi_param, k, n, solution)
    } else if (quantifier == "at least") {
      solution <- 1 - (pbinom(k, n, pi_param) - dbinom(k, n, pi_param))
      explanation <- sprintf("In this case we are interested in P(X >= %d) = 1 - P(X < %d) = 1 - P(X <= %d). We fill in the formula for binomial distribution with parameters $\\pi$=%s, k=%d, n=%d. Probability is %.3f", k, k, k - 1, pi_param, k, n, solution)
    } else if (quantifier == "at most") {
      solution <- pbinom(k, n, pi_param)
      explanation <- sprintf("In this case we are interested in P(X <= %d). We fill in the formula for binomial distribution with parameters $\\pi$=%s, k=%d, n=%d. Probability is %.3f", k, pi_param, k, n, solution)
    } else if (quantifier == "less than") {
      solution <- pbinom(k - 1, n, pi_param)
      explanation <- sprintf("In this case we are interested in P(X < %d) = P(X <= %d). We fill in the formula for binomial distribution with parameters $\\pi$=%s, k=%d, n=%d. Probability is %.3f", k, k - 1, pi_param, k, n, solution)
    } else if (quantifier == "more than") {
      solution <- 1 - pbinom(k, n, pi_param)
      explanation <- sprintf("In this case we are interested in P(X > %d) = 1 - P(X <= %d). We fill in the formula for binomial distribution with parameters $\\pi$=%s, k=%d, n=%d. Probability is %.3f", k, k, pi_param, k, n, solution)
    } else {
      
      stop(sprintf("incorrect settings: k=%d, quantifier = '%s'",k, quantifier))
    }
    
  }
  
  l <- list(solution = solution, explanation=explanation)
  l
}

probability_poisson_setting <- function(lambda, k, quantifier, language = "CZ") {
  if(language == "CZ") {
    if (quantifier == "právě") {
      solution <- dpois(k, lambda)
      explanation <- sprintf("V tomto případě nás zajímá P(X=%d). Dosadíme do vzorce pro Poissonovo rozdělení s parametry $\\lambda$=%d, k=%d. Pravděpodobnost je %.3f", k, lambda, k, solution)
    } else if (quantifier == "alespoň") {
      solution <- 1 - (ppois(k, lambda) - dpois(k, lambda))
      explanation <- sprintf("V tomto případě nás zajímá P(X >= %d) = 1 - P(X < %d) = 1 - P(X <= %d). Dosadíme do vzorce pro Poissonovo rozdělení s parametry $\\lambda$=%d, k=%d. Pravděpodobnost je %.3f", k, k, k - 1, lambda, k, solution)
    } else if (quantifier == "nejvýše") {
      solution <- ppois(k, lambda)
      explanation <- sprintf("V tomto případě nás zajímá P(X <= %d). Dosadíme do vzorce pro Poissonovo rozdělení s parametry $\\lambda$=%d, k=%d. Pravděpodobnost je %.3f", k, lambda, k, solution)
    } else if (quantifier == "méně než") {
      solution <- ppois(k - 1, lambda)
      explanation <- sprintf("V tomto případě nás zajímá P(X < %d) = P(X <= %d). Dosadíme do vzorce pro Poissonovo rozdělení s parametry $\\lambda$=%d, k=%d. Pravděpodobnost je %.3f", k, k - 1, lambda, k, solution)
    } else if (quantifier == "více než") {
      solution <- 1 - ppois(k, lambda)
      explanation <- sprintf("V tomto případě nás zajímá P(X > %d) = 1 - P(X <= %d). Dosadíme do vzorce pro Poissonovo rozdělení s parametry $\\lambda$=%d, k=%d. Pravděpodobnost je %.3f", k, k, lambda, k, solution)
    } else {
      
      stop(sprintf("incorrect settings: k=%d, quantifier = '%s'",lambda, quantifier))
    }
  } else {
    if (quantifier == "just") {
      solution <- dpois(k, lambda)
      explanation <- sprintf("In this case we are interested in P(X=%d). We fill in the formula for Poisson distribution with parameters $\\lambda$=%d, k=%d. Probability is %.3f", k, lambda, k, solution)
    } else if (quantifier == "at least") {
      solution <- 1 - (ppois(k, lambda) - dpois(k, lambda))
      explanation <- sprintf("In this case we are interested in P(X >= %d) = 1 - P(X < %d) = 1 - P(X <= %d). We fill in the formula for Poisson distribution with parameters $\\lambda$=%d, k=%d. Probability is %.3f", k, k, k - 1, lambda, k, solution)
    } else if (quantifier == "at most") {
      solution <- ppois(k, lambda)
      explanation <- sprintf("In this case we are interested in P(X <= %d). We fill in the formula for Poisson distribution with parameters $\\lambda$=%d, k=%d. Probability is %.3f", k, lambda, k, solution)
    } else if (quantifier == "less than") {
      solution <- ppois(k - 1, lambda)
      explanation <- sprintf("In this case we are interested in P(X < %d) = P(X <= %d). We fill in the formula for Poisson distribution with parameters $\\lambda$=%d, k=%d. Probability is %.3f", k, k - 1, lambda, k, solution)
    } else if (quantifier == "more than") {
      solution <- 1 - ppois(k, lambda)
      explanation <- sprintf("In this case we are interested in P(X > %d) = 1 - P(X <= %d). We fill in the formula for Poisson distribution with parameters $\\lambda$=%d, k=%d. Probability is %.3f", k, k, lambda, k, solution)
    } else {
      
      stop(sprintf("incorrect settings: k=%d, quantifier = '%s'",lambda, quantifier))
    }
  }
  
  l <- list(solution = solution, explanation=explanation)
  l
}


probability_normal_setting <- function(k, mu_param, sigma_param, quantifier, language = "CZ") {
  if(language == "CZ") {
    if (quantifier == "alespoň") {
      solution <- 1 - (pnorm(k, mu_param, sigma_param))
      explanation <- sprintf("V tomto případě nás zajímá P(X >= %d) = 1 - F(%d). Dosadíme do vzorce pro normální rozdělení s parametry $\\mu$=%d, $\\sigma$=%d,  k=%d. Pravděpodobnost je %.3f", k, k, mu_param, sigma_param, k, solution)
    } else if (quantifier == "nejvýše") {
      solution <- pnorm(k, mu_param, sigma_param)
      explanation <- sprintf("V tomto případě nás zajímá P(X <= %d) = F(%d). Dosadíme do vzorce pro normální rozdělení s parametry $\\mu$=%d, $\\sigma$=%d,  k=%d. Pravděpodobnost je %.3f", k, k, mu_param, sigma_param, k, solution)
    } else if (quantifier == "méně než") {
      solution <- pnorm(k, mu_param, sigma_param)
      explanation <- sprintf("V tomto případě nás zajímá P(X < %d) = F(%d). Dosadíme do vzorce pro normální rozdělení s parametry $\\mu$=%d, $\\sigma$=%d,  k=%d. Pravděpodobnost je %.3f", k, k, mu_param, sigma_param, k, solution)
    } else if (quantifier == "více než") {
      solution <- 1 - pnorm(k, mu_param, sigma_param)
      explanation <- sprintf("V tomto případě nás zajímá P(X > %d) = 1 - F(X%d). Dosadíme do vzorce pro normální rozdělení s parametry $\\mu$=%d, $\\sigma$=%d,  k=%d. Pravděpodobnost je %.3f", k, k, mu_param, sigma_param, k, solution)
    } else {
      
      stop(sprintf("incorrect settings: k=%d, quantifier = '%s'",k, quantifier))
    }
  } else {
    if (quantifier == "at least") {
      solution <- 1 - (pnorm(k, mu_param, sigma_param))
      explanation <- sprintf("In this case we are interested in P(X >= %d) = 1 - F(%d). We fill in the formula for normal distribution with parameters $\\mu$=%d, $\\sigma$=%d,  k=%d. Probability is %.3f", k, k, mu_param, sigma_param, k, solution)
    } else if (quantifier == "at most") {
      solution <- pnorm(k, mu_param, sigma_param)
      explanation <- sprintf("In this case we are interested in P(X <= %d) = F(%d). We fill in the formula for normal distribution with parameters $\\mu$=%d, $\\sigma$=%d,  k=%d. Probability is %.3f", k, k, mu_param, sigma_param, k, solution)
    } else if (quantifier == "less than") {
      solution <- pnorm(k, mu_param, sigma_param)
      explanation <- sprintf("In this case we are interested in P(X < %d) = F(%d). We fill in the formula for normal distribution with parameters $\\mu$=%d, $\\sigma$=%d,  k=%d. Probability is %.3f", k, k, mu_param, sigma_param, k, solution)
    } else if (quantifier == "more than") {
      solution <- 1 - pnorm(k, mu_param, sigma_param)
      explanation <- sprintf("In this case we are interested in P(X > %d) = 1 - F(X%d). We fill in the formula for normal distribution with parameters $\\mu$=%d, $\\sigma$=%d,  k=%d. Probability is %.3f", k, k, mu_param, sigma_param, k, solution)
    } else {
      
      stop(sprintf("incorrect settings: k=%d, quantifier = '%s'",k, quantifier))
    }
  }
  
  l <- list(solution = solution, explanation=explanation)
  l
}

probability_normal_setting_range <- function(k_lower, k_upper, mu_param, sigma_param, language = "CZ") {
  
  
  solution <- pnorm(k_upper, mu_param, sigma_param) - pnorm(k_lower, mu_param, sigma_param)
  if(language == "CZ") {
    explanation <- sprintf("Máme-li v zadání rozsah hodnot, použijeme vzorec P(X > větší hodnota) - P(X < menší hodnota). V tomto případě tedy použijeme P(X > %d) - P(X < %d) = F(%d) - F(%d). Dosadíme do vzorce pro normální rozdělení s parametry $\\mu$=%d, $\\sigma$=%d,  k=%d a k=%d. Pravděpodobnost je %.3f", k_upper, k_lower, k_upper, k_lower, mu_param, sigma_param, k_lower, k_upper, solution)  
  } else {
    explanation <- sprintf("When we have a range in the task description, we used the formula P(X > larger value) - P(X < smaller value). In this case we are interested in P(X > %d) - P(X < %d) = F(%d) - F(%d). We fill in the formula for normal distribution with parameters $\\mu$=%d, $\\sigma$=%d,  k=%d and k=%d. Probability is %.3f", k_upper, k_lower, k_upper, k_lower, mu_param, sigma_param, k_lower, k_upper, solution)  
  }
  
  
  l <- list(solution = solution, explanation=explanation)
  l
}

probability_normal_setting_perc <- function(perc, mu_param, sigma_param, direction, language = "CZ") {
  
  if(direction == "lower") {
    solution <- qnorm(perc, mu_param, sigma_param)
    if(language == "CZ") {
      explanation <- sprintf("V této inverzní úloze máme zadanou pravděpodobnost p a zajímá nás hodnota k, pro kterou platí P(X < k) = p. K tomuto se dá použít funkce NORM.INV. V tomto případě pro parametery $\\mu$=%d, $\\sigma$=%d,  p=%.2f. Daná hodnota je %.3f", mu_param, sigma_param, perc, solution)  
    } else {
      explanation <- sprintf("In this inverse task, we have probability p and we are interested in value k, for which following holds P(X < k) = p. We can use NORM.INV formula for that. In that case with parameters $\\mu$=%d, $\\sigma$=%d,  p=%.2f. Given value is %.3f", mu_param, sigma_param, perc, solution)  
    }
    
    
  } else if(direction == "higher"){ 
    solution <- qnorm(1-perc, mu_param, sigma_param)
    if(language == "CZ") {
      explanation <- sprintf("V této inverzní úloze máme zadanou pravděpodobnost p a zajímá nás hodnota k, pro kterou platí P(X > k) = 1 - P(X <= k) = p. K tomuto se dá použít funkce NORM.INV. V tomto případě pro parametery $\\mu$=%d, $\\sigma$=%d,  p=%.2f. Daná hodnota je %.3f", mu_param, sigma_param, perc, solution)
    } else {
      explanation <- sprintf("In this inverse task, we have probability p and we are interested in value k, for which following holds P(X > k) = = 1 - P(X <= k) = p. We can use NORM.INV formula for that. In that case with parameters $\\mu$=%d, $\\sigma$=%d,  p=%.2f. Given value is %.3f", mu_param, sigma_param, perc, solution)  
    }
  
  } else {
    stop(sprintf("incorrect settings: direction = '%s'",direction))
  }
  
  
  l <- list(solution = solution, explanation=explanation)
  l
}

probability_normal_setting_sum <- function(k, n, mu_param, sigma_param, quantifier, language = "CZ") {
  if(language == "CZ") {
    if (quantifier == "alespoň") {
      solution <- 1 - (pnorm(k, mu_param*n, sigma_param*n))
      explanation <- sprintf("Pro sumu normálních rozdělení platí, že $\\mu_{sum} = n*\\mu$ a $\\sigma_{sum} = n*\\sigma$. 
                         V tomto případě nás zajímá P(X >= %d) = 1 - F(%d). 
                         Dosadíme do vzorce pro normální rozdělení s parametry $\\mu$=%d, $\\sigma$=%d,  k=%d. 
                         Pravděpodobnost je %.3f", k, k, n*mu_param, n*sigma_param, k, solution)
    } else if (quantifier == "nejvýše") {
      solution <- pnorm(k, mu_param*n, sigma_param*n)
      explanation <- sprintf("Pro sumu normálních rozdělení platí, že $\\mu_{sum} = n*\\mu$ a $\\sigma_{sum} = n*\\sigma$. 
                         V tomto případě nás zajímá P(X <= %d) = F(%d). 
                         Dosadíme do vzorce pro normální rozdělení s parametry $\\mu$=%d, $\\sigma$=%d,  k=%d. 
                         Pravděpodobnost je %.3f", k, k, n*mu_param, n*sigma_param, k, solution)
    } else if (quantifier == "méně než") {
      solution <- pnorm(k, mu_param*n, sigma_param*n)
      explanation <- sprintf("Pro sumu normálních rozdělení platí, že $\\mu_{sum} = n*\\mu$ a $\\sigma_{sum} = n*\\sigma$. 
                         V tomto případě nás zajímá P(X < %d) = F(%d). 
                         Dosadíme do vzorce pro normální rozdělení s parametry $\\mu$=%d, $\\sigma$=%d,  k=%d. 
                         Pravděpodobnost je %.3f", k, k, n*mu_param, n*sigma_param, k, solution)
    } else if (quantifier == "více než") {
      solution <- 1 - pnorm(k, mu_param*n, sigma_param*n)
      explanation <- sprintf("Pro sumu normálních rozdělení platí, že $\\mu_{sum} = n*\\mu$ a $\\sigma_{sum} = n*\\sigma$. 
                         V tomto případě nás zajímá P(X < %d) = F(%d). 
                         Dosadíme do vzorce pro normální rozdělení s parametry $\\mu$=%d, $\\sigma$=%d,  k=%d. 
                         Pravděpodobnost je %.3f", k, k, n*mu_param, n*sigma_param, k, solution)
    } else {
      
      stop(sprintf("incorrect settings: k=%d, quantifier = '%s'",k, quantifier))
    }  
  } else {
    if (quantifier == "at least") {
      solution <- 1 - (pnorm(k, mu_param*n, sigma_param*n))
      explanation <- sprintf("Following holds for sum of normal distributions $\\mu_{sum} = n*\\mu$ and $\\sigma_{sum} = n*\\sigma$. 
                         In this case we are interested in P(X >= %d) = 1 - F(%d). 
                         We fill in the formula for normal distribution with parameters $\\mu$=%d, $\\sigma$=%d,  k=%d. 
                         Probability is %.3f", k, k, n*mu_param, n*sigma_param, k, solution)
    } else if (quantifier == "at most") {
      solution <- pnorm(k, mu_param*n, sigma_param*n)
      explanation <- sprintf("Following holds for sum of normal distributions $\\mu_{sum} = n*\\mu$ and $\\sigma_{sum} = n*\\sigma$. 
                         In this case we are interested in P(X <= %d) = F(%d). 
                         We fill in the formula for normal distribution with parameters $\\mu$=%d, $\\sigma$=%d,  k=%d. 
                         Probability is %.3f", k, k, n*mu_param, n*sigma_param, k, solution)
    } else if (quantifier == "less than") {
      solution <- pnorm(k, mu_param*n, sigma_param*n)
      explanation <- sprintf("Following holds for sum of normal distributions $\\mu_{sum} = n*\\mu$ and $\\sigma_{sum} = n*\\sigma$. 
                         In this case we are interested in P(X < %d) = F(%d). 
                         We fill in the formula for normal distribution with parameters $\\mu$=%d, $\\sigma$=%d,  k=%d. 
                         Probability is %.3f", k, k, n*mu_param, n*sigma_param, k, solution)
    } else if (quantifier == "more than") {
      solution <- 1 - pnorm(k, mu_param*n, sigma_param*n)
      explanation <- sprintf("Following holds for sum of normal distributions $\\mu_{sum} = n*\\mu$ and $\\sigma_{sum} = n*\\sigma$. 
                         In this case we are interested in P(X < %d) = F(%d). 
                         We fill in the formula for normal distribution with parameters $\\mu$=%d, $\\sigma$=%d,  k=%d. 
                         Probability is %.3f", k, k, n*mu_param, n*sigma_param, k, solution)
    } else {
      
      stop(sprintf("incorrect settings: k=%d, quantifier = '%s'",k, quantifier))
    }
  }
  
  
  l <- list(solution = solution, explanation=explanation)
  l
}

probability_normal_setting_mean <- function(k, n, mu_param, sigma_param, quantifier, language = "CZ") {
  if(language == "CZ") {
    if (quantifier == "alespoň") {
      solution <- 1 - (pnorm(k, mu_param, sigma_param/n))
      explanation <- sprintf("Pro průměr normálních rozdělení platí, že $\\mu_{mean} = \\mu$ a $\\sigma_{sum} = \\sigma/n$. 
                         V tomto případě nás zajímá P(X >= %d) = 1 - F(%d). 
                         Dosadíme do vzorce pro normální rozdělení s parametry $\\mu$=%d, $\\sigma$=%d/%d,  k=%d. 
                         Pravděpodobnost je %.3f", k, k, mu_param, sigma_param,n, k, solution)
    } else if (quantifier == "nejvýše") {
      solution <- pnorm(k, mu_param, sigma_param/n)
      explanation <- sprintf("Pro průměr normálních rozdělení platí, že $\\mu_{mean} = \\mu$ a $\\sigma_{sum} = \\sigma/n$. 
                         V tomto případě nás zajímá P(X <= %d) = F(%d). 
                         Dosadíme do vzorce pro normální rozdělení s parametry $\\mu$=%d, $\\sigma$=%d/%d,  k=%d. 
                         Pravděpodobnost je %.3f", k, k, mu_param, sigma_param,n, k, solution)
    } else if (quantifier == "méně než") {
      solution <- pnorm(k, mu_param, sigma_param/n)
      explanation <- sprintf("Pro průměr normálních rozdělení platí, že $\\mu_{mean} = \\mu$ a $\\sigma_{sum} = \\sigma/n$. 
                         V tomto případě nás zajímá P(X < %d) = F(%d). 
                         Dosadíme do vzorce pro normální rozdělení s parametry $\\mu$=%d, $\\sigma$=%d/%d,  k=%d. 
                         Pravděpodobnost je %.3f", k, k, mu_param, sigma_param,n, k, solution)
    } else if (quantifier == "více než") {
      solution <- 1 - pnorm(k, mu_param, sigma_param/n)
      explanation <- sprintf("Pro průměr normálních rozdělení platí, že $\\mu_{mean} = \\mu$ a $\\sigma_{sum} = \\sigma/n$. 
                         V tomto případě nás zajímá P(X < %d) = F(%d). 
                         Dosadíme do vzorce pro normální rozdělení s parametry $\\mu$=%d, $\\sigma$=%d/%d,  k=%d. 
                         Pravděpodobnost je %.3f", k, k, mu_param, sigma_param,n, k, solution)
    } else {
      
      stop(sprintf("incorrect settings: k=%d, quantifier = '%s'",k, quantifier))
    }
  } else {
    if (quantifier == "at least") {
      solution <- 1 - (pnorm(k, mu_param, sigma_param/n))
      explanation <- sprintf("Following holds for the mean of normal distributions $\\mu_{mean} = \\mu$ a $\\sigma_{sum} = \\sigma/n$. 
                          In this case we are interested in P(X >= %d) = 1 - F(%d). 
                         We fill in the formula for normal distribution with parameters $\\mu$=%d, $\\sigma$=%d/%d,  k=%d. 
                         Probability is %.3f", k, k, mu_param, sigma_param,n, k, solution)
    } else if (quantifier == "at most") {
      solution <- pnorm(k, mu_param, sigma_param/n)
      explanation <- sprintf("Following holds for the mean of normal distributions $\\mu_{mean} = \\mu$ a $\\sigma_{sum} = \\sigma/n$. 
                          In this case we are interested in P(X <= %d) = F(%d). 
                         We fill in the formula for normal distribution with parameters $\\mu$=%d, $\\sigma$=%d/%d,  k=%d. 
                         Probability is %.3f", k, k, mu_param, sigma_param,n, k, solution)
    } else if (quantifier == "less than") {
      solution <- pnorm(k, mu_param, sigma_param/n)
      explanation <- sprintf("Following holds for the mean of normal distributions $\\mu_{mean} = \\mu$ a $\\sigma_{sum} = \\sigma/n$. 
                          In this case we are interested in P(X < %d) = F(%d). 
                         We fill in the formula for normal distribution with parameters $\\mu$=%d, $\\sigma$=%d/%d,  k=%d. 
                         Probability is %.3f", k, k, mu_param, sigma_param,n, k, solution)
    } else if (quantifier == "more than") {
      solution <- 1 - pnorm(k, mu_param, sigma_param/n)
      explanation <- sprintf("Following holds for the mean of normal distributions $\\mu_{mean} = \\mu$ a $\\sigma_{sum} = \\sigma/n$. 
                          In this case we are interested in P(X < %d) = F(%d). 
                         We fill in the formula for normal distribution with parameters $\\mu$=%d, $\\sigma$=%d/%d,  k=%d. 
                         Probability is %.3f", k, k, mu_param, sigma_param,n, k, solution)
    } else {
      
      stop(sprintf("incorrect settings: k=%d, quantifier = '%s'",k, quantifier))
    }
  }
  l <- list(solution = solution, explanation=explanation)
  l
}

get_prob_var <- function(distr_type, curr_theme = NULL, norm_type = NULL, language = "CZ"){
  if(distr_type== "binomial") {
    curr_sheet <- "probability_theme_binomial"
  } else if(distr_type== "poisson") {
    curr_sheet <- "probability_theme_poisson"
    
  } else if(distr_type== "normal") {
    curr_sheet <- "probability_theme_normal"
  } else {
    stop("Unknown distribution type")
  }
  
  if(language == "CZ") {
    df1_vars <- readxl::read_excel("D:/Documents/git/exams_vspj/data/input_data.xlsx",sheet = curr_sheet,na="NA")  
  } else {
    df1_vars <- readxl::read_excel("D:/Documents/git/exams_vspj/data/input_data_eng.xlsx",sheet = curr_sheet,na="NA")  
  }
  
  #df1_questions <- readxl::read_excel("data/input_data.xlsx",sheet = "questions")
  
  
  if(is.null(norm_type)) {
    norm_type <- "all"
  } else {
    norm_type <- c("all", norm_type)
  }
  
  if (distr_type == "normal") {
    themes <- df1_vars %>% filter(question_type %in% norm_type) %>% pull(group_theme) %>% unique()
    if(is.null(curr_theme)) {
      curr_theme <- sample(themes,1)  
    }
    
  } else {
    themes <- df1_vars %>% pull(group_theme) %>% unique()
    if(is.null(curr_theme)) {
      curr_theme <- sample(themes,1)  
    }
    
  }
  
  
  if (distr_type == "normal") {
    df_vars <- df1_vars %>% filter(group_theme == curr_theme)  
    df_all <- tibble(settings = df_vars$text_settings, 
                     question = df_vars$text_question,
                     question_range = df_vars$text_question_range,
                     question_perc = df_vars$text_question_perc,
                     question_sum = df_vars$text_question_sum,
                     question_mean = df_vars$text_question_mean,
                     var_desc = nest(df_vars, data = everything()))
  } else {
    df_vars <- df1_vars %>% filter(group_theme == curr_theme)
    df_all <- tibble(settings = df_vars$text_settings, 
                     question = df_vars$text_question,
                     var_desc = nest(df_vars, data = everything()))
  }
  df_all
}