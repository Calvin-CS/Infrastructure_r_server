# new smart install way
my_packages <- c('mosaic','tidyverse','reticulate','devtools','keras','nycflights13','pins','plotly','qualtRics','skimr','tidymodels','timeDate','fpp3','sf','terra','spData','tmap','rcartocolor','patchwork','AmesHousing','rpart.plot','gapminder','palmerpenguins','Lock5withR','abd','bookdown','bootstrap','car','carData','DAAG','Devore7','faraway','fastR2','GGally','Hmisc','ISLR','janitor','Lahman','naniar','NHANES','nhanesA','openintro','partykit','shinyjs','shinystan','shinytest','shinythemes','TeachingDemos','xgboost','tinytex','packrat','rsconnect','nasaweather','prettydoc','unvotes','ggspatial','ranger','animation','tidygeocoder','datasauRus','directlabels','maps','mapview','rnoaa','vip','openxlsx','pander','bayesrules','rstanarm','rstan','bayesplot','tidybayes','broom.mixed','modelr','e1071','forcats','gt','alr4','MASS','Stat2Data','datasets','dplyr','gdata','ggformula','ggplot2','grDevices','grid','knitr','lattice','mosaicCalc','mosaicData','nlme','plyr','readr','stats','tidyr','triangle','vcd','babynames','downloader','kableExtra','RMariaDB','ggthemes','ggeffects','classInt','rlist','snakecase','sys','cdfquantreg','latex2exp','pracma','ISLR2','ISwR','mnormt')
not_installed <- my_packages[!(my_packages %in% installed.packages()[ , "Package"])]
if(length(not_installed)) install.packages(not_installed,repos = "http://cran.us.r-project.org")
print(paste(length(not_installed), "packages had to be installed."))

# check specifically for github packages
install_github_if_missing <- function(user, pkg) {
  if (!nzchar(system.file(package = pkg))) {
    remotes::install_github(paste0(user, "/", pkg))
    print("1 package had to be installed.")
  }
}

install_github_if_missing("rstudio","learnr")
install_github_if_missing("rstudio-education","dsbox")
install_github_if_missing("geocompr","geocompkg")
install_github_if_missing("dtkaplan","submitr")
install_github_if_missing("baumer-lab","fec12")
install_github_if_missing("rpruim","deltaMethod")
install_github_if_missing("stacyderuiter","StatTutor")

# check for archived / source install packages
install_src_if_missing <- function(pkg, srcurl) {
  if (!nzchar(system.file(package = pkg))) {
    pkgfile <- basename(srcurl)
    desttmpfile <- paste("/tmp/",pkgfile,sep="")
    download.file(url = srcurl, destfile = desttmpfile)
    install.packages(pkgs=desttmpfile, type="source", repos=NULL)
    unlink(desttmpfile)
    print("1 package had to be installed.")
  }
}

install_src_if_missing("mdsr","https://cran.r-project.org/src/contrib/Archive/mdsr/mdsr_0.2.6.tar.gz")

