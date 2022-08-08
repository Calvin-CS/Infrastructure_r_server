# new smart install way
my_packages <- c('mosaic','tidyverse','reticulate','devtools','keras','nycflights13','pins','plotly','qualtRics','skimr','tidymodels','timeDate')
not_installed <- my_packages[!(my_packages %in% installed.packages()[ , "Package"])]
if(length(not_installed)) install.packages(not_installed,repos = "http://cran.us.r-project.org")
print(paste(length(not_installed), "packages had to be installed."))

# old way
#install.packages('mosaic',repos = "http://cran.us.r-project.org")
#install.packages('tidyverse',repos = "http://cran.us.r-project.org")
#install.packages('reticulate',repos = "http://cran.us.r-project.org")
#install.packages('devtools',repos = "http://cran.us.r-project.org")
#install.packages('keras',repos = "http://cran.us.r-project.org")
#install.packages('nycflights13',repos = "http://cran.us.r-project.org")
#install.packages('pins',repos = "http://cran.us.r-project.org")
#install.packages('plotly',repos = "http://cran.us.r-project.org")
#install.packages('qualtrRics',repos = "http://cran.us.r-project.org")
