library(tidyverse)
library(dslabs)
library(ggthemes)
library(ggrepel)
data(murders)

#murders %>% ggplot() +
#  geom_point(aes(x = population/10^6, y = total), size=3) + 
#  geom_text(aes(population/10^6, total, label = abb), nudge_x = 1)

# the follwing code is equal to above, we load aes only once for performance
#murders %>% ggplot(aes(x = population/10^6, y = total, label = abb)) +
#  geom_point(size=3) + 
#  geom_text(nudge_x = 1)

r <- murders %>%
  summarize(rate = sum(total) / sum(population) * 10^6) %>% .$rate

murders %>% ggplot(aes(x = population/10^6, y = total, label = abb)) +
  geom_abline(intercept = log10(r), lty = 2, color = "darkgray") +
  geom_point(aes(color = region), size = 3) + 
  geom_text_repel() +
  scale_x_continuous(trans = "log10") + # or scale_x_log10()
  scale_y_log10() +
  xlab("Populations in millions (log scale)") +
  ylab("Total number of murders (log scale)") +
  ggtitle("US Gun Murders in US 2010") +
  scale_color_discrete(name = "Region") +
  theme_economist()
  
