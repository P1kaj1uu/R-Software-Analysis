#' @importFrom magrittr %>%
#' @import dplyr
#' @import ggplot2
NULL

#' Extract Entities by Label
#'
#' Collects all unique entity strings annotated with a given label.
#'
#' @param data A data frame of NER data as returned by
#'   [jiangzixuan_20231014669_load_medner_data()].
#' @param label Character string. The entity label to filter on (e.g.
#'   `"Disease"`, `"Drug"`).
#'
#' @return A character vector of unique entities matching `label`.
#'
#' @examples
#' \dontrun{
#' data <- jiangzixuan_20231014669_load_medner_data()
#' jiangzixuan_20231014669_extract_entities_by_label(data, label = "Disease")
#' }
#'
#' @export
jiangzixuan_20231014669_extract_entities_by_label <- function(data, label) {
  utils::globalVariables(c("label","entity","frequency"))
  all_annotations <- bind_rows(lapply(data$annotations, as.data.frame))

  entities <- all_annotations %>%
    filter(label == !!label) %>%
    pull(entity) %>%
    unique()

  return(entities)
}
