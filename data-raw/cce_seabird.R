## code to prepare `cce_seabird` dataset goes here

# Attach packages
library(usethis)
library(metajam)

# Save link location for the data package:
cce_url <- "https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-cce.162.3&entityid=b3f3f72d675c84ca0507b75df6717a11"

# Download the data package with metajam
cce_download <- download_d1_data(data_url = cce_url, path = tempdir(), dir_name="cce_seabird")

# Read in data
cce_files <- read_d1_files(cce_download)
cce_seabird <- cce_files$data %>% clean_names()

usethis::use_data(cce_seabird, overwrite = TRUE)
