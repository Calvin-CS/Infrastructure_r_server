# receive in the package you want to uninstall; error out otherwise

args = commandArgs(trailingOnly=TRUE)
if (length(args)==1) {
  pkg = args[1]
  if (nzchar(system.file(package = pkg))) {
    print(paste("Removing package",pkg,"...n", sep=" "))
    remove.packages(pkg)
  } else {
    stop(paste("Package",pkg,"not installed; cannot remove.",sep=" "), call.=FALSE)
  }
} else {
  stop("Package not given as argument.n", call.=FALSE)
}
