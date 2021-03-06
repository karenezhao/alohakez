% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ble_co2_doc.R
\docType{data}
\name{ble_co2}
\alias{ble_co2}
\title{Carbon flux from aquatic ecosystems of the Arctic Coastal Plain along the Beaufort Sea, Alaska, 2010-2018}
\format{
A tibble with 231 rows and 15 variables:
\describe{
  \item{year}{Year data were collected}
  \item{habitat}{Habitat type (pond, lake, river, lagoon, ocean):
  Ocean = Ocean, Lagoon = Lagoon,
  Salt-River = River influenced by saltwater intrusion from lagoon.
  LAKE = Lake, RIVER = Freshwater river, POND = Pond, TK-POND = Thermokarst Pond}
  \item{fw_sal}{Identifies freshwater or saline (incl. brackish) conditions}
  \item{site}{Site name}
  \item{station}{When multiple sites within a single site were sampled, they were assigned a different subsite name}
  \item{water_column_position}{Where sample was taken within a water column}
  \item{julien_day}{Day of year starting from Jan 1st. AKDT time}
  \item{woy}{Week of the year}
  \item{doc}{Dissolved organic carbon determined by non-purgeable organic carbon method (ppm). Precision for Elson and Chukchi sites is 0.1, for all other sites 0.01.}
  \item{water_temp_c}{Water temperature in degrees Celsius}
  \item{pCO2}{Partial pressure of CO2 (uatm)}
  \item{air_temp_c}{Air temperature in degrees Celsius}
  \item{location_notes}{Site description and bounding boxes, only for locations without exact coordinates}
  }
}
\source{
{Beaufort Lagoon Ecosystems LTER and V. Lougheed. 2020. Carbon flux from aquatic ecosystems of the Arctic Coastal Plain along the Beaufort Sea, Alaska, 2010-2018 ver 7. Environmental Data Initiative.}
\url{https://doi.org/10.6073/pasta/e6c261fbd143e720af5a46a9a131a616}
}
\usage{
ble_co2
}
\description{
Multiple aquatic ecosystems (pond, lake, river, lagoon, ocean) on the Arctic Coastal Plain (ACP) near Utqiaġvik, AK were visited to determine their relative contribution to landscape-level atmospheric CO2 flux and how this may have changed over time.
}
\keyword{datasets}
