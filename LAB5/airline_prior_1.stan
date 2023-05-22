data{
    int<lower=0> N;
    real miles[N];
}

generated quantities {
   real alpha[N];
   real theta = normal_rng(0.0002, 0.00008);
   real lambda[N];
   int y_sim[N];

   for (n in 1:N){
    alpha[n] = normal_rng(2, 0.002);
    lambda[n] = exp(alpha[n]+theta*miles[n]);
    y_sim[n] = poisson_rng(lambda[n]);
   }
}