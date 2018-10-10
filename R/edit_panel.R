
#' Panel EDIT-S según capítulo
#'
#' Construye paneles renombrando las variables para el acople entre periodos.
#'
#' @param panel una cadena de texto. Selecciona el panel que será construido.
#' @param capitulo una cadena de texto o un vector de cadenas de texto. Selecciona el o los capítulos en el marco de datos.
#'
#' @return un marco de datos tibble.
#' @export
#'
#' @examples
#' edit_panel(panel = "p2", capitulo = "v")
#' edit_panel(panel = "p1", capitulo = "todos")
#'
edit_panel <- function(panel = "p3", capitulo, recod = TRUE, factor = FALSE, registro = NULL) {

  panel <- tolower(panel)

  panel_periodo <- function(datos1, datos2, panel, capitulo) {

    datos1 %>%
      setnames(old = edit_renombre(panel = panel, capitulo = capitulo)$Original,
               new = edit_renombre(panel = panel, capitulo = capitulo)$Nuevo) %>%
      bind_rows(datos2) -> datos

    return(datos)
  }

  datos <- switch (panel,
    p1 = panel_periodo(edit_capitulo(capitulo = capitulo, periodo = "ii", recod = recod, factor = factor),
                       edit_capitulo(capitulo = capitulo, periodo = "iii", recod = recod, factor = factor),
                       panel = panel, capitulo = capitulo),
    p2 = panel_periodo(edit_capitulo(capitulo = capitulo, periodo = "ii", recod = recod, factor = factor),
                        edit_capitulo(capitulo = capitulo, periodo = "iii", recod = recod, factor = factor),
                        panel = "p1", capitulo = capitulo) %>%
      panel_periodo(edit_capitulo(capitulo = capitulo, periodo = "iv", recod = recod, factor = factor),
                    panel = panel, capitulo = capitulo),
    p3 = panel_periodo(edit_capitulo(capitulo = capitulo, periodo = "ii", recod = recod, factor = factor),
                         edit_capitulo(capitulo = capitulo, periodo = "iii", recod = recod, factor = factor),
                         panel = "p1", capitulo = capitulo) %>%
      panel_periodo(edit_capitulo(capitulo = capitulo, periodo = "iv", recod = recod, factor = factor),
                    panel = "p2", capitulo = capitulo) %>%
      panel_periodo(edit_capitulo(capitulo = capitulo, periodo = "v", recod = recod, factor = factor),
                    panel = panel, capitulo = capitulo)
  )

    datos %>%
      select(Periodo, nordemp) %>%
      group_by(nordemp) %>%
      summarise(Registro = paste(Periodo, collapse = "-")) %>%
      left_join(datos) -> datos

    if (!is.null(registro)) {
      datos %>%
        filter(Registro == registro) -> datos
    }

  return(datos)
}
