
#' Recodifica variables categóricas
#'
#' @param datos
#' @param capitulo
#' @param periodo
#' @param panel
#' @param factor
#' @param var
#'
#' @return
#' @export
#'
#' @examples
edit_recode <- function(datos, capitulo, periodo, panel = NULL, factor = FALSE, var = "sino") {

  # Funciones recodificadoras
  edit_sino <- function(x, factor = FALSE) {

    # Convertir en NA si el valor no se encuentra en el rango
    x[x != 1 & x != 2] <- NA
    x <- as.numeric(x)

    # Convertir en factor
    if (factor == TRUE) {
      x <- factor(x, levels = c(1,2),
                  labels = c("Si","No"))
    }
    return(x)
  }

  edit_amn <- function(x, factor = FALSE) {

    # Convertir en NA si el valor no se encuentra en el rango
    x[x != 1 & x != 2 & x != 3] <- NA
    x <- as.numeric(x)

    # Convertir en factor
    if (factor == TRUE) {
      x <- factor(x, levels = c(1,2,3),
                  labels = c("Alta","Media","Nula"))
    }
    return(x)
  }

  edit_ben <- function(x, factor = FALSE) {

    # Convertir en NA si el valor no se encuentra en el rango
    x[x != 1 & x != 2 & x != 3 & x != 4] <- NA
    x <- as.numeric(x)

    # Convertir en factor
    if (factor == TRUE) {
      x <- factor(x, levels = c(1,2,3,4),
                  labels = c("Obtuvo beneficios tributarios",
                             "Solicitó beneficios tributarios, pero no los obtuvo",
                             "Tuvo la intención de solicitar beneficios tributarios, pero no lo hizo",
                             "No quiso solicitar beneficios tributarios"))
    }
    return(x)
  }

  # Recodificacion ====
  capreg <- as.character(plantilla_columnas[which(plantilla_columnas$capitulos == capitulo),2])

  edit_dicc(periodo = periodo, panel = panel) %>%
    select(Name, Var) %>%
    filter(grepl(capreg, Name),
           Var %in% var) %>%
    pull(Name) -> columnas

  datos <- switch (var,
    sino = datos %>% mutate_at(.vars = columnas,
                               .funs = funs(edit_sino(., factor = factor))),
    amn = datos %>% mutate_at(.vars = columnas,
                              .funs = funs(edit_amn(., factor = factor))),
    ben = datos %>% mutate_at(.vars = columnas,
                              .funs = funs(edit_ben(., factor = factor)))
  )

  return(datos)

}
