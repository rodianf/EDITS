
edit_diccionario <- function(periodo, col_types = "cccc") {
#library(readr)
  periodo <- switch (periodo,
    II = "https://docs.google.com/spreadsheets/d/e/2PACX-1vR7P2TuHZ2i8QdHpZl9ANGrzgsh1nO1jGUfwQ6naD-lbFIz3wgO3qyd7VppHC_FzIhTIi8gqBzI_d9M/pub?gid=1808765936&single=true&output=tsv",
    III = "https://docs.google.com/spreadsheets/d/e/2PACX-1vR7P2TuHZ2i8QdHpZl9ANGrzgsh1nO1jGUfwQ6naD-lbFIz3wgO3qyd7VppHC_FzIhTIi8gqBzI_d9M/pub?gid=1666308880&single=true&output=tsv",
    IV = "https://docs.google.com/spreadsheets/d/e/2PACX-1vR7P2TuHZ2i8QdHpZl9ANGrzgsh1nO1jGUfwQ6naD-lbFIz3wgO3qyd7VppHC_FzIhTIi8gqBzI_d9M/pub?gid=598829433&single=true&output=tsv",
    V = "https://docs.google.com/spreadsheets/d/e/2PACX-1vR7P2TuHZ2i8QdHpZl9ANGrzgsh1nO1jGUfwQ6naD-lbFIz3wgO3qyd7VppHC_FzIhTIi8gqBzI_d9M/pub?gid=193075046&single=true&output=tsv"
  )

  datos <- read_delim(periodo, delim = "\t", col_types = col_types)
  return(datos)

}
