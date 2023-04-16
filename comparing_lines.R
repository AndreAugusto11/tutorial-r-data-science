library(dslabs)
data(gapminder)

countries <- c("United States", "Albania", "Portugal")

gapminder %>%
  filter(country %in% countries) %>%
  ggplot(aes(year, fertility, col = country)) +
  geom_line()