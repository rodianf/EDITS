
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
#' edit_panel(panel = "pii", capitulo = "v")
#' edit_panel(panel = "pi", capitulo = "todos")
#'
edit_panel <- function(panel, capitulo) {

  panel_periodo <- function(datos1, datos2, panel, capitulo) {

    datos1 %>%
      setnames(old = edit_renombre(panel = panel, capitulo = capitulo)$Original,
               new = edit_renombre(panel = panel, capitulo = capitulo)$Nuevo) %>%
      bind_rows(datos2) -> datos

    return(datos)
  }

  datos <- switch (panel,
    pi = panel_periodo(edit_capitulo(capitulo = capitulo, periodo = "ii"),
                       edit_capitulo(capitulo = capitulo, periodo = "iii"),
                       panel = panel, capitulo = capitulo),
    pii = panel_periodo(edit_capitulo(capitulo = capitulo, periodo = "ii"),
                        edit_capitulo(capitulo = capitulo, periodo = "iii"),
                        panel = "pi", capitulo = capitulo) %>%
      panel_periodo(edit_capitulo(capitulo = capitulo, periodo = "iv"),
                    panel = panel, capitulo = capitulo),
    piii = panel_periodo(edit_capitulo(capitulo = capitulo, periodo = "ii"),
                         edit_capitulo(capitulo = capitulo, periodo = "iii"),
                         panel = "pi", capitulo = capitulo) %>%
      panel_periodo(edit_capitulo(capitulo = capitulo, periodo = "iv"),
                    panel = "pii", capitulo = capitulo) %>%
      panel_periodo(edit_capitulo(capitulo = capitulo, periodo = "v"),
                    panel = panel, capitulo = capitulo)
  )

  return(datos)
}
