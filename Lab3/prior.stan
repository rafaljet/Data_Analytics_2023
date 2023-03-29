generated quantities {
  int<lower=0> N = 50;
  int<lower=0, upper=N> y;
  real<lower=0, upper=1> p;
  
  p = beta_rng(1, 4); 
  y = binomial_rng(N, p);
}