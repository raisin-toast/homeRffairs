% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/download_from_data_gov.R
\name{download_data_gov}
\alias{download_data_gov}
\title{Download data.gov.au data}
\usage{
download_data_gov(
  search_term = "name:temporary visa",
  path = "data/DoHA_temp_visa_holders.xlsx"
)
}
\arguments{
\item{search_term}{(default = "name:temporary visa", character) the CKAN search term you are using to look for}

\item{path}{(default = "data/DoHA_temp_visa_holders.xlsx"; character) the filepath where to save the data}
}
\description{
Download data.gov.au data
}
