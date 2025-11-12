#| label: tbl-levene
#| tbl-cap: Saída do teste de Levene para homocedasticidade entre os grupos (P x C)

teste_levene <- leveneTest(
  residuals ~ group,
  data = grupo_residuos
)
tbl_levene <- tibble(
  "Estatística" = round(teste_levene[1, ]$"F value", digits = 4),
  "Valor-p" = round(teste_levene[1, ]$"Pr(>F)", digits = 4)
)
pander(tbl_levene)
