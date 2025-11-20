#| label: fig-qq-fixo
#| fig-cap: "QQ-Plot dos resíduos do modelo com efeitos fixos."
ggplot(data = dados_residuos_fixo, aes(sample = Residuos)) +
  stat_qq() +
  stat_qq_line() +
  theme_minimal() +
  xlab("Quantis Teóricos") +
  ylab("Quantis Amostrais")
