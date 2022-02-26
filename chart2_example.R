x_values <- seq(1, 3)
y_values <- seq(1,3)

library(ggplot2)
ggplot(incarceration_trends) +
  geom_point(mapping = aes(x= total_pop, y = total_jail_pop), labels = scales:: label_number_si()) + 
  labs(title = "Incarcerated Population to Total Population")


