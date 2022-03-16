incarceration_trends <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")

x_values <- seq(1, 3)
y_values <- seq(1,3)


library(tidyverse)
incarceration_time_series <- incarceration_trends %>% 
  select(year, aapi_jail_pop, black_jail_pop, latinx_jail_pop, native_jail_pop, 
         white_jail_pop, other_race_jail_pop, total_jail_pop) %>% 
  group_by(year) %>% summarize(across(black_jail_pop:total_jail_pop, sum, na.rm = TRUE)) %>% 
  pivot_longer(cols = black_jail_pop:total_jail_pop, names_to = "Category")
           

library(ggplot2)
ggplot(data = incarceration_time_series, mapping = aes(x = year, y = value, color = Category)) + 
  geom_point() + geom_line() + xlim(1985, 2018) + 
  scale_color_brewer(palette = "Set3", labels = c("aapi_jail_pop" = "AAPI" , 
                                                   "black_jail_pop" = "Black",
                                                "latinx_jail_pop" = "Latin",
                                            "native_jail_pop" = "Native",
                                       "white_jail_pop" = "White", 
                                       "other_race_jail_pop" = "Other",
                                   "total_jail_pop" = "Total"    )) + 
  labs( title = "Incarcerated Population Over Time By Race",
        x = "Year", 
        y = "Population"
        )


