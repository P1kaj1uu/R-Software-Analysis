#' Visualize Entity Distribution
#'
#' Creates a bar chart showing the number of entities per label, sorted from
#' most to least frequent.
#'
#' @param data A data frame of NER data as returned by
#'   [jiangzixuan_20231014669_load_medner_data()].
#' @param title Character string. The plot title. Defaults to
#'   `"Distribution of Medical Entity Types"`.
#'
#' @return A [ggplot2::ggplot()] object.
#'
#' @examples
#' \dontrun{
#' data <- jiangzixuan_20231014669_load_medner_data()
#' jiangzixuan_20231014669_visualize_entity_distribution(data)
#' }
#'
#' @export
jiangzixuan_20231014669_visualize_entity_distribution <- function(data, title = "Distribution of Medical Entity Types") {
  utils::globalVariables(c("label","entity","frequency"))
  entity_counts <- jiangzixuan_20231014669_get_entity_counts(data)

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
