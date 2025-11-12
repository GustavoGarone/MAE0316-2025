#| label: tbl-descritiva
#| tbl-cap: "Análise descritiva numérica da DMO"
#| tbl-subcap:
#|   - "Placebo"
#|   - "Suplementado"
#| layout-nrow: 2

dados_placebo <- dados[dados$group == "P", ] |>
  group_by(visit) |>
  summarise(
    n = n(),
    media = round(mean(bmd, na.rm = TRUE), digits = 3),
    sd = round(sd(bmd, na.rm = TRUE), digits = 3),
    min = round(min(bmd, na.rm = TRUE), digits = 3),
    mediana = round(median(bmd, na.rm = TRUE), digits = 3),
    max = round(max(bmd, na.rm = TRUE), digits = 3)
  )
dados_calcio <- dados[dados$group == "C", ] |>
  group_by(visit) |>
  summarise(
    n = n(),
    media = round(mean(bmd, na.rm = TRUE), digits = 3),
    sd = round(sd(bmd, na.rm = TRUE), digits = 3),
    min = round(min(bmd, na.rm = TRUE), digits = 3),
    mediana = round(median(bmd, na.rm = TRUE), digits = 3),
    max = round(max(bmd, na.rm = TRUE), digits = 3)
  )
kable(dados_placebo)
kable(dados_calcio)
