#' Set values for thresholds
#'
#' @param test_name String. The name of the test to update.
#' @param thresholds Named vector of numerics. The upper values of
#' each break of a threshold.
#'
#' @details
#' If \code{test_name} is missing, the argument \code{thresholds} is not used
#' and all thresholds will be updated to their default values.
#'
#' If \code{test_name} is not missing, but if the argument \code{thresholds} is
#' missing then only the thresholds of the test \code{test_name} will be updated
#' to its default values.
#'
#' Finally, if \code{test_name} and \code{thresholds} are not missing, then only
#' the thresholds of the test \code{test_name} are updated with the value
#' \code{thresholds}.
#'
#' @export
#' @examples
#'
#' # Set "m7"
#' set_thresholds(
#'     test_name = "m7",
#'     thresholds = c(Good = 0.8, Bad = 1.4, Severe = Inf)
#' )
#'
#' # Set "oos_mean" to default
#' set_thresholds(test_name = "oos_mean")
#'
#' # Set all thresholds to default
#' set_thresholds()
#'
set_thresholds <- function(test_name, thresholds) {
    default_thresholds <- get_thresholds(default = TRUE)
    if (missing(test_name)) {
        all_thresholds <- default_thresholds
    } else {
        all_thresholds <- get_thresholds(default = FALSE)
        if (missing(thresholds)) {
            all_thresholds[[test_name]] <- default_thresholds[[test_name]]
        } else {
            all_thresholds[[test_name]] <- thresholds
        }
    }
    options(jdc_thresholds = all_thresholds)
    return(invisible(all_thresholds))
}

#' Get all (default) thresholds
#'
#' @param test_name String. The name of the test to get.
#' @param default Boolean. (default is TRUE)
#' If TRUE, the default threshold will be returned.
#' If FALSE the current used thresholds.
#'
#' @details
#' If \code{test_name} is missing, all threshold will be returned.
#'
#' @export
#' @examples
#'
#' # Get all default thresholds
#' get_thresholds(default = TRUE)
#'
#' # Get all current thresholds
#' get_thresholds(default = FALSE)
#'
#' # Get all current thresholds
#' get_thresholds(test_name = "oos_mean", default = FALSE)
#'
get_thresholds <- function(test_name, default = TRUE) {
    def1 <- c(Severe = 0.001, Bad = 0.01, Uncertain = 0.05, Good = Inf)
    def2 <- c(Bad = 0.01, Uncertain = 0.1, Good = Inf)
    def3 <- c(Good = 1., Bad = 2., Severe = Inf)
    def4 <- c(Good = 1., Bad = Inf)
    def5 <- c(Good = 3., Uncertain = 5., Bad = Inf)
    def6 <- c(Good = 0., Uncertain = 1., Bad = 3., Severe = 5.)

    default_thresholds <- list(
        qs_residual_sa_on_sa = def1,
        qs_residual_sa_on_i = def1,

        f_residual_sa_on_sa = def1,
        f_residual_sa_on_i = def1,

        f_residual_td_on_sa = def1,
        f_residual_td_on_i = def1,

        residuals_independency = def2,
        residuals_homoskedasticity = def2,

        residuals_skewness = def2,
        residuals_kurtosis = def2,
        residuals_normality = def2,

        oos_mean = def2,
        oos_mse = def2,

        m7 = def3,
        q = def4,
        q_m2 = def4,
        pct_outliers = def5,

        grade = def6
    )

    if (default) {
        thresholds <- default_thresholds
    } else {
        thresholds <- getOption("jdc_thresholds")
    }

    if (missing(test_name)) {
        return(thresholds)
    } else {
        return(thresholds[[test_name]])
    }
}
