#' Download data.gov.au data
#'
#' @param search_term (default = "name:temporary visa", character) the CKAN search term you are using to look for
#' @param path (default = "data/DoHA_temp_visa_holders.xlsx"; character) the filepath where to save the data
#'
#' @return NULL
#' @export

download_data_gov <- function(search_term = "name:temporary visa",
                                                path = "data/DoHA_temp_visa_holders.xlsx") {
  res_temp_visa <- ckanr::resource_search(
    url = "https://data.gov.au",
    q = search_term
  )

  ckanr::ckan_fetch(res_temp_visa$results[[1]]$url,
             store = "disk",
             path = path
  )
}



#' Download the temporary visa holders data from data.gov and clean it
#'
#' This function cleans the data.gov.au  data. However, home affairs locks its data behind a
#' pivot table. If you need more detailed information, set the argument to TRUE. This will open the
#' excel sheet. Pull down the additional variables you need and then save the file. The function will return the
#' more detailed data
#'
#'
#' @param path (character) where to save the file
#' @param detailed (logical; default = FALSE)
#'
#' @return a dataframe
#' @export
#'
#' @examples
#'
#' \dontrun{get_temp_visa_holders}
get_temp_visa_holders <- function(path = file.path(tempdir(), "temp.xlsx") ,
                                  detailed = FALSE) {
  download_data_gov(search_term = "name:temporary visa",
                    path = path)

  if (detailed){
    fs::file_show(path)

    usethis::ui_yeah("Have you expanded all the subcategories you need in the pivot table?")
  }

  readxl::read_excel(path,
             sheet = "Visa Holders Pivot Table",
             skip = 15) %>%
  tidyr::pivot_longer(cols = tidyselect::contains("4"), names_to = "date", values_to = "num_holders") %>%
  janitor::clean_names() %>%
  dplyr::mutate(date = janitor::excel_numeric_to_date(readr::parse_number(date)))
}
