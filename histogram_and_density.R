
p1 <- heights %>%
  filter(sex == "Male") %>%
  ggplot(aes(x = height)) +
  geom_histogram(binwidth = 1, fill = "blue", col = "black") +
  xlab("Male heights in inches") +
  ggtitle("Histogram")

p2 <- heights %>%
  filter(sex == "Male") %>%
  ggplot(aes(x = height)) +
  geom_density(fill = "blue", col = "black") +
  xlab("Male heights in inches") +
  ggtitle("Histogram")
  
library(gridExtra)
grid.arrange(p1, p2, ncol = 2)
