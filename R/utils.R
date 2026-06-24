#' @importFrom magrittr %>%
#' @import dplyr
#' @import ggplot2
NULL

#' Validate NER Data Format
#'
#' Checks whether a dataset conforms to the expected MedNERUtils structure: each
#' row must have `id`, `text`, and `annotations` fields, and every non-empty
#' annotation data frame must contain `entity`, `label`, `start_offset`, and
#' `end_offset` columns.
#'
#' @param data A data frame of NER data to validate.
#'
#' @return `TRUE` if the data conforms to the expected format; otherwise `FALSE`
#'   (with a warning describing the problem).
#'
#' @examples
#' \dontrun{
#' data <- jiangzixuan_20231014669_load_medner_data()
#' jiangzixuan_20231014669_validate_ner_format(data)
#' }
#'
#' @export
jiangzixuan_20231014669_validate_ner_format <- function(data) {
  utils::globalVariables(c("label","entity","frequency"))
  required_fields <- c("id", "text", "annotations")
  if (!all(required_fields %in% names(data))) {
    warning("id, text, annotations")
    return(FALSE)
  }

  for (i in seq_len(nrow(data))) {
    ann <- data$annotations[[i]]
    if (!is.data.frame(ann) || nrow(ann) == 0) next

    ann_fields <- c("entity", "label", "start_offset", "end_offset")
    if (!all(ann_fields %in% names(ann))) {
      warning(paste("hi", data$id[i]))
      return(FALSE)
    }
  }

  return(TRUE)
}
