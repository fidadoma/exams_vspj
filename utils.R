extract_ranges <- function(df_var) {
  r <-str_split(df_var$values, 
                pattern = "-", 
                simplify = T) %>% 
    as.numeric()  
  m <- matrix(r, nrow = nrow(df_var))
  colnames(m) <- c("lower","upper")
  m
}

extract_ranges_vec <- function(v) {
  r <-str_split(v, 
                pattern = "-", 
                simplify = T) %>% 
    as.numeric()  
  r
}


extract_values <- function(df_var) {
  r <-str_split(df_var$values, 
                pattern = "\\|", 
                simplify = T)
  matrix(r, ncol = nrow(df_var))
}

get_factor_levels <- function(v) {
  str_split(v,"\\|", simplify = T) %>% c()
}

get_n_factor_levels <- function(v) {
  str_split(v,"\\|", simplify = T) %>% length()
}

compute_mean <- function(v,pdist) {
  ranges <- extract_ranges_vec(v)
  if(pdist == "unif") {
    a <- ranges[1]
    b <- ranges[2]
    return((a+b)/2)
  } else if(pdist == "norm"){
    low <- ranges[1]
    high <- ranges[2]
    return((low+high)/2)
  }
}

get_var_desc <- function(curr_theme = NULL, language = "CZ") {
  if(language == "CZ") {
    df1_vars <- readxl::read_excel("D:/Documents/git/exams_vspj/data/input_data.xlsx",sheet = "variables",na="NA")
    df1_questions <- readxl::read_excel("D:/Documents/git/exams_vspj/data/input_data.xlsx",sheet = "questions")
  } else {
    df1_vars <- readxl::read_excel("D:/Documents/git/exams_vspj/data/input_data_eng.xlsx",sheet = "variables",na="NA")
    df1_questions <- readxl::read_excel("D:/Documents/git/exams_vspj/data/input_data_eng.xlsx",sheet = "questions")
  }
  
  themes <- df1_vars %>% filter(exam_type=="all") %>% pull(group_theme) %>% unique()
  if(is.null(curr_theme)) {
    curr_theme <- sample(themes,1)  
  }
  
  
  df_vars <- df1_vars %>% filter(group_theme == curr_theme)
  df_questions <- df1_questions %>% filter(group_theme == curr_theme) %>% sample_n(1)
  df_all <- tibble(question = df_questions$test_questions, 
                   var_desc = nest(df_vars, data = everything()),
                   group1 = df_questions$group1,
                   group2 = df_questions$group2)
  df_all
}

generate_correlated_data <- function(n,r) {
  MASS::mvrnorm(n=n, mu=c(0, 0), Sigma=matrix(c(1, r, r, 1), nrow=2), empirical=TRUE)
}

generate_flat_ctable <- function(n, r, x_fac, y_fac) { 
  df <- generate_correlated_data(n,r)
  
  x <- df[,1]
  range_x <- range(x)
  cutoffs_x <- seq(range_x[1],range_x[2],length.out = length(x_fac)+1)
  cutoffs_x <- cutoffs_x[2:(length(cutoffs_x)-1)]
  x_categ <- rowSums(matrix(rep(x, length(x_fac)-1), ncol = length(x_fac)-1) >cutoffs_x)
  
  
  y <- df[,2]
  range_y <- range(y)
  cutoffs_y <- seq(range_y[1],range_y[2],length.out = length(y_fac)+1)
  cutoffs_y <- cutoffs_y[2:(length(cutoffs_y)-1)]
  y_categ <- rowSums(matrix(rep(y, length(y_fac)-1), ncol = length(y_fac)-1) >cutoffs_y)
  
  x_lev <- seq(0,(length(x_fac)-1))
  y_lev <- seq(0,(length(y_fac)-1))
  
  df <- tibble(x_categ = recode(x_categ, !!!setNames(x_fac, x_lev)),
               y_categ = recode(y_categ, !!!setNames(y_fac, y_lev))) %>% 
    mutate(x_categ = factor(x_categ, levels = x_fac),
           y_categ = factor(y_categ, levels = y_fac))
  
  df
}

generate_contingency_table <- function(n, r, x_lev, y_lev) {
  df <- generate_flat_ctable(n,r,x_lev,y_lev)
  xtabs(~x_categ+y_categ,df)
}

