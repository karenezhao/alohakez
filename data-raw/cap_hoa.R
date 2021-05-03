## code to prepare `cap_hoa` dataset goes here

usethis::use_data(cap_hoa, overwrite = TRUE)
## code to prepare `cap_hoa` dataset goes here

# Attach packages
library(usethis)
library(metajam)
library(tidyverse)
library(janitor)

# Save link location for the data package:
cap_url <- "https://data.sustainability.asu.edu/cap-portal/dataviewer?packageid=knb-lter-cap.640.1&entityid=1e80efc60f1b7cbf765fe867d0f20575"

# Download the data package with metajam
cap_download <- download_d1_data(data_url = cap_url, path = tempdir(), dir_name="cap")

# Read in data
cap_files <- read_d1_files(cap_download)
cap_hoa <- cap_files$data %>% clean_names() %>%
  filter(!is.na(hoa)) %>%
  select(c(site:hoa, nat_shan_bird:num_te)) %>%
  rename(nat_bird = nat_shan_bird,
         plnt = shan_plnt,
         arthropod = shan_bug)

usethis::use_data(cap_hoa, overwrite = TRUE)
