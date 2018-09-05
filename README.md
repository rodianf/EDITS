
<!-- README.md is generated from README.Rmd. Please edit that file -->
EDITS
=====

Descripción
-----------

`EDITS` es una herramienta que permite procesar los datos de la Encuesta de Desarrollo e Innovación Tecnológica en Servicios (EDIT-S) suministrada por el Departamento Administrativo Nacional de Estadística: www.dane.gov.co. Con `EDITS` se pueden invocar los marcos de datos originales según período y capítulo, así como los páneles involucrando dos, tres o los cuatro períodos que incluye la encuesta, también según capítulo.

Instalación
-----------

`EDITS` se puede instalar a partir del respositorio en Github mediante la función `install_github` del paquete `devtools`. Es posible que en instalaciones nuevas de R se instalen adicionalmente otros paquetes necesarios para el funcionamiento de `EDITS`.

``` r
install.packages("devtools")
devtools::install_github("rodianf/EDITS")

library(EDITS)
```

Uso
---

### Argumentos

Las funciones de `EDITS` presentan principalmente tres argumentos: `periodo`, `capitulo` y `panel`.

#### `periodo`

Es el periodo de referencia (dos años) objeto de estudio de la encuesta.

-   `ii`: 2008-2009
-   `iii`: 2010-2011
-   `iv`: 2012-2013
-   `v`: 2014-2015

#### `capitulo`

La información capturada se clasificó en seis capítulo según los aspectos de interés.

-   `i`: Innovación y su impacto en la empresa en el período de referencia.
-   `ii`: Inversión en actividades científicas, tecnológicas y de innovación ACTI en el período de referencia.
-   `iii`: Financiamiento de las actividades científicas, tecnológicas y de innovación en el período de referencia.
-   `iv`: Personal ocupado relacionado con ACTI en el período de referencia.
-   `v`: Relaciones con actores del Sistema SNCTI y cooperación para la innovación en el período de referencia.
-   `vi`: Propiedad intelectual, certificaciones de calidad, normas técnicas y reglamentos técnicos en el período de referencia.
-   `todos`: Incluye en el marco de datos final todos los capítulos de la encuesta.

#### `panel`

El panel hace referencia a la compilación de dos a cuatro períodos de referencia.

-   `p1`: Períodos `ii` y `iii`.
-   `p2`: Períodos `ii`, `iii` y `iv`.
-   `p3`: Períodos `ii`, `iii`, `iv` y `v`.

### Funciones

#### `edit_capitulo`

Esta función lee los datos de la encuesta y devuelve un marco de datos *tibble* del período y capítulos especificados.

