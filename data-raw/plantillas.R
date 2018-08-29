# Plantillas de renombre y columnas

library(readr)
library(dplyr)

EDIT_panel_R1 <- read_csv("data-raw/EDIT_panel_R1.csv", col_types = "cc") %>%
  mutate(Panel = "PI") %>%
  select(Panel, everything())
EDIT_panel_R2 <- read_csv("data-raw/EDIT_panel_R2.csv", col_types = "cc") %>%
  mutate(Panel = "PII") %>%
  select(Panel, everything())
EDIT_panel_R3 <- read_csv("data-raw/EDIT_panel_R3.csv", col_types = "cc") %>%
  mutate(Panel = "PIII") %>%
  select(Panel, everything())

plantilla_columnas <- data.frame(capitulos = c("todos","i","ii","iii","iv","v","vi"),
                                 columnas = c(".","^I{1}\\d","^I{2}\\d","^I{3}\\d","^IV{1}\\d","^V{1}\\d","^VI{1}\\d"))

devtools::use_data(EDIT_panel_R1,
                   EDIT_panel_R2,
                   EDIT_panel_R3,
                   plantilla_columnas,
                   internal = TRUE,
                   overwrite = TRUE)
