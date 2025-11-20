#| label: tbl-levene-fixo
#| tbl-cap: "Teste de Levene para homocedasticidade dos resíduos do modelo com efeitos fixos."
teste_lf <- leveneTest(residuos_fixo ~ dados$Cow)
tibble(
  Estatística = teste_lf$`F value`[1],
  `Valor-p` = teste_lf$`Pr(>F)`[1]
) |>
  kable(digits = 4)