``` r
edit_capitulo(periodo = "ii", capitulo = "i")
#> # A tibble: 3,662 x 49
#>    Periodo nordemp CIIU3 TIPOLOGIA I1R1C1 I1R1C2 I1R2C1 I1R2C2 I1R3C1
#>    <chr>     <int> <dbl> <chr>      <int>  <dbl>  <int>  <dbl>  <int>
#>  1 ii            1    40 INNO           1      9      2     NA      2
#>  2 ii            2    40 INNO           2     NA      2     NA      2
#>  3 ii            4    40 INNO           2     NA      2     NA      2
#>  4 ii            5    40 NOINNO         2     NA      2     NA      2
#>  5 ii            6    40 INNO           1      4      1      2      2
#>  6 ii            7    40 INNO           1      1      2     NA      2
#>  7 ii            8    40 NOINNO         2     NA      2     NA      2
#>  8 ii           10    40 NOINNO         2     NA      2     NA      2
#>  9 ii           11    40 NOINNO         2     NA      2     NA      2
#> 10 ii           12    40 INNO           1     15      2     NA      2
#> # ... with 3,652 more rows, and 40 more variables: I1R3C2 <dbl>,
#> #   I1R4C1 <int>, I1R4C2 <dbl>, I1R5C1 <int>, I1R5C2 <dbl>, I1R6C1 <int>,
#> #   I1R6C2 <dbl>, I2R1C1 <int>, I2R2C1 <int>, I2R3C1 <int>, I2R4C1 <int>,
#> #   I2R5C1 <int>, I2R6C1 <int>, I2R7C1 <int>, I2R8C1 <int>, I2R9C1 <int>,
#> #   I2R10C1 <int>, I2R11C1 <int>, I3R1C1 <dbl>, I3R1C2 <dbl>,
#> #   I3R2C1 <dbl>, I3R2C2 <dbl>, I3R3C1 <dbl>, I3R3C2 <dbl>, I4R1C1 <int>,
#> #   I5R1C1 <int>, I6R1C1 <int>, I6R2C1 <int>, I6R3C1 <int>, I6R4C1 <int>,
#> #   I6R5C1 <int>, I6R6C1 <int>, I6R7C1 <int>, I6R8C1 <int>, I6R9C1 <int>,
#> #   I6R10C1 <int>, I6R11C1 <int>, I6R12C1 <int>, I6R13C1 <int>,
#> #   I6R14C1 <int>
edit_capitulo(periodo = "iv", capitulo = "v")
#> # A tibble: 5,848 x 200
#>    Periodo nordemp CIIU3 TIPOLOGIA V1R1C1 V1R2C1 V1R3C1 V1R4C1 V1R5C1
#>    <chr>     <int> <dbl> <chr>      <int>  <int>  <int>  <int>  <int>
#>  1 iv            1    40 INNOV          2      1      1      1      2
#>  2 iv            4    40 INNOV          2      1      1      1      2
#>  3 iv            6    40 INNOV          1      1      1      1      1
#>  4 iv           12    40 INNOV          2      2      2      2      2
#>  5 iv           13    40 INNOV          2      2      2      1      2
#>  6 iv           14    40 INNOV          1      2      1      1      2
#>  7 iv           16    40 INNOV          2      1      2      2      2
#>  8 iv           17    40 NO INNOV      NA     NA     NA     NA     NA
#>  9 iv           19    40 INNOV          1      1      2      1      1
#> 10 iv           21    40 NO INNOV      NA     NA     NA     NA     NA
#> # ... with 5,838 more rows, and 191 more variables: V1R6C1 <int>,
#> #   V1R7C1 <int>, V1R8C1 <int>, V1R9C1 <int>, V1R9C2 <int>, V1R9C3 <int>,
#> #   V1R10C1 <int>, V1R10C2 <int>, V1R10C3 <int>, V1R11C1 <int>,
#> #   V1R11C2 <int>, V1R11C3 <int>, V1R12C1 <int>, V1R12C2 <int>,
#> #   V1R12C3 <int>, V1R13C1 <int>, V1R13C2 <int>, V1R13C3 <int>,
#> #   V1R14C1 <int>, V1R14C2 <int>, V1R14C3 <int>, V1R15C1 <int>,
#> #   V1R15C2 <int>, V1R15C3 <int>, V1R16C1 <int>, V1R16C2 <int>,
#> #   V1R16C3 <int>, V1R17C1 <int>, V1R17C2 <int>, V1R17C3 <int>,
#> #   V1R18C1 <int>, V1R18C2 <int>, V1R18C3 <int>, V1R19C1 <int>,
#> #   V1R19C2 <int>, V1R19C3 <int>, V1R20C1 <int>, V1R20C2 <int>,
#> #   V1R20C3 <int>, V1R21C1 <int>, V1R21C2 <int>, V1R21C3 <int>,
#> #   V1R22C1 <int>, V1R22C2 <int>, V1R22C3 <int>, V1R23C1 <int>,
#> #   V1R23C2 <int>, V1R23C3 <int>, V1R24C1 <int>, V1R24C2 <int>,
#> #   V1R24C3 <int>, V1R25C1 <int>, V1R25C2 <int>, V1R25C3 <int>,
#> #   V1R26C1 <int>, V1R26C2 <int>, V1R26C3 <int>, V1R27C1 <int>,
#> #   V1R27C2 <int>, V1R27C3 <int>, V1R28C1 <int>, V1R28C2 <int>,
#> #   V1R28C3 <int>, V1R29C1 <int>, V1R29C2 <int>, V1R29C3 <int>,
#> #   V1R30C1 <int>, V1R30C2 <int>, V1R30C3 <int>, V1R31C1 <int>,
#> #   V1R31C2 <int>, V1R31C3 <int>, V1R32C1 <int>, V1R32C2 <int>,
#> #   V1R32C3 <int>, V2R1C1 <int>, V2R2C1 <int>, V2R3C1 <int>, V2R4C1 <int>,
#> #   V2R5C1 <int>, V2R6C1 <int>, V2R7C1 <int>, V2R8C1 <int>, V2R9C1 <int>,
#> #   V2R10C1 <int>, V2R11C1 <int>, V2R12C1 <int>, V2R13C1 <int>,
#> #   V2R14C1 <int>, V2R15C1 <int>, V2R16C1 <int>, V2R17C1 <int>,
#> #   V3R1C1 <int>, V3R1C2 <int>, V3R1C3 <int>, V3R1C4 <int>, V3R1C5 <int>,
#> #   V3R1C6 <int>, V3R1C7 <int>, V3R1C8 <int>, …
edit_capitulo(periodo = "v", capitulo = c("ii","iv"))
#> # A tibble: 8,057 x 211
#>    Periodo nordemp CIIU4 TIPOLOGIA II1R1C1 II1R1C2 II1R2C1 II1R2C2 II1R3C1
#>    <chr>     <int> <dbl> <chr>       <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
#>  1 v            15    47 INNOVO        500       0       0       0       0
#>  2 v            18    47 NOINNOVO       NA      NA      NA      NA      NA
#>  3 v            22    45 INNOVO          0       0       0       0    7926
#>  4 v            33    47 NOINNOVO       NA      NA      NA      NA      NA
#>  5 v            40    47 INNOVO          0       0       0       0       0
#>  6 v            42    47 NOINNOVO       NA      NA      NA      NA      NA
#>  7 v            58    47 NOINNOVO       NA      NA      NA      NA      NA
#>  8 v            61    47 NOINNOVO       NA      NA      NA      NA      NA
#>  9 v            66    47 NOINNOVO       NA      NA      NA      NA      NA
#> 10 v            67    47 NOINNOVO       NA      NA      NA      NA      NA
#> # ... with 8,047 more rows, and 202 more variables: II1R3C2 <dbl>,
#> #   II1R4C1 <dbl>, II1R4C2 <dbl>, II1R5C1 <dbl>, II1R5C2 <dbl>,
#> #   II1R6C1 <dbl>, II1R6C2 <dbl>, II1R7C1 <dbl>, II1R7C2 <dbl>,
#> #   II1R8C1 <dbl>, II1R8C2 <dbl>, II1R9C1 <dbl>, II1R9C2 <dbl>,
#> #   II1R10C1 <dbl>, II1R10C2 <dbl>, II2R1C1 <int>, II3R1C1 <dbl>,
#> #   II3R1C2 <dbl>, IV1R1C1 <dbl>, IV1R1C2 <dbl>, IV1R1C3 <dbl>,
#> #   IV1R1C4 <dbl>, IV1R2C1 <dbl>, IV1R2C2 <dbl>, IV1R2C3 <dbl>,
#> #   IV1R2C4 <dbl>, IV1R3C1 <dbl>, IV1R3C2 <dbl>, IV1R3C3 <dbl>,
#> #   IV1R3C4 <dbl>, IV1R4C1 <dbl>, IV1R4C2 <dbl>, IV1R4C3 <dbl>,
#> #   IV1R4C4 <dbl>, IV1R5C1 <dbl>, IV1R5C2 <dbl>, IV1R5C3 <dbl>,
#> #   IV1R5C4 <dbl>, IV1R6C1 <dbl>, IV1R6C2 <dbl>, IV1R6C3 <dbl>,
#> #   IV1R6C4 <dbl>, IV1R7C1 <dbl>, IV1R7C2 <dbl>, IV1R7C3 <dbl>,
#> #   IV1R7C4 <dbl>, IV1R8C1 <dbl>, IV1R8C2 <dbl>, IV1R8C3 <dbl>,
#> #   IV1R8C4 <dbl>, IV1R9C1 <dbl>, IV1R9C2 <dbl>, IV1R9C3 <dbl>,
#> #   IV1R9C4 <dbl>, IV1R10C1 <dbl>, IV1R10C2 <dbl>, IV1R10C3 <dbl>,
#> #   IV1R10C4 <dbl>, IV1R11C1 <dbl>, IV1R11C2 <dbl>, IV1R11C3 <dbl>,
#> #   IV1R11C4 <dbl>, IV2R1C1 <dbl>, IV2R1C2 <dbl>, IV2R2C1 <dbl>,
#> #   IV2R2C2 <dbl>, IV2R3C1 <dbl>, IV2R3C2 <dbl>, IV2R4C1 <dbl>,
#> #   IV2R4C2 <dbl>, IV2R5C1 <dbl>, IV2R5C2 <dbl>, IV2R6C1 <dbl>,
#> #   IV2R6C2 <dbl>, IV2R7C1 <dbl>, IV2R7C2 <dbl>, IV2R8C1 <dbl>,
#> #   IV2R8C2 <dbl>, IV2R9C1 <dbl>, IV2R9C2 <dbl>, IV2R10C1 <dbl>,
#> #   IV2R10C2 <dbl>, IV2R11C1 <dbl>, IV2R11C2 <dbl>, IV2R12C1 <dbl>,
#> #   IV2R12C2 <dbl>, IV2R13C1 <dbl>, IV2R13C2 <dbl>, IV2R14C1 <dbl>,
#> #   IV2R14C2 <dbl>, IV2R15C1 <dbl>, IV2R15C2 <dbl>, IV2R16C1 <dbl>,
#> #   IV2R16C2 <dbl>, IV2R17C1 <dbl>, IV2R17C2 <dbl>, IV2R18C1 <dbl>,
#> #   IV2R18C2 <dbl>, IV2R19C1 <dbl>, IV2R19C2 <dbl>, …
```

