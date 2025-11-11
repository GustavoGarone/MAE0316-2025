#| label: tbl-levene
#| tbl-cap: Saída do teste de Bartlett para homocedasticidade entre os grupos (P x C)

teste_levene <- leveneTest(
  residuals ~ group,
  data = grupo_residuos
)
tbl_bartlett <- tibble(
  "Estatística" = round(teste_levene$"F value", digits = 4),
  "Valor-p" = round(teste_levene$"Pr(>F)", digits = 4)
)
