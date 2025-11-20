#| label: tbl-bartlett-fixo
#| tbl-cap: "Teste de Bartlett para homocedasticidade dos resíduos do modelo com efeitos fixos."
teste_bf <- bartlett.test(residuos_fixo ~ dados$Cow)
tibble(
  Estatística = teste_bf$statistic,
  `Valor-p` = teste_bf$p.value
) |>
  kable(digits = 4)