#### `edit_panel`

Esta función construye paneles a partir de los datos procesados por `edit_capitulo`, genera un marco de datos *tibble* del panel y capítulos especificados.

``` r
edit_panel(panel = "p1", capitulo = "i")
#> Joining, by = "nordemp"
#> # A tibble: 8,700 x 65
#>    nordemp Entrevista Periodo CIIU3 TIPOLO I1R1C1 I1R1C2 I1R2C1 I1R2C2
#>      <int> <chr>      <chr>   <dbl> <chr>   <int>  <dbl>  <int>  <dbl>
#>  1       1 ii-iii     ii         40 INNO        1      9      2     NA
#>  2       1 ii-iii     iii        40 AMPLIA      2     NA      2     NA
#>  3       2 ii-iii     ii         40 INNO        2     NA      2     NA
#>  4       2 ii-iii     iii        40 NOINNO      2     NA      2     NA
#>  5       4 ii-iii     ii         40 INNO        2     NA      2     NA
#>  6       4 ii-iii     iii        40 AMPLIA      2     NA      2     NA
#>  7       5 ii-iii     ii         40 NOINNO      2     NA      2     NA
#>  8       5 ii-iii     iii        40 NOINNO      2     NA      2     NA
#>  9       6 ii-iii     ii         40 INNO        1      4      1      2
#> 10       6 ii-iii     iii        40 AMPLIA      1      4      1      2
#> # ... with 8,690 more rows, and 56 more variables: I1R3C1 <int>,
#> #   I1R3C2 <dbl>, I1R9C1 <int>, I1R9C2 <dbl>, I1R10C1 <int>,
#> #   I1R10C2 <dbl>, I1R11C1 <int>, I1R11C2 <dbl>, I2R1C1 <int>,
#> #   I2R2C1 <int>, I2R3C1 <int>, I2R4C1 <int>, I2R5C1 <int>, I2R6C1 <int>,
#> #   I2R9C1 <int>, I2R7C1 <int>, I2R8C1 <int>, I2R10C1 <int>,
#> #   I2R11C1 <int>, I4R1C1 <dbl>, I4R1C2 <dbl>, I4R2C1 <dbl>, I4R2C2 <dbl>,
#> #   I4R3C1 <dbl>, I4R3C2 <dbl>, I5R1C1 <int>, I6R1C1 <int>, I7R1C1 <int>,
#> #   I7R2C1 <int>, I7R3C1 <int>, I7R4C1 <int>, I7R5C1 <int>, I7R6C1 <int>,
#> #   I7R8C1 <int>, I7R9C1 <int>, I7R10C1 <int>, I7R11C1 <int>,
#> #   I7R12C1 <int>, I7R13C1 <int>, I7R14C1 <int>, I7R15C1 <int>,
#> #   I1R4C2 <dbl>, I1R5C1 <int>, I1R5C2 <dbl>, I1R6C1 <int>, I1R6C2 <dbl>,
#> #   I1R7C1 <int>, I1R7C2 <dbl>, I1R8C2 <dbl>, I3R1C1 <dbl>, I3R1C2 <dbl>,
#> #   I4R4C1 <dbl>, I4R4C2 <dbl>, I4R5C1 <dbl>, I4R5C2 <dbl>, I7R7C1 <int>
edit_panel(panel = "p2", capitulo = c("i","iv"))
#> Joining, by = "nordemp"
#> # A tibble: 14,548 x 368
#>    nordemp Entrevista Periodo CIIU3 TIPOLOGIA I1R1C1N I1R1C2N I1R2C1N
#>      <int> <chr>      <chr>   <dbl> <chr>       <int>   <dbl>   <int>
#>  1       1 ii-iii-iv  ii         40 INNO            1       9       2
#>  2       1 ii-iii-iv  iii        40 AMPLIA          2      NA       2
#>  3       1 ii-iii-iv  iv         40 INNOV           2      NA       2
#>  4       2 ii-iii     ii         40 INNO            2      NA       2
#>  5       2 ii-iii     iii        40 NOINNO          2      NA       2
#>  6       4 ii-iii-iv  ii         40 INNO            2      NA       2
#>  7       4 ii-iii-iv  iii        40 AMPLIA          2      NA       2
#>  8       4 ii-iii-iv  iv         40 INNOV           2      NA       2
#>  9       5 ii-iii     ii         40 NOINNO          2      NA       2
#> 10       5 ii-iii     iii        40 NOINNO          2      NA       2
#> # ... with 14,538 more rows, and 360 more variables: I1R2C2N <dbl>,
#> #   I1R3C1N <int>, I1R3C2N <dbl>, I1R4C1 <int>, I1R4C2 <dbl>,
#> #   I1R5C1 <int>, I1R5C2 <dbl>, I1R6C1 <int>, I1R6C2 <dbl>, I2R1C1 <int>,
#> #   I2R2C1 <int>, I2R3C1 <int>, I2R4C1 <int>, I2R5C1 <int>, I2R6C1 <int>,
#> #   I2R8C1 <int>, I2R9C1 <int>, I2R7C1 <int>, I2R10C1 <int>,
#> #   I2R11C1 <int>, I4R1C1 <dbl>, I4R1C2 <dbl>, I4R2C1 <dbl>, I4R2C2 <dbl>,
#> #   I4R3C1 <dbl>, I4R3C2 <dbl>, I5R1C1 <int>, I6R1C1 <int>, I8R1C1 <int>,
#> #   I8R2C1 <int>, I8R3C1 <int>, I8R4C1 <int>, I8R5C1 <int>, I8R6C1 <int>,
#> #   I8R7C1 <int>, I8R8C1 <int>, I8R9C1 <int>, I8R10C1 <int>,
#> #   I8R11C1 <int>, I8R12C1 <int>, I8R13C1 <int>, I8R14C1 <int>,
#> #   IV1R1C1 <dbl>, IV1R1C2 <dbl>, IV1R1C3 <dbl>, IV1R1C4 <dbl>,
#> #   IV1R2C1 <dbl>, IV1R2C2 <dbl>, IV1R2C3 <dbl>, IV1R2C4 <dbl>,
#> #   IV1R3C1 <dbl>, IV1R3C2 <dbl>, IV1R3C3 <dbl>, IV1R3C4 <dbl>,
#> #   IV1R4C1 <dbl>, IV1R4C2 <dbl>, IV1R4C3 <dbl>, IV1R4C4 <dbl>,
#> #   IV1R5C1 <dbl>, IV1R5C2 <dbl>, IV1R5C3 <dbl>, IV1R5C4 <dbl>,
#> #   IV1R6C1 <dbl>, IV1R6C2 <dbl>, IV1R6C3 <dbl>, IV1R6C4 <dbl>,
#> #   IV1R7C1 <dbl>, IV1R7C2 <dbl>, IV1R7C3 <dbl>, IV1R7C4 <dbl>,
#> #   IV1R8C1 <dbl>, IV1R8C2 <dbl>, IV1R8C3 <dbl>, IV1R8C4 <dbl>,
#> #   IV1R9C1 <dbl>, IV1R9C2 <dbl>, IV1R9C3 <dbl>, IV1R9C4 <dbl>,
#> #   IV1R10C1 <dbl>, IV1R10C2 <dbl>, IV1R10C3 <dbl>, IV1R10C4 <dbl>,
#> #   IV1R11C1 <dbl>, IV1R11C2 <dbl>, IV1R11C3 <dbl>, IV1R11C4 <dbl>,
#> #   IV2R1C1 <dbl>, IV2R1C2 <dbl>, IV3R1C1PIII <dbl>, IV3R1C2PIII <dbl>,
#> #   IV3R1C3PIII <dbl>, IV3R1C4PIII <dbl>, IV2R1C5PII <dbl>,
#> #   IV3R1C7PIII <dbl>, IV3R2C1PIII <dbl>, IV3R2C2PIII <dbl>,
#> #   IV3R2C3PIII <dbl>, IV3R2C4PIII <dbl>, IV2R2C5PII <dbl>,
#> #   IV3R2C7PIII <dbl>, …
```

