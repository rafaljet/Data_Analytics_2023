data{
  int <lower=0> N;
  real weight[N];
}

generated quantities {
  real alfaa =normal_rng(170,15);
  real betaa =lognormal_rng(0,1);
  real<lower=0> sigma=exponential_rng(0.067);
  real height[N];

  for (i in 1:N){
    height[i] = normal_rng(alfaa + betaa*weight[i], sigma);
  }
}