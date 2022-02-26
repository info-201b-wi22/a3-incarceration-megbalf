library("maps")
library("mapproj")
library(ggplot2)
library(dplyr)
library(tidyverse)
library(patchwork)
library(scales)

total_per_state <- incarceration_trends %>% group_by(state) %>% filter(year == "2018") %>% 
  summarize(total_jail = sum(total_jail_pop, na.rm = TRUE))

state_shape <- map_data("state")

state_abbrevs <- data.frame(state.abb, state.name)

total_per_state <- left_join(total_per_state, state_abbrevs, by = c('state' = 'state.abb'))

total_per_state <- total_per_state %>% mutate(region = tolower(state.name))

state_shape <- left_join(state_shape, total_per_state)

ggplot(state_shape) + geom_polygon(
  mapping = aes(x = long, y = lat, group = group, fill = total_jail),
) + 
  coord_map() + labs(title = "2018 Total Jail Population") + 
  scale_fill_continuous(low = 'blue', high = 'red', labels = scales:: label_number_si())

