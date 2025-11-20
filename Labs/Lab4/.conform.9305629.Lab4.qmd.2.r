#| label: tbl-durbin-fixo
#| tbl-cap: "Teste de Durbin-Watson para autocorrelação dos resíduos do modelo com efeitos fixos."
teste_df <- durbinWatsonTest(modelo_fixo)
tibble(
  Estatística = teste_df$dw,
  `Valor-p` = teste_df$p
) |>
  kable(digits = 4)
