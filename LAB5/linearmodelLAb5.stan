data {
  int<lower=0> N;          // number of years
  vector[N] ni;            // amount of flying in each year
  vector[N] yi;            // number of accidents in each year
}
parameters {
  real alfa;               // intercept parameter
  real<lower=0> sigma;     // parameter for the miles flown
}
model {
  vector[N] lambda;        // Poisson parameter for each year
  for (i in 1:N) {
    lambda[i] = exp(alfa + sigma * ni[i]);  // log link function
    yi[i] ~ poisson(lambda[i]);            // Poisson likelihood
  }
  // priors
  alfa ~ normal(0, 10);    // weakly informative prior for intercept
  sigma ~ normal(0, 1);    // weakly informative prior for miles flown parameter
}


generated quantities {
  vector[N] lambda_prior;
  vector[N] y_prior;
  for (i in 1:N) {
    lambda_prior[i] = exp(alfa + sigma * ni[i]);
    y_prior[i] = poisson_rng(lambda_prior[i]);
  }
}