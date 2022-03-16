avg_co2 <- (avg_co2 = mean(climate_data$co2, na.rm=TRUE))

highest_co2 <- climate_data %>% 
  filter(co2 == max(co2, na.rm=TRUE)) %>% pull(country)

highest_co2_per_capita <- climate_data %>% 
  filter(co2_per_capita == max(co2_per_capita, na.rm=TRUE)) %>% pull(country)

avg_co2_per_capita <- (avg_co2_per_capita = mean(climate_data$co2_per_capita, na.rm=TRUE))

median_co2 <- (median_co2 = median(climate_data$co2, na.rm=TRUE))

unique_countries <- unique(climate_data$country)