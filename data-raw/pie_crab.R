## code to prepare `pie_crab` dataset goes here

# Attach packages
library(usethis)
library(metajam)
library(tidyverse)
library(janitor)

# Save link location for the data package:
pie_url <- "https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-pie.540.1&entityid=bab5a4d6df7dce829a222f281cca55a5"

# Download the data package with metajam
pie_download <- download_d1_data(data_url = pie_url, path = tempdir(), dir_name="pie")

# Read in data
pie_files <- read_d1_files(pie_download)
pie_crab <- pie_files$data %>% clean_names() %>%
  select(-replicate) %>%
  left_join(pie_files$factor_metadata[, 0:2], by = c("site" = "code")) %>%
  rename("name" = "definition",
         "size" = "carapace_width")

usethis::use_data(pie_crab, overwrite = TRUE)
