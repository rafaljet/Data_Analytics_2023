data {
  int<lower=0> N;
  real<lower=0, upper=N> heights[N];
}

parameters {
  real<lower=0> mu;
  real<lower=0> sigma;
}

model {
  mu ~ normal(170, 15);
  sigma ~ exponential(0.067); #1/15
  heights ~ normal(mu, sigma);
}

generated quantities {
  real height = normal_rng(mu, sigma);
}