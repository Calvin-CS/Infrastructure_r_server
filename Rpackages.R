# When adding a new package, maintain alphabetical order (ignoring case).
my_packages <- c(
  'abd',
  'alr4',
  'altair',
  'AmesHousing',
  'animation',
  'babynames',
  'bayesplot',
  'bayesrules',
  'bookdown',
  'bootstrap',
  'broom.mixed',
  'car',
  'carData',
  'cdfquantreg',
  'classInt',
  'DAAG',
  'dagitty',
  'datasauRus',
  'datasets',
  'Devore7',
  'devtools',
  'DHARMa',
  'directlabels',
  'downloader',
  'dplyr',
  'e1071',
  'faraway',
  'fastR2',
  'filelock',
  'forcats',
  'fpp3',
  'gapminder',
  'gdata',
  'GGally',
  'ggdag',
  'ggeffects',
  'ggformula',
  'ggplot2',
  'ggspatial',
  'ggthemes',
  'glmmTMB',
  'grDevices',
  'grid',
  'gt',
  'Hmisc',
  'ISLR',
  'ISLR2',
  'ISwR',
  'janitor',
  'kableExtra',
  'keras',
  'knitr',
  'Lahman',
  'latex2exp',
  'lattice',
  'Lock5withR',
  'maps',
  'mapview',
  'MASS',
  'mgcViz',
  'mnormt',
  'modelr',
  'mosaic',
  'mosaicCalc',
  'mosaicData',
  'naniar',
  'nasaweather',
  'NHANES',
  'nhanesA',
  'nlme',
  'nycflights13',
  'openintro',
  'openxlsx',
  'packrat',
  'palmerpenguins',
  'pander',
  'partykit',
  'patchwork',
  'pins',
  'plotly',
  'plyr',
  'pracma',
  'prettydoc',
  'qualtRics',
  'ranger',
  'rcartocolor',
  'readr',
  'reticulate',
  'rlist',
  'RMariaDB',
  'rnoaa',
  'rpart.plot',
  'rsconnect',
  'rstan',
  'rstanarm',
  'sf',
  'shinyjs',
  'shinystan',
  'shinytest',
  'shinythemes',
  'skimr',
  'snakecase',
  'spData',
  'Stat2Data',
  'stats',
  'sys',
  'TeachingDemos',
  'terra',
  'tfdatasets',
  'tidybayes',
  'tidygeocoder',
  'tidymodels',
  'tidyquant',
  'tidyr',
  'tidyverse',
  'timeDate',
  'tinytex',
  'tmap',
  'triangle',
  'unvotes',
  'vcd',
  'vegalite',
  'vip',
  'V8',
  'xgboost'
)
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
install_github_if_missing("stacyderuiter","s245")
install_github_if_missing("CalvinData","CalvinBayes")
install_github_if_missing("OI-Biostat","oi_biostat_data")
install_github_if_missing("vegawidget","vegabrite")

# rethinking requires the cmdstanr stuff first
install_noncran_if_missing <- function(pkg,repostring) {
  if (!nzchar(system.file(package = pkg))) {
    install.packages(pkg, repos = repostring)
    print("1 package had to be installed.")
    if(pkg == 'cmdstanr') {
      library(cmdstanr)
      set_cmdstan_path('/usr/local/cmdstan')
    }
  }
}

install_noncran_if_missing('cmdstanr','https://mc-stan.org/r-packages/')
install_github_if_missing("rmcelreath","rethinking")

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

