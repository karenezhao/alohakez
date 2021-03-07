## code to prepare `sbc_abundance` dataset goes here

# Attach packages
library(usethis)
library(metajam)

# Save link location for the data package:
sbc_url <- "https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-sbc.30.19&entityid=4587fe81c6d2eabf530c70e53b302132"

# Download the data package with metajam
sbc_download <- download_d1_data(data_url = sbc_url, path = tempdir(), dir_name="sbc_abundance")

# Read in data
sbc_files <- read_d1_files(sbc_download)
sbc_abundance <- sbc_files$data

usethis::use_data(sbc_abundance, overwrite = TRUE)
