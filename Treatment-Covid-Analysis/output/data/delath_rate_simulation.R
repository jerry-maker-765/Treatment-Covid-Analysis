#### Preamble ####
# Purpose: Data Simulation 
# Author:  Shenzhe lu,Jierui Miao,Dongli SUn
# Date: 14 February 2023
# Contact: shenzhe.lu@mail.utoronto.ca,jierui.miao@mail.utoronto.ca,dongli.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: NA


install.packages('tidyverse')
library(tidyverse)

set.seed(42)  
子

years <- 2000:2030


simulate_death_rates <- function(years, start_rate, rate_change, sd_rate) {
  rate <- start_rate
  simulated_rates <- numeric(length(years))
  for (i in seq_along(years)) {
    simulated_rates[i] <- rnorm(1, rate + (i-1) * rate_change, sd_rate)
  }
  return(simulated_rates)
}


death_rates_male <- simulate_death_rates(years, start_rate = 10, rate_change = -0.1, sd_rate = 2)
death_rates_female <- simulate_death_rates(years, start_rate = 8, rate_change = -0.05, sd_rate = 1.5)


simulated_data <- tibble(
  year = years,
  death_rate_male = death_rates_male,
  death_rate_female = death_rates_female
)


print(head(simulated_data))


write_csv(simulated_data, "simulated_death_rates.csv")
