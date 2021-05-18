## code to prepare `ble_tundra` dataset goes here

# Attach packages
library(usethis)
library(metajam)
library(tidyverse)
library(janitor)

# Save link location for the data package:
ble_url <- "https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-ble.1.7&entityid=617415426847fd900b644283d86c1c66"

# Download the data package with metajam
ble_download <- download_d1_data(data_url = ble_url, path = tempdir(), dir_name = "ble_tundra")

# Read in data
ble_files <- read_d1_files(ble_download)
ble_data <- ble_files$data
ble_tundra <- ble_data %>% clean_names() %>%
  select(-c(latitude, longitude)) %>%
  rename(pCO2 = p_co2_uatm)  %>% # Partial pressure of CO2 (uatm)
  mutate(across(c(radiation_w_m2:water_temp_c), ~na_if(., -9999.00))) %>%
  mutate(across(c(radiation_w_m2:water_temp_c), ~na_if(., -9999)))

ibp_c <- ble_co2 %>% filter(site=="IBP-C") %>%
  select(year, julian_day, doc:air_temp_c) %>%
  filter(!is.na(doc)) %>%
  mutate(hour = "day")


usethis::use_data(ble_tundra, overwrite = TRUE)
