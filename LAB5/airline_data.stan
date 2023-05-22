data{
    int<lower=0> N; 
    real<lower=0> miles[N];
    int<lower=0> accidents[N];
}

parameters {
   real alpha;
   real theta;
}

transformed parameters {
   real lambda[N];
   for(n in 1:N){
    lambda[n] = exp(alpha + theta * miles[n]);
   }
}

model{
    alpha ~ normal(2, 0.002);
    theta ~ normal(0.0001, 0.00008);
    accidents ~ poisson(lambda);
}
generated quantities {
   int<lower=0> accidents_sim[N];
   for(n in 1:N){
    accidents_sim[n] = poisson_rng(lambda[n]);
   }
}