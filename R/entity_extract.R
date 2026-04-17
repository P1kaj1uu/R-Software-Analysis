#' @importFrom magrittr %>%
#' @import dplyr
#' @import ggplot2
NULL

#' @export
extract_entities_by_label <- function(data, label) {
  all_annotations <- bind_rows(lapply(data$annotations, as.data.frame))
  
  entities <- all_annotations %>%
    filter(label == !!label) %>%
    pull(entity) %>%
    unique()
  
  return(entities)
}
