#| label: tbl-comparacao
#| tbl-cap: "Comparação dos modelos de efeitos aleatórios e ajuste de heterocedasticidade"
modelos <- list(
  "Completo com correlação" = mod_completo_corr,
  "Completo com correlação e ajuste" = mod_completo_corr_adj, # Não convergiu
  "Completo sem correlação" = mod_completo_semcorr,
  "Completo sem correlação com ajuste" = mod_completo_semcorr_adj,
  "Sem inclinação" = mod_semincline,
  "Sem inclinação com ajuste" = mod_semincline_adj,
  "Sem intercepto" = mod_semintercepto,
  "Sem intercepto com ajuste" = mod_semintercepto_adj,
  "Sem efeito aleatório" = mod_semaleatorio,
  "Sem efeito aleatório com ajuste" = mod_semaleatorio_adj
)
aic_values <- sapply(modelos, AIC)
bic_values <- sapply(modelos, BIC)
tbl_comparacao <- tibble(
  Modelo = names(aic_values),
  AIC = round(aic_values, digits = 2),
  BIC = round(bic_values, digits = 2)
)

kable(tbl_comparacao)
