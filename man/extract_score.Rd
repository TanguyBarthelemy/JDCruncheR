% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/QR_functions.R
\name{extract_score}
\alias{extract_score}
\title{Extraction du score}
\usage{
extract_score(
  x,
  format_output = c("data.frame", "vector"),
  weighted_score = FALSE
)
}
\arguments{
\item{x}{objet de type \code{QR_matrix} ou \code{mQR_matrix}.}

\item{format_output}{chaîne de caractères indiquant le format de l'objet en sortie :
soit un \code{data.frame} soit un \code{vector}.}

\item{weighted_score}{booléen indiquant s'il faut extraire le score pondéré (s'il existe) ou le score non pondéré.
Par défaut, c'est le score non pondéré qui est extrait.}
}
\description{
Permet d'extraire le score des objets \code{QR_matrix} ou \code{mQR_matrix}.
}
\details{
Pour les objets \code{QR_matrix}, le score renvoyé est soit l'objet \code{NULL} si aucun score n'a été calculé, soit un vecteur.
Pour les objets \code{mQR_matrix}, c'est une liste de scores (\code{NULL} ou un vecteur).
}
\examples{
\dontrun{
QR <- extract_QR()
mQR <- mQR_matrix(QR, compute_score(QR))
extract_score(QR) # NULL
extract_score(mQR) # liste dont le premier Ã©lÃ©ment est NULL
}
}
\seealso{
Other QR_matrix functions: 
\code{\link{compute_score}()},
\code{\link{export_xlsx.QR_matrix}()},
\code{\link{export_xlsx.mQR_matrix}()},
\code{\link{extract_QR}()},
\code{\link{rbind.QR_matrix}()},
\code{\link{sort}()},
\code{\link{weighted_score}()}
}
\concept{QR_matrix functions}