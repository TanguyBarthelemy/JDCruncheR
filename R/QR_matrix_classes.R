#' @title Objets bilan qualité
#'
#' @description
#' \code{QR_matrix()} permet de créer un objet de type \code{\link{QR_matrix}}
#' contenant un bilan qualité.
#'
#' \code{mQR_matrix()} permet de créer un objet de type \code{\link{mQR_matrix}}
#' qui est une liste de bilans qualité (donc d'objets \code{\link{QR_matrix}}).
#'
#' \code{is.QR_matrix()} et \code{is.mQR_matrix()} permettent de tester si un
#' objet est un bilan qualité ou une liste de bilans qualité.
#'
#'
#' @param modalities un \code{data.frame} contenant les modalités (Good, Bad,
#' etc.) associées aux variables.
#' @param values un \code{data.frame} contenant les valeurs (p-valeurs des
#' tests, statistiques, etc.) associées aux variables. Peut donc contenir plus
#' de variables que le data.frame \code{modalities}.
#' @param score_formula formule utilisée pour calculer le score global (s'il
#' existe).
#' @param x un objet de type \code{\link{QR_matrix}}, \code{\link{mQR_matrix}}
#' ou une liste d'objets \code{\link{QR_matrix}}.
#' @param ... des objets du même type que \code{x}.
#' @details Un objet  de type \code{\link{QR_matrix}} est une liste de trois
#' paramètres :
#' * le paramètre \code{modalities} est un \code{data.frame} contenant un
#'   ensemble de variables sous forme catégorielle (par défaut : Good,
#'   Uncertain, Bad, Severe).
#' * le paramètre \code{values}  est un \code{data.frame} contenant les valeurs
#'   associées aux indicateurs présents dans \code{modalities} (i.e. :
#'   p-valeurs, statistiques, etc.), ainsi que des variables qui n'ont pas de
#'   modalité (i.e. : fréquence de la série, modèle ARIMA, etc).
#' * le paramètre \code{score_formula} contient la formule utilisée pour
#'   calculer le score (une fois le calcul réalisé).
#'
#' @returns
#' \code{QR_matrix()} crée et renvoie un objet \code{\link{QR_matrix}}.
#' \code{mQR_matrix()} crée et renvoie un objet \code{\link{mQR_matrix}}
#' (c'est-à-dire une liste d'objets \code{\link{QR_matrix}}).
#' \code{is.QR_matrix()} et \code{is.mQR_matrix()} renvoient des valeurs
#' booléennes (\code{TRUE} ou \code{FALSE}).
#'
#' @encoding UTF-8
#' @keywords internal
#' @name fr-QR_matrix
NULL
#> NULL

#' @title Quality report objects
#'
#' @description
#' \code{mQR_matrix()} and \code{QR_matrix()} are creating one (or several)
#' quality report. The function
#' \code{is.QR_matrix()} and \code{is.mQR_matrix()} are functions to test
#' whether an object is a quality report or a list of quality reports.
#'
#' @param modalities a \code{data.frame} containing the output variables'
#' modalities (Good, Bad, etc.)
#' @param values a \code{data.frame} containing the output variables' values
#' (test p-values, test statistics, etc.) Therefore, the values data frame can
#' contain more variables than the data frame \code{modalities}.
#' @param score_formula the formula used to calculate the series score (if
#' defined).
#' @param x a \code{\link{QR_matrix}} object, a \code{\link{mQR_matrix}} object
#' or a list of \code{\link{QR_matrix}} objects.
#' @param ... objects of the same type as \code{x}.
#'
#' @details A\code{\link{QR_matrix}} object is a list of three items:
#' * \code{modalities}, a \code{data.frame} containing a set of categorical
#'   variables (by default: Good, Uncertain, Bad, Severe).
#' * \code{values}, a \code{data.frame} containing the values corresponding to
#'   the \code{modalities} indicators (i.e. p-values, statistics, etc.), as well
#'   as variables for which a modality cannot be defined (e.g. the series
#'   frequency, the ARIMA model, etc).
#' * \code{score_formula} contains the formula used to calculate the series
#'   score (once the calculus is done).
#'
#' @returns
#' \code{QR_matrix()} creates and returns a \code{\link{QR_matrix}} object.
#' \code{mQR_matrix()} creates and returns a \code{\link{mQR_matrix}} object
#' (ie. a list of \code{\link{QR_matrix}} objects). \code{is.QR_matrix()} and
#' \code{is.mQR_matrix()} return Boolean values (\code{TRUE} or \code{FALSE}).
#'
#' @examples
#' modalities <- data.frame(
#'     Quality = c("Good", "Uncertain", "Bad"),
#'     Seasonality = c("Good", "Good", "Bad")
#' )
#'
#' values <- data.frame(
#'     Quality = c(0.95, 0.75, 0.02),
#'     Seasonality = c(0.80, 0.60, 0.01),
#'     Period = c(12L, 12L, 12L)
#' )
#'
#' # Create two quality report objects
#' QR1 <- QR_matrix(
#'     modalities = modalities,
#'     values = values
#' )
#'
#' QR2 <- QR_matrix(
#'     modalities = modalities,
#'     values = values
#' )
#'
#' # Test whether an object is a quality report
#' is.QR_matrix(QR1)
#'
#' # Create a list of quality reports
#' mQR <- mQR_matrix(QR1, QR2)
#'
#' # Test whether an object is a list of quality reports
#' is.mQR_matrix(mQR)
#'
#' @encoding UTF-8
#' @family QR_matrix functions
#' @name QR_matrix
#' @seealso [Traduction française][fr-QR_matrix()]
#' @export
QR_matrix <- function(modalities = NULL, values = NULL, score_formula = NULL) {
    QR <- list(
        modalities = modalities,
        values = values,
        score_formula = score_formula
    )
    class(QR) <- "QR_matrix"
    QR
}

#' @export
#' @rdname QR_matrix
mQR_matrix <- function(x = list(), ...) {
    UseMethod("mQR_matrix", x)
}

#' @exportS3Method mQR_matrix QR_matrix
#' @method mQR_matrix QR_matrix
#' @rdname QR_matrix
#' @export
mQR_matrix.QR_matrix <- function(x = QR_matrix(), ...) {
    mQR <- c(list(x), list(...))
    class(mQR) <- "mQR_matrix"
    return(mQR)
}

#' @exportS3Method mQR_matrix mQR_matrix
#' @method mQR_matrix mQR_matrix
#' @rdname QR_matrix
#' @export
mQR_matrix.mQR_matrix <- function(x = mQR_matrix.default(), ...) {
    mQR <- c(x, ...)
    class(mQR) <- "mQR_matrix"
    return(mQR)
}

#' @exportS3Method mQR_matrix default
#' @method mQR_matrix default
#' @rdname QR_matrix
#' @export
mQR_matrix.default <- function(x = list(), ...) {
    mQR <- c(x, list(...))
    class(mQR) <- "mQR_matrix"
    return(mQR)
}

#' @rdname QR_matrix
#' @export
is.QR_matrix <- function(x) {
    return(inherits(x, "QR_matrix"))
}

#' @rdname QR_matrix
#' @export
is.mQR_matrix <- function(x) {
    return(inherits(x, "mQR_matrix"))
}
