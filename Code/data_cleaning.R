###Ingrid's fjord Pcod project (O18-genetics)

#Data cleaning, maintain confidentiality

library(tidyverse)
library(readxl)
library(janitor)

data <- read_excel("../Data/FJORD_pcod_spies_018.xlsx", sheet = "o18")

data <- clean_names(data)
names(data)

data <- data %>% 
  select(alternate_id, collection_date:collection_day, location2,
         length_mm:lifestage, sex, o18_sample_id, d_o18, d_c13)  #select only pertinent fields, remove confidential info

data$location2 <- str_replace_all(data$location2, " ", "") #remove whitespace in location names

write.csv(data, file = "../Data/cleaned_data.csv", row.names = FALSE)