compute_sd <- function(v,pdist) {
  ranges <- extract_ranges_vec(v)
  if(pdist == "unif") {
    a <- ranges[1]
    b <- ranges[2]
    return(sqrt(((a+b)^2)/12))
  } else if(pdist == "norm"){
    a <- ranges[1]
    b <- ranges[2]
    return((b-a)/6)
  }
}

pearson_cont_coef <- function(chi_sq, n, r,s) {
  return(sqrt(chi_sq/(chi_sq + n)))
}

cramer_cont_coef <- function(chi_sq, n, r,s) {
  return(sqrt(chi_sq/(n*min(r-1,s-1))))
}
cuporev_cont_coef <- function(chi_sq, n, r,s) {
  return(sqrt(chi_sq/(n*sqrt((r-1)*(s-1)))))
}
rescale_var <- function(x, m, sd) {
  as.numeric(scale(x)*sd+m)
}

rescale_var_range <- function(x, old_min, old_max, new_min, new_max) {
  return ((new_max - new_min) * (x - old_min) / (old_max - old_min) + new_min)
}

check_var <- function(x,x_lower,x_upper) {
  all(x>=x_lower&x<=x_upper)
  
}


lower_quartile <- function(x) {
  quantile(x,probs = 0.25)
}

upper_quartile <- function(x) {
  quantile(x,probs = 0.75)
}

sample_vars <- function(df_vardesc, var_type = "numeric", nvar = 2) {
  df_currvar <- 
    df_vardesc %>% 
      filter(type == var_type) %>% 
      sample_n(nvar)
  if(var_type == "numeric") {
    df_currvar <- df_currvar %>% 
      rowwise() %>% 
      mutate(mean = compute_mean(values, pdist), 
             sd = compute_sd(values,pdist))
  }
  df_currvar
}

standardize_value <- function(x) {
  # we need to convert data to z-scores
  x <- scale(x)  # standard normal (mu=0, sd=1)
  if(length(x) < 50) {
    n_max <- 4
  } else {
    n_max <- 4
  }
  if(max(x) > n_max) {
    x[x>n_max] <- n_max
  } 
  if (min(x) < -n_max) {
    x[x< -n_max] <- -n_max  
  }
  x
  
  
}

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

safe_generate_correlated_data <- function(n, r, df_currvars) {
  stopifnot(nrow(df_currvars)==2)
  var_ranges <- extract_ranges(df_currvars)
  x_lower <- var_ranges[1,1]
  x_upper <- var_ranges[1,2]
  y_lower <- var_ranges[2,1]
  y_upper <- var_ranges[2,2]
  should_continue <- T
  n_try <- 0
  
  while (should_continue) {
    n_try <- n_try+1
    if(n_try > 99) {
      stop("Impossible to generate, check the variables")
    }
    
    df <- generate_correlated_data(n,r)
    
    X <- standardize_value(df[, 1])
    Y <- standardize_value(df[, 2])
    
    X <- rescale_var_range(X, old_min=-4, old_max=4, new_min=x_lower, new_max = x_upper) %>% as.numeric() %>% round(df_currvars$round_val[1])
    Y <- rescale_var_range(Y, old_min=-4, old_max=4, new_min=y_lower, new_max = y_upper) %>% as.numeric() %>% round(df_currvars$round_val[2])
    
    should_continue <- !(check_var(X, x_lower,x_upper) & check_var(Y, y_lower,y_upper))
  }
  df_data <- tibble(!!df_currvars$name[1]:=X,!!df_currvars$name[2]:=Y) 
  df_data
}

safe_generate_data <- function(n, df_currvars) {
  stopifnot(nrow(df)==1)
  var_ranges <- extract_ranges(df_currvars)
  x_lower <- var_ranges[1,1]
  x_upper <- var_ranges[1,2]
  should_continue <- T
  n_try <- 0
  
  while (should_continue) {
    n_try <- n_try+1
    if(n_try > 99) {
      stop("Impossible to generate, check the variables")
    }
    
    if(df_currvars$pdist == "norm") {
      X <- rnorm(n)  
    } else if(df_currvars$pdist == "unif") {
      X <- runif(n)  
    }
    
    X <- df[, 1]  
    
    X <- rescale_var(X,df_currvars$mean[1],df_currvars$sd[1]) %>% round(df_currvars$round_val[1])
    
    should_continue <- !(check_var(X, x_lower,x_upper))
  }
  df_data <- tibble(!!df_currvars$name[1]:=X) 
  df_data

}