#' @title Objets de classe JVS_matrix
#'
#' @description
#' Un objet \code{JVS_matrix()} est créé d'après le modèle du plug-in
#' d'Eurostat JVS.
#'
#' @param x un \code{data.frame} contenant les résultats des tests(p-values,
#'   statistiques, etc.) et des modalitéss (Yes/No) en cas de présence d'une
#'   variable ou d'un indicateur.
#'
#' @details Un objet de classe \code{\link{JVS_matrix}} est un data.frame avec
#' 30 colonnes :
#'
#' * Series
#' * Method
#' * Period
#' * Nobs
#' * Start
#' * End
#' * Adjustment
#' * Presence of Seasonality in the Raw Series
#' * Presence of TD effects
#' * Log-Transformation
#' * ARIMA Model
#' * LeapYear
#' * MovingHoliday
#' * NbTD
#' * Noutliers
#' * Outlier1
#' * Outlier2
#' * Outlier3
#' * Residual Seasonality in SA Series (F-test)
#' * Residual TD Effect
#' * Q-Stat (for X13)
#' * Final Henderson Filter
#' * Stage 2 Henderson Filter
#' * Seasonal Filter
#' * Quality
#' * Autocorrelation of order 1 of the SA series
#' * Ljung-Box Test (P-value)
#' * Autocorrelation negative and significant
#' * Irregular Standard-Deviation
#' * Max-Adj
#'
#' @returns
#' \code{JVS_matrix()} renvoie un objet de classe \code{\link{JVS_matrix}}.
#'
#' @encoding UTF-8
#' @keywords internal
#' @name fr-JVS_matrix
NULL
#> NULL

#' @title JVS matrix object
#'
#' @description
#' \code{JVS_matrix()} are creating a quality report based on the Eurostat JVS
#' Plug-In.
#'
#' @param x a \code{data.frame} containing the output variables' values
#' (test p-values, test statistics, etc.) and modalities (Yes/No).
#'
#' @details A\code{\link{JVS_matrix}} object is a data.frame with 30 items:
#'
#' * Series
#' * Method
#' * Period
#' * Nobs
#' * Start
#' * End
#' * Adjustment
#' * Presence of Seasonality in the Raw Series
#' * Presence of TD effects
#' * Log-Transformation
#' * ARIMA Model
#' * LeapYear
#' * MovingHoliday
#' * NbTD
#' * Noutliers
#' * Outlier1
#' * Outlier2
#' * Outlier3
#' * Residual Seasonality in SA Series (F-test)
#' * Residual TD Effect
#' * Q-Stat (for X13)
#' * Final Henderson Filter
#' * Stage 2 Henderson Filter
#' * Seasonal Filter
#' * Quality
#' * Autocorrelation of order 1 of the SA series
#' * Ljung-Box Test (P-value)
#' * Autocorrelation negative and significant
#' * Irregular Standard-Deviation
#' * Max-Adj
#'
#' @returns
#' \code{JVS_matrix()} creates and returns a \code{\link{JVS_matrix}} object.
#'
#' @examples
#' JVS_data <- data.frame(
#'     Series = "Series 1",
#'     Method = "X13",
#'     Period = 12L,
#'     Nobs = 300L,
#'     Start = "2000-01-01",
#'     End = "2024-12-01",
#'     Adjustment = "SA",
#'     `Presence of Seasonality in the Raw Series` = "Yes",
#'     `Presence of TD effects` = "No",
#'     `Log-Transformation` = "No",
#'     `ARIMA Model` = "(0,1,1)(0,1,1)",
#'     LeapYear = "Yes",
#'     MovingHoliday = "No",
#'     NbTD = 0L,
#'     Noutliers = 1L,
#'     Outlier1 = "AO (2020-01)",
#'     Outlier2 = "AO (2018-11)",
#'     Outlier3 = NA_character_,
#'     `Residual Seasonality in SA Series (F-test)` = "No",
#'     `Residual TD Effect` = "No",
#'     `Q-Stat (for X13)` = "Good",
#'     `Final Henderson Filter` = "H13",
#'     `Stage 2 Henderson Filter` = "H13",
#'     `Seasonal Filter` = "S3X5",
#'     Quality = "Good",
#'     `Autocorrelation of order 1 of the SA series` = 0.2,
#'     `Ljung-Box Test (P-value)` = 0.8,
#'     `Autocorrelation negative and significant` = "",
#'     `Irregular Standard-Deviation` = 0.8,
#'     `Max-Adj` = 2.5
#' )
#'
#' # Create a JVS_matrix object
#' JVS <- JVS_matrix(JVS_data)
#'
#' # Check the class of the object
#' class(JVS)
#'
#' @encoding UTF-8
#' @name JVS_matrix
#' @export
#' @seealso [Traduction française][fr-JVS_matrix()]
JVS_matrix <- function(x = list()) {
    UseMethod("JVS_matrix", x)
}

#' @rdname JVS_matrix
#' @exportS3Method JVS_matrix data.frame
#' @method JVS_matrix data.frame
#' @export
JVS_matrix.data.frame <- function(x) {
    class(x) <- c("JVS_matrix", "data.frame")
    return(x)
}

#' @rdname JVS_matrix
#' @exportS3Method JVS_matrix JVS_matrix
#' @method JVS_matrix JVS_matrix
#' @export
JVS_matrix.JVS_matrix <- function(x) {
    return(x)
}

#' @rdname JVS_matrix
#' @exportS3Method JVS_matrix default
#' @method JVS_matrix default
#' @export
JVS_matrix.default <- function(x) {
    stop("A JVS_matrix or data.frame object is required!", call. = FALSE)
}
