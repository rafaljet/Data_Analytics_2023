generated quantities {
  real<lower=0> mu=normal_rng(170,15);
  real<lower=0> sigma = exponential_rng(0.067);   #1/15
  real<lower=0> height=normal_rng(mu,sigma);
}