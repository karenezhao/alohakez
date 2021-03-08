## code to prepare `cce_watertemp` dataset goes here

# Attach packages
library(usethis)
library(metajam)

# Save link location for the data package:
cce_url <- "https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-cce.15.4&entityid=411c8b8769c4578be6702ee44bdb712e"

# Download the data package with metajam
cce_download <- download_d1_data(data_url = cce_url, path = tempdir(), dir_name="cce_watertemp")

# Read in data
cce_files <- read_d1_files(cce_download)
cce_watertemp <- cce_files$data %>%
  clean_names()

usethis::use_data(cce_watertemp, overwrite = TRUE)
