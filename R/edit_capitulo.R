
#' Datos EDIT-S según capítulo y periodo
#'
#' Invoca los datos de la Encuesta de Desarrollo e Innovación Tecnológica en Servicios (EDIT-S) seleccionando los capítulos y períodos indicados.
#'
#' @param periodo una cadena de texto. Selecciona el periodo en el marco de datos. Este argumento puede tomar el valor `"ii"`, `"iii"`, `"iv"` o `"v"`.
#' @param capitulo una cadena de texto o un vector de cadenas de texto. Selecciona el o los capítulos en el marco de datos. Puede tomar los valores `"i"`, `"ii"`, `"iii"`, `"iv"`, `"v"`, `"vi"` o `"todos"`.
#'
#' @return un marco de datos tibble.
#' @export
#'
#' @examples
#' edit_capitulo(capitulo = "ii", periodo = "iii")
#' edit_capitulo(capitulo = c("i","iv"), periodo = "v")
#'
edit_capitulo <- function(periodo, capitulo, recod = TRUE, factor = FALSE) {

  plantilla_columnas %>%
    filter(capitulos %in% capitulo) %>%
    .$columnas %>%
    paste(collapse = "|") -> columnas

  # Lectura de datos ====
  periodo_datos <- switch (periodo,
                       ii = Estructura_EDIT_SERVICIOS_II_2008_2009,
                       iii = Estructura_EDIT_SERV_III_2010_2011,
                       iv = Estructura_EDIT_SERVICIOS_IV_2012_2013,
                       v = Estructura_EDIT_SERVICIOS_V_2014_2015
  )

  # Incluir variable Periodo
  periodo_datos %>%
    select(1:3, matches(columnas)) %>%
    mutate(Periodo = periodo) %>%
    select(Periodo, everything()) -> datos

  # Recodificación de variables
  if (recod) {
    datos %>% edit_recode(capitulo = capitulo,
                         periodo = periodo,
                         factor = factor,
                         var = "sino") %>%
      edit_recode(capitulo = capitulo,
                  periodo = periodo,
                  factor = factor,
                  var = "amn") %>%
      edit_recode(capitulo = capitulo,
                  periodo = periodo,
                  factor = factor,
                  var = "ben") -> datos
  }


  return(datos)

}
