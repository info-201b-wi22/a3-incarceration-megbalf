library(dplyr)

features <- colnames(incarceration_trends)
observations <- nrow(incarceration_trends)



highest_incarceration <- incarceration_trends %>%
  filter(total_jail_pop == max(total_jail_pop, na.rm = TRUE)) %>% 
  pull(total_jail_pop)
 
 
avg_incarcerated <- (avg_incarcerated = mean(incarceration_trends$total_jail_pop, na.rm=T))
  
median_incarcerated <- (median_incarcerated = median(incarceration_trends$total_jail_pop, na.rm = T))

highest_state_incarcerated <- total_per_state %>% 
  filter(total_jail == max(total_jail, na.rm = T)) %>% pull(total_jail)

min_state_incarcerated <- total_per_state %>% 
  filter(total_jail == min(total_jail, na.rm = T)) %>% pull(total_jail)
