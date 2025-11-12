#| label: tbl-bartlett
#| tbl-cap: Saída do teste de Bartlett para homocedasticidade entre os grupos (P x C)

grupo_residuos <- data.frame(
  group = dados$group,
  residuals = residuos
)
teste_bartlett <- bartlett.test(
  residuals ~ group,
  data = grupo_residuos
)
tbl_bartlett <- tibble(
  "Estatística" = round(teste_bartlett$statistic, digits = 4),
  "Valor-p" = round(teste_bartlett$p.value, digits = 4)
)
pander(tbl_bartlett)
