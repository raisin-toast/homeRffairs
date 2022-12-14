% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/download_from_data_gov.R
\name{get_temp_visa_holders}
\alias{get_temp_visa_holders}
\title{Download the temporary visa holders data from data.gov and clean it}
\usage{
get_temp_visa_holders(
  path = file.path(tempdir(), "temp.xlsx"),
  detailed = FALSE
)
}
\arguments{
\item{path}{(character) where to save the file}

\item{detailed}{(logical; default = FALSE)}
}
\value{
a dataframe
}
\description{
This function cleans the data.gov.au  data. However, home affairs locks its data behind a
pivot table. If you need more detailed information, set the argument to TRUE. This will open the
excel sheet. Pull down the additional variables you need and then save the file. The function will return the
more detailed data
}
\examples{

\dontrun{get_temp_visa_holders}
}
