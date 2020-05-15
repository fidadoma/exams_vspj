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

get_var_desc <- function() {
  tibble(name = c("příjmy","výdaje","pohlaví","oblíbené zvíře","počet bodů v testu", "studijní průměr na VŠ"),
         type = c("numeric","numeric","factor","factor","numeric","numeric"),
         values = c("10000-100000","1000-40000","muž|žena|jiné","kočka|pes","0-40","1-3"),
         pdist = c("unif","norm","unif","unif","norm","norm"))
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