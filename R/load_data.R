#' Load Medical NER Data
#'
#' Loads the bundled medical named entity recognition (NER) dataset
#' (`medical_ner`) shipped with the MedNERUtils package.
#'
#' @return A data frame with columns `id`, `text`, and `annotations`, where
#'   `annotations` is a list-column of data frames containing the entity
#'   annotations (`entity`, `label`, `start_offset`, `end_offset`) for each
#'   record.
#'
#' @examples
#' \dontrun{
#' data <- jiangzixuan_20231014669_load_medner_data()
#' head(data)
#' }
#'
#' @export
jiangzixuan_20231014669_load_medner_data <- function() {
  utils::globalVariables(c("label","entity","frequency"))
  utils::data("medical_ner", package = "MedNERUtils")
  return(medical_ner)
}
