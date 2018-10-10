
#' Diccionarios EDIT-S
#'
#' Carga un diccionario de la base de datos EDIT-S al ambiente global
#'
#' @param periodo una cadena de texto. Selecciona el periodo del diccionario.
#' @param panel una cadena de texto. Selecciona el panel del diccionario.
#' @param col_types una cadena de texto. Especifica el tipo de columnas que compone la base de datos del diccionario.
#'
#' @return un data frame con el diccionario seleccionado.
#' @export
#'
#' @examples
#' edit_diccionario(periodo = "ii")
#'
edit_dicc <- function(periodo=NULL, panel=NULL, col_types = "cccc") {

  if (is.null(panel)) {
    periodo <- tolower(periodo)
    dicc_name <- periodo
    dicc <- switch (periodo,
    ii = dicc_II,
    iii = dicc_III,
    iv = dicc_IV,
    v = dicc_V
  )
  } else {
    panel <- tolower(panel)
    dicc_name <- panel
    dicc <- switch (panel,
      p1 = dicc_P1,
      p2 = dicc_P2,
      p3 = dicc_P3
    )
  }

  #assign(paste0("dicc_", dicc_name), dicc, envir = .GlobalEnv)
  return(dicc)

}
