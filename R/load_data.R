#' @export
load_medner_data <- function() {
  utils::data("medical_ner", package = "MedNERUtils")
  return(medical_ner)
}
