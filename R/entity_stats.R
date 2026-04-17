#' @importFrom dplyr bind_rows group_by summarise arrange filter pull
#' @importFrom ggplot2 ggplot geom_bar labs theme_minimal theme element_text
NULL

#' @export
get_entity_counts <- function(data) {
  all_annotations <- bind_rows(lapply(data$annotations, as.data.frame))
  
  # 按标签统计数量
  entity_counts <- all_annotations %>%
    group_by(label) %>%
    summarise(count = n(), .groups = "drop") %>%
    arrange(desc(count))
  
  return(entity_counts)
}

#' @export
get_top_entities <- function(data, n = 10, label = NULL) {
  all_annotations <- bind_rows(lapply(data$annotations, as.data.frame))
  
  # 如果指定了标签，进行过滤
  if (!is.null(label)) {
    all_annotations <- all_annotations %>%
      filter(label == !!label)
  }
  
  # 统计实体出现频率
  top_entities <- all_annotations %>%
    group_by(entity, label) %>%
    summarise(frequency = n(), .groups = "drop") %>%
    arrange(desc(frequency)) %>%
    head(n)
  
  return(top_entities)
}
