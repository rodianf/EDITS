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

dicc_II <- read_delim("data-raw/EDIT\ data\ dictionary\ -\ II.tsv", delim = "\t", col_types = "cccc")
dicc_III <- read_delim("data-raw/EDIT\ data\ dictionary\ -\ III.tsv", delim = "\t", col_types = "cccc")
dicc_IV <- read_delim("data-raw/EDIT\ data\ dictionary\ -\ IV.tsv", delim = "\t", col_types = "cccc")
dicc_V <- read_delim("data-raw/EDIT\ data\ dictionary\ -\ V.tsv", delim = "\t", col_types = "cccc")
dicc_P1 <- read_delim("data-raw/EDIT\ data\ dictionary\ -\ P1.tsv", delim = "\t", col_types = "cccc")
dicc_P2 <- read_delim("data-raw/EDIT\ data\ dictionary\ -\ P2.tsv", delim = "\t", col_types = "cccc")
dicc_P3 <- read_delim("data-raw/EDIT\ data\ dictionary\ -\ P3.tsv", delim = "\t", col_types = "cccc")

devtools::use_data(EDIT_panel_R1,
                   EDIT_panel_R2,
                   EDIT_panel_R3,
                   dicc_II,
                   dicc_III,
                   dicc_IV,
                   dicc_V,
                   dicc_P1,
                   dicc_P2,
                   dicc_P3,
                   plantilla_columnas,
                   internal = TRUE,
                   overwrite = TRUE)
