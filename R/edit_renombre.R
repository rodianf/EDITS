#' Plantilla para renombre de variables
#'
#' @param panel una cadena de texto. Selecciona la plantilla de renombre para el panel especificado.
#' @param capitulo una cadena de texto o un vector de cadenas de texto. Selecciona la plantilla de renombre para el capítulo o los capítulos del panel especificado.
#'
#' @return un marco de datos tibble.
#' @export
#'
edit_renombre <- function(panel = NULL, capitulo = NULL) {

  rename_template <- EDIT_panel_R1 %>%
    bind_rows(EDIT_panel_R2) %>%
    bind_rows(EDIT_panel_R3)

  plantilla_columnas %>%
    filter(capitulos %in% capitulo) %>%
    .$columnas %>%
    paste(collapse = "|") -> columnas

  regexpcap <- paste0(columnas, "|TIPO{1}|CIIU{1}")

  rename_template %>%
    filter(tolower(Panel) == panel) %>%
    slice(grep(regexpcap, Original)) -> datos

  return(datos)

}

