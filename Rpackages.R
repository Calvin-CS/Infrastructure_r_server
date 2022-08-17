# new smart install way
my_packages <- c('mosaic','tidyverse','reticulate','devtools','keras','nycflights13','pins','plotly','qualtRics','skimr','tidymodels','timeDate','mdsr','fpp3','sf','terra','spData','tmap','rcartocolor','patchwork','AmesHousing','rpart.plot','gapminder')
not_installed <- my_packages[!(my_packages %in% installed.packages()[ , "Package"])]
if(length(not_installed)) install.packages(not_installed,repos = "http://cran.us.r-project.org")
print(paste(length(not_installed), "packages had to be installed."))

# check specifically for github packages
install_github_if_missing <- function(user, pkg) {
  if (!nzchar(system.file(package = pkg))) {
    remotes::install_github(paste0(user, "/", pkg))
  }
}

install_github_if_missing("rstudio","learnr")
install_github_if_missing("rstudio-education","dsbox")
install_github_if_missing("geocompr","geocompkg")
