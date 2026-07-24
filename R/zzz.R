#' @keywords internal
.onLoad <- function(libname, pkgname) {
    if (is.null(getOption("JDCruncheR.thresholds"))) {
        set_thresholds()
    }
}
