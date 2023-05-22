data{
    int<lower=0> N; 
    real miles[N]; 
}

generated quantities {
   real alpha = normal_rng(2, 0.002);
   real theta = normal_rng(0.0002, 0.00008);
   real lambda[N];
   real y_sim[N];

   for(n in 1:N){
    lambda[n] = exp(alpha + theta *miles[n]);
    y_sim[n] = poisson_rng(lambda[n]);
   }
}