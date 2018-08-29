library(readr)
# II
Estructura_EDIT_SERVICIOS_II_2008_2009 <- read_delim("data-raw/Estructura_EDIT_SERVICIOS_II_2008_2009.csv",
                                                     ";", escape_double = FALSE, trim_ws = TRUE,
                                                     col_types = paste(edit_diccionario(periodo = "II")$Type, collapse = ''))

# III
Estructura_EDIT_SERV_III_2010_2011 <- read_delim("data-raw/Estructura_EDIT_SERV_III_2010_2011.csv",
                                                     ";", escape_double = FALSE, trim_ws = TRUE,
                                                     col_types = paste(edit_diccionario(periodo = "III")$Type, collapse = ''))

# IV
Estructura_EDIT_SERVICIOS_IV_2012_2013 <- read_delim("data-raw/Estructura_EDIT_SERVICIOS_IV_2012_2013.csv",
                                                     ";", escape_double = FALSE, trim_ws = TRUE,
                                                     col_types = paste(edit_diccionario(periodo = "IV")$Type, collapse = ''))

# IV
Estructura_EDIT_SERVICIOS_V_2014_2015 <- read_delim("data-raw/Estructura_EDIT_SERVICIOS_V_2014_2015.csv",
                                                     ";", escape_double = FALSE, trim_ws = TRUE,
                                                     col_types = paste(edit_diccionario(periodo = "V")$Type, collapse = ''))

devtools::use_data(Estructura_EDIT_SERVICIOS_II_2008_2009,
                   Estructura_EDIT_SERV_III_2010_2011,
                   Estructura_EDIT_SERVICIOS_IV_2012_2013,
                   Estructura_EDIT_SERVICIOS_V_2014_2015,
                   overwrite = TRUE, compress = "bzip2")
