#| label: tbl-shapiro-fixo
#| tbl-cap: "Teste de Shapiro-Wilk para normalidade dos resíduos do modelo com efeitos fixos."
teste_sf <- shapiro.test(residuos_fixo)
tibble(
  Estatística = teste_sf$statistic,
  `Valor-p` = teste_sf$p.value
) |>
  kable(digits = 4)
