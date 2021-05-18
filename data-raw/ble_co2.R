#' ---
#' title: "Data Preparation"
#' ---

#' ### Download the raw data from EDI.org

#+ download_data, eval=FALSE
library(tidyverse)
library(lubridate)
library(janitor)
library(usethis)
library(metajam)

ble_url <- "https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-ble.1.6&entityid=a1723e0e5f3c4881f1a7ede1b036aba6"
ble_download <- download_d1_data(data_url = ble_url, path = tempdir(), dir_name="ble")

#' ### Data cleaning

#+ data sampling, eval=FALSE
# Read in data
ble_files <- read_d1_files(ble_download)
ble_data <- ble_files$data

# Basic cleaning

ble_co2 <- ble_data %>%
  janitor::clean_names() %>%
  select(-c(wind_m_s, k_cm_h, fmmol_mmol_m2_day:fgrams_g_m2_day)) %>%             # Gas transfer co-efficient,
  rename(doc = doc_ppm,           # Dissolved organic carbon
         pCO2 = p_co2_uatm) %>%   # Partial pressure of CO2 (uatm)
  mutate(fw_sal = case_when(
    fw_sal == "FW" ~ "Freshwater",
    TRUE ~ fw_sal
  ),
  julian_day = case_when(
    julian_day == 121 ~ 211,
    TRUE ~ julian_day
  ),
  location_notes = case_when(
    location_notes == "-9999.00" ~ "Not applicable",
    TRUE ~ location_notes
  )
  ) %>%
  mutate(across(where(is.numeric), ~na_if(., -9999.00))) #

# Join next file

ble_url2 <- "https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-ble.1.7&entityid=617415426847fd900b644283d86c1c66"
ble_download2 <- download_d1_data(data_url = ble_url2, path = tempdir(), dir_name = "ble2")

ble_files2 <- read_d1_files(ble_download2)
ble_data2 <- ble_files2$data
tundra <- ble_data2 %>% clean_names() %>%
  rename(daily_rain = daily_rain_mm) %>%
  select(latitude, longitude, year, julian_day, daily_rain)
tundra_day <- tundra[!duplicated(tundra), ] %>% filter(year>2014)

ble_co2 <- left_join(ble_co2, tundra_day,
            by = c("latitude" = "latitude", "longitude" = "longitude",
                   'year' = 'year', 'julian_day' = 'julian_day')
            ) %>%
  relocate(location_notes, .after = last_col())

#+ save data, include=FALSE, eval=FALSE
usethis::use_data(ble_co2, overwrite = TRUE)
