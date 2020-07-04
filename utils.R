extract_ranges <- function(df_var) {
  r <-str_split(df_var$values, 
                pattern = "-", 
                simplify = T) %>% 
    as.numeric()  
  matrix(r, ncol = nrow(df_var))
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

generate_contingency_table <- function(n, r, x_lev, y_lev) {
  
  df <- generate_correlated_data(n,r)
  colnames(df) <- c("x","y")
  
  x <- df[,1]
  range_x <- range(x)
  x_cutoffs <- runif(x_lev-1, min=range_x[1], max=range_x[2]) %>% sort()
  x_categ <- rowSums(matrix(rep(x, x_lev-1), ncol = x_lev-1) >x_cutoffs)
  
  m1 <- table(x_categ)
  m_out <- matrix(NA, ncol = x_lev, nrow = y_lev)
  df2 <- df %>% as_tibble() %>% mutate(x_categ = x_categ)
  for (i in 1:length(m1)) {
    y <- df2 %>% filter(x_categ == (i-1)) %>% pull(y)
    range_y <- range(y)
    y_cutoffs <- runif(y_lev-1, min=range_y[1], max=range_y[2]) %>% sort()
    m2 <- table(rowSums(matrix(rep(y, y_lev-1), ncol = y_lev-1) >y_cutoffs))
    m_out[,i] <- m2                    
  }
  m_out
  
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

lower_quartile <- function(x) {
  quantile(x,probs = 0.25)
}

upper_quartile <- function(x) {
  quantile(x,probs = 0.75)
}