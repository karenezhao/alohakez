## code to prepare `and_vertebrates` dataset goes here

# Attach packages
library(usethis)
library(metajam)

# Save link location for the data package:
and_url <- "https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-and.4027.14&entityid=5b18ded1cd996f5e8d361a9275a600cf"

# Download the data package with metajam
and_download <- download_d1_data(data_url = and_url, path = tempdir(), dir_name="and_vertebrates")

# Read in data
and_files <- read_d1_files(and_download)
and_vertebrates <- and_files$data

usethis::use_data(and_vertebrates, overwrite = TRUE)
