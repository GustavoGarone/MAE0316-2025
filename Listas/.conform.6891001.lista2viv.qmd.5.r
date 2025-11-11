#| label: tbl-shapiro
#| tbl-cap: Saída do teste de Shapiro-Wilk sobre os resíduos

teste <- shapiro.test(residuos)

tbl_shapiro <- tibble(
  "Estatística" = round(teste$statistic, digits = 4),
  "Valor-p" = round(teste$p.value, digits = 4)
)

pander(tbl_shapiro)
