## code to prepare `vcr_fish` dataset goes here

# Attach packages
library(usethis)
library(metajam)

# Save link location for the data package:
vcr_url <- "https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-vcr.236.11&entityid=27549758f3eeecd9be5344562e0340fb"

# Download the data package with metajam
vcr_download <- download_d1_data(data_url = vcr_url, path = tempdir(), dir_name="vcr_fish")

# Read in data
vcr_files <- read_d1_files(vcr_download, "read.csv",
                           header=T
                           ,skip=21
                           ,sep=","
                           ,quot='"' )
vcr_fish <- vcr_files$data %>% clean_names()

usethis::use_data(vcr_fish, overwrite = TRUE)
