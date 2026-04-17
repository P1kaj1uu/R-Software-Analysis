#' @export
visualize_entity_distribution <- function(data, title = "Distribution of Medical Entity Types") {
  entity_counts <- get_entity_counts(data)
  
  plot <- ggplot(entity_counts, aes(x = reorder(label, -count), y = count, fill = label)) +
    geom_bar(stat = "identity", alpha = 0.8) +
    labs(
      title = title,
      x = "Entity Label",
      y = "Number of Entities"
    ) +
    theme_minimal() +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      legend.position = "none",
      plot.title = element_text(hjust = 0.5, size = 14, face = "bold")
    )
  
  return(plot)
}
