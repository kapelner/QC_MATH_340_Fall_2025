pacman::p_load(ggplot2)

n = 17

xs = runif(n)
sort(xs)
median(xs)
min(xs)
max(xs)
sort(xs)[9]
sort(xs)[3]
sort(xs)[15]

max(runif(n))
max(runif(n))
max(runif(n))

Nsim = 10e4
Xs = matrix(NA, nrow = n, ncol = Nsim)
for (nsim in 1 : Nsim){
  Xs[, nsim] = sort(runif(n))
}
order_stats = data.frame(
  xmins = Xs[1, ],
  xmaxs = Xs[n, ],
  xmedians = Xs[9, ],
  xorder3s = Xs[3, ],
  xorder15s = Xs[15, ]
)
NBINS = 500
ALPHA = 0.5
ggplot(order_stats) + 
  xlab("x") +
  geom_histogram(aes(x = xmins, y = after_stat(density)),     
                 bins = NBINS, fill = "red", alpha = ALPHA) + 
  geom_histogram(aes(x = xmaxs, y = after_stat(density)),     
                 bins = NBINS, fill = "blue", alpha = ALPHA) + 
  geom_histogram(aes(x = xmedians, y = after_stat(density)),  
                 bins = NBINS, fill = "green", alpha = ALPHA) + 
  geom_histogram(aes(x = xorder3s, y = after_stat(density)),  
                 bins = NBINS, fill = "purple", alpha = ALPHA) + 
  geom_histogram(aes(x = xorder15s, y = after_stat(density)), 
                 bins = NBINS, fill = "yellow", alpha = ALPHA)
