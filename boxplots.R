library(dslabs)
data(gapminder)

gapminder %>%
  filter(year == 1970 & !is.na(gdp)) %>%
  mutate(dollars_per_day = gdp/population/365) %>%
  mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%
  ggplot(aes(dollars_per_day, region, fill = continent)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  scale_x_continuous(trans = "log2") +
  geom_point(show.legend = FALSE)
