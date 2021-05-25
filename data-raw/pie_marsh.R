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

pie_url <- "https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-pie.501.2&entityid=6eeebd635938ab91c764c681e44164fc"
pie_download <- download_d1_data(data_url = pie_url, path = tempdir(), dir_name = "pie")

#' ### Data cleaning

#+ data sampling, eval=FALSE
# Read in data
pie_files <- read_d1_files(pie_download)
pie_data <- pie_files$data

# Basic cleaning

pie_marsh <- pie_data %>%
  janitor::clean_names()

# join second data
pie_url2 <- "https://portal.edirepository.org/nis/dataviewer?packageid=knb-lter-pie.36.16&entityid=9168d6763e76606349885f450557253d"
pie_download2 <- download_d1_data(data_url = pie_url2, path = tempdir(), dir_name = "pie2")
pie_files2 <- read_d1_files(pie_download2)
set <- pie_files2$data %>%
  janitor::clean_names()


set <- set %>% mutate( date = as.Date(paste(year, month, day, sep = "/" )),
                       pin_height = as.double(pin_height))
avg <- set %>%
  group_by(date, site, trt, plot) %>%
  summarise(across(c(pin_height), ~mean(.x, na.rm = TRUE))) %>% ungroup()
avg %>%
  ggplot(aes(x = date, y = pin_height, color = plot)) +
  geom_point() +
  facet_wrap(~site)
dat <- unique(set$date)

marsh_set <- left_join(pie_marsh, set,
               by = c("site" = "site",
                      "treatment" = "trt",
                      "plot" = "plot",
                      "month" = "month",
                      "year" = "year"
                      )) %>%
  mutate(diff = abs(day.y - day.x))
avg <- marsh_set %>%
  group_by(date, site, treatment, plot) %>%
  summarise(across(c(biomass, pin_height), ~mean(.x, na.rm = TRUE))) %>% ungroup()
avg %>% ggplot(aes(x=pin_height, y = biomass, color=treatment)) + geom_point()

pie_marsh <- marsh_set %>%
  select(-c(day.y, diff)) %>%
  rename(day = day.x,
         density = plant_density,
         mean_elev_change = mean_elev_change_cm)

#+ save data, include=FALSE, eval=FALSE
use_data(pie_marsh, overwrite = TRUE)
