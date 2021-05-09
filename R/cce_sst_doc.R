#' Shore Stations Program SIO Pier Water Temperature
#'
#' Daily sea-surface temperature measurements, collected and provided by the Shore Stations Program, La Jolla CA, 1916 - May 2019
#'
#' @format A tibble with 36,230 rows and 6 variables:
#' \describe{
#'   \item{date_pst}{Pacific Standard Time date.}
#'   \item{year}{year (PST)}
#'   \item{month}{one of twelve divisions of a calandar year}
#'   \item{month}{one of twelve divisions of a calandar year}
#'   \item{day}{a 24-hour period starting at midnight Pacific Standard Time (PST) and ending at the next midnight(PST)}
#'   \item{sea_surface_temperature_c}{temperature measurement in Celsius}
#'   \item{sea_surface_temperature_flag}{0 = good data, 1 = illegible entry, 2 = data differs from other sources, ie. temperature vs. salinity record, 3 = data uncertain, 4 = leaky bottle, 5 = SIO Pier Chlorophyll Program Data}
#'   }
#' @source {Shore Stations Program. 2019. Daily sea-surface temperature measurements, collected and provided by the Shore Stations Program, La Jolla CA, 1916 - May 2019 ver 4. Environmental Data Initiative.}
#' \url{https://doi.org/10.6073/pasta/d8e2473a3de462bd4d75bad8f934a40a}
"cce_sst"
