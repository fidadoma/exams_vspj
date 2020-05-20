extract_ranges <- function(df_var) {
  r <-str_split(df_var$values, 
                pattern = "-", 
                simplify = T) %>% 
    as.numeric()  
  m <- matrix(r, ncol = nrow(df_var))
  colnames(m) <- c("lower","upper")
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

get_var_desc <- function(curr_theme = NULL) {
  df1_vars <- readxl::read_excel("D:/Documents/git/exams_vspj/data/input_data.xlsx",sheet = "variables",na="NA")
  df1_questions <- readxl::read_excel("D:/Documents/git/exams_vspj/data/input_data.xlsx",sheet = "questions")
  
  themes <- df1_vars %>% filter(exam_type=="all") %>% pull(group_theme) %>% unique()
  if(is.null(curr_theme)) {
    curr_theme <- sample(themes,1)  
  }
  
  
  df_vars <- df1_vars %>% filter(group_theme == curr_theme)
  df_questions <- df1_questions %>% filter(group_theme == curr_theme) %>% sample_n(1)
  df_all <- tibble(question = df_questions$test_questions, 
                   var_desc = nest(df_vars, data = everything()))
  df_all
}

generate_correlated_data <- function(n,r) {
  MASS::mvrnorm(n=n, mu=c(0, 0), Sigma=matrix(c(1, r, r, 1), nrow=2), empirical=TRUE)
}

compute_sd <- function(v,pdist) {
  ranges <- extract_ranges_vec(v)
  if(pdist == "unif") {
    a <- ranges[1]
    b <- ranges[2]
    return(sqrt((a+b)^2/12))
  } else if(pdist == "norm"){
    a <- ranges[1]
    b <- ranges[2]
    return((b-a)/6)
  }
}

rescale_var <- function(x, m, sd) {
  as.numeric(scale(x)*sd+m)
}

check_var <- function(x,x_lower,x_upper) {
  x>=x_lower&x<=x_upper
  
}

sample_vars <- function(df_vardesc, var_type = "numeric", nvar = 2) {
  df_vardesc %>% 
    filter(type == var_type) %>% 
    sample_n(nvar) %>% 
    rowwise() %>% 
    mutate(mean = compute_mean(values, pdist), 
           sd = compute_sd(values,pdist))
}

safe_generate_correlated_data <- function(n, r, var_ranges) {
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
    
    X <- df[, 1]  # standard normal (mu=0, sd=1)
    Y <- df[, 2]  # standard normal (mu=0, sd=1)
    
    
    X <- rescale_var(X,df_currvars$mean[1],df_currvars$sd[1]) %>% round(df_currvars$round_val[1])
    Y <- rescale_var(Y,df_currvars$mean[2],df_currvars$sd[2]) %>% round(df_currvars$round_val[2])
    should_continue <- !(check_var(X, x_lower,x_upper) & check_var(Y, y_lower,y_upper))
  }
  df_data <- tibble(!!df_currvars$name[1]:=X,!!df_currvars$name[2]:=Y) 
  
}