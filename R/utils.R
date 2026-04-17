#' @importFrom magrittr %>%
#' @import dplyr
#' @import ggplot2
NULL

#' @export
validate_ner_format <- function(data) {
  # 检查必要的字段是否存在
  required_fields <- c("id", "text", "annotations")
  if (!all(required_fields %in% names(data))) {
    warning("缺少必要的字段: id, text, annotations")
    return(FALSE)
  }
  
  # 检查注释字段的结构
  for (i in seq_len(nrow(data))) {
    ann <- data$annotations[[i]]
    if (!is.data.frame(ann) || nrow(ann) == 0) next
    
    ann_fields <- c("entity", "label", "start_offset", "end_offset")
    if (!all(ann_fields %in% names(ann))) {
      warning(paste("注释格式无效于文档", data$id[i]))
      return(FALSE)
    }
  }
  
  return(TRUE)
}
