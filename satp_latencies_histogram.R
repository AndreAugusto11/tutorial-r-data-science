library(ggplot2)
library(tidyr)
library(tidyverse)
library(ggthemes)

total_latency <- lat %>%
  mutate(total = phase1+phase2+phase3) %>%
  select(total)

bridging_latency <- lat %>%
  mutate(bridging = phase1+phase2+phase3-lock-delete-create) %>%
  select(bridging)

new_data <- data.frame(bridging_latency, total_latency)

new_data_long <- gather(new_data)

mean_bridging <- summarize(bridging_latency, mean(bridging,na.rm=TRUE))
mean_total <- summarize(total_latency, mean(total,na.rm=TRUE))

new_data_long %>%
  ggplot(aes(x = value, fill=key)) +
  geom_histogram(binwidth = 350) +
  xlim(0, y = 12500) +
  ylim(0, y = 120) +
  xlab("Latency (ms)") +
  ylab("Frequency") +
  ggtitle("Latency distribution (n=500)")+
  theme_base()



