#' @importFrom dplyr bind_rows group_by summarise arrange filter pull
#' @importFrom ggplot2 ggplot geom_bar labs theme_minimal theme element_text
NULL

#' Count Entities by Label
#'
#' Computes the number of annotated entities for each entity label across all
#' records in the dataset.
#'
#' @param data A data frame of NER data as returned by
#'   [jiangzixuan_20231014669_load_medner_data()], containing an `annotations`
#'   list-column.
#'
#' @return A data frame with columns `label` and `count`, sorted in descending
#'   order of `count`.
#'
#' @examples
#' \dontrun{
#' data <- jiangzixuan_20231014669_load_medner_data()
#' jiangzixuan_20231014669_get_entity_counts(data)
#' }
#'
#' @export
jiangzixuan_20231014669_get_entity_counts <- function(data) {
  utils::globalVariables(c("label","entity","frequency"))
  all_annotations <- bind_rows(lapply(data$annotations, as.data.frame))

  entity_counts <- all_annotations %>%
    group_by(label) %>%
    summarise(count = n(), .groups = "drop") %>%
    arrange(desc(count))

  return(entity_counts)
}

#' Get Top Entities
#'
#' Returns the most frequent entities, optionally restricted to a single label.
#'
#' @param data A data frame of NER data as returned by
#'   [jiangzixuan_20231014669_load_medner_data()].
#' @param n Integer. Number of top entities to return. Defaults to `10`.
#' @param label Optional character string. If supplied, only entities of this
#'   label are considered. Defaults to `NULL` (all labels).
#'
#' @return A data frame with columns `entity`, `label`, and `frequency`, sorted
#'   in descending order of `frequency`.
#'
#' @examples
#' \dontrun{
#' data <- jiangzixuan_20231014669_load_medner_data()
#' jiangzixuan_20231014669_get_top_entities(data, n = 5)
#' }
#'
#' @export
jiangzixuan_20231014669_get_top_entities <- function(data, n = 10, label = NULL) {
  utils::globalVariables(c("label","entity","frequency"))
  all_annotations <- bind_rows(lapply(data$annotations, as.data.frame))

  if (!is.null(label)) {
    all_annotations <- all_annotations %>%
      filter(label == !!label)
  }

  top_entities <- all_annotations %>%
    group_by(entity, label) %>%
    summarise(frequency = n(), .groups = "drop") %>%
    arrange(desc(frequency)) %>%
    head(n)

  return(top_entities)
}
