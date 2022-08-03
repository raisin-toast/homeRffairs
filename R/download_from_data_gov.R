#' Download temp visa holders
#'
#' @param search_term (default = "name:temporary visa", character) the CKAN search term you are using to look for
#' @param path
#'
#' @return
#' @export
#'
#' @examples
download_temp_visa_holders_data_gov <- function(search_term = "name:temporary visa",
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

