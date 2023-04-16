library(ggplot2)
library(tidyr)

boxplot(lat$phase1, lat$phase2, lat$lock, lat$phase3, lat$delete, lat$create,
        names = c("phase1", "phase2", "lock", "phase3", "delete", "create"),
        main = "Latency by SATP phase",
        xlab = "SATP phases",
        ylab = "Latency (ms)")

# convert data frame into a long format using gather() function
lat_long <- gather(lat)

# create a boxplot using ggplot2
p2 <- lat_long %>% ggplot(aes(x = key, y = value)) +
  labs(x = "Columns", y = "Values", title = "Boxplots of each column") +
  geom_jitter(width = 0.2, alpha = 0.2)

p3 <- lat_long %>% ggplot(aes(x = key, y = value)) +
  geom_boxplot() +
  labs(x = "Columns", y = "Values", title = "Boxplots of each column")

library(gridExtra)
grid.arrange(p2, p3, ncol = 2)


