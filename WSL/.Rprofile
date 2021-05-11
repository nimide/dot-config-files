## Set CRAN Mirror:
#local({
#    r <- getOption("repos")
#      r["CRAN"] <- "https://cloud.r-project.org/"
#        options(repos = r)
#})

options(
    repos = c(BiocManager::repositories(),
              CRANextra     = "https://www.stats.ox.ac.uk/pub/RWin", 
              Omegahat      = "http://www.omegahat.net/R", 
              "R-Forge"     = "https://R-Forge.R-project.org", 
              "rforge.net"  = "https://www.rforge.net"),
#              RForScience   = "http://yesr.nioz.nl/r"),

    BioC_mirror = "https://bioconductor.org"

)

## Create hidden environment
.env <- new.env()

## Define new q() function
.env$q <- function(save = "no", ...) {

    quit(save = save, ...)

}

## Attach hidden environment
attach(.env, warn.conflicts = FALSE)
