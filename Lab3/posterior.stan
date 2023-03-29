data {
  int<lower=0> N;
  int<lower=0, upper=N> y;
}

parameters {
  real<lower=0, upper=1> p;
}

model {
  p ~ beta(1, 4); 
  y ~ binomial(N, p);
}

generated quantities {
  int<lower=0, upper=N> y_pred;
  y_pred = binomial_rng(N, p);
}