#### `edit_dicc`

Esta función invoca en el ambiente global el diccionario elegido en los argumentos.

``` r
edit_dicc(periodo = "iii")
dicc_iii
#> # A tibble: 580 x 4
#>    Name    Label                          Question                   Type 
#>    <chr>   <chr>                          <chr>                      <chr>
#>  1 nordemp Numero de orden                <NA>                       i    
#>  2 CIIU3   Actividad Económica            <NA>                       d    
#>  3 TIPOLO  Tipologia                      <NA>                       c    
#>  4 I1R1C1  Servicios o bienes nuevos úni… Indique si durante el per… i    
#>  5 I1R1C2  Servicios o bienes nuevos úni… Indique si durante el per… d    
#>  6 I1R2C1  Servicios o bienes nuevos en … Indique si durante el per… i    
#>  7 I1R2C2  Servicios o bienes nuevos úni… Indique si durante el per… d    
#>  8 I1R3C1  Servicios o bienes nuevos en … Indique si durante el per… i    
#>  9 I1R3C2  Servicios o bienes nuevos en … Indique si durante el per… d    
#> 10 I1R4C2  Total innovaciones de servici… Indique si durante el per… d    
#> # ... with 570 more rows
edit_dicc(panel = "p2")
dicc_p2
#> # A tibble: 738 x 4
#>    Name      Label                         Question                  Type 
#>    <chr>     <chr>                         <chr>                     <chr>
#>  1 Periodo   Periodo de realización de la… <NA>                      c    
#>  2 nordemp   Numero de orden               <NA>                      i    
#>  3 CIIU3     Actividad Económica           <NA>                      d    
#>  4 TIPOLOGIA Tipologia                     <NA>                      c    
#>  5 I1R1C1N   Servicios o bienes nuevos ún… Indique si durante el pe… i    
#>  6 I1R1C2N   Servicios o bienes nuevos ún… Indique si durante el pe… d    
#>  7 I1R2C1N   Servicios o bienes nuevos en… Indique si durante el pe… i    
#>  8 I1R2C2N   Servicios o bienes nuevos en… Indique si durante el pe… d    
#>  9 I1R3C1N   Servicios o bienes nuevos en… Indique si durante el pe… i    
#> 10 I1R3C2N   Número total de Innovaciones… Indique si durante el pe… d    
#> # ... with 728 more rows
```
