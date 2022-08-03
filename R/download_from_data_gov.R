res_temp_visa <- ckanr::resource_search(
  url = "https://data.gov.au",
  q = "name:temporary visa"
)

ckan_fetch(res_temp_visa$results[[1]]$url,
           store = "disk",
           path = "data/DoHA_temp_visa_holders.xlsx"
)
