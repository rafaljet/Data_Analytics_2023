data {
  int<lower=0> N;
  real heights[N];
  real weight[N];
}

parameters {
  real<lower=0> alfaa;
  real<lower=0> sigma;
  real<lower=0> betaa;
}

transformed parameters {
  real heights_pred[N];
  for (i in 1:N){
    heights_pred[i]=alfaa+betaa*weight[i];
  }
}

model {
    alfaa ~ normal(170,15);
    betaa ~ lognormal(0,1);
    sigma ~ exponential(0.067); #1/15
    heights ~ normal(heights_pred, sigma);

    for(i in 1:N){
    heights[i] ~ normal(heights_pred[i],sigma);
   }

}

generated quantities {
  real height[N];
  for(i in 1:N){
    height[i]=normal_rng(heights_pred[i],sigma);
  }
}