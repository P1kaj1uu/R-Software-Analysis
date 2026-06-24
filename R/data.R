#' Medical Named Entity Recognition Dataset
#'
#' A sample medical named entity recognition (NER) dataset used by the
#' MedNERUtils package for demonstration and testing.
#'
#' @format A data frame with columns:
#' \describe{
#'   \item{id}{A unique record identifier.}
#'   \item{text}{The free-text medical record.}
#'   \item{annotations}{A list-column of data frames, each containing the
#'     entity annotations for the corresponding record with columns
#'     `entity`, `label`, `start_offset`, and `end_offset`.}
#' }
#' @source Anonymized sample data bundled with the MedNERUtils package.
#' @usage data(medical_ner)
"medical_ner"
