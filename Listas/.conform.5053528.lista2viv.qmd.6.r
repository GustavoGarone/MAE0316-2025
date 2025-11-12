#| label: fig-qqplot-mod
#| fig-cap: Comparação dos quantis

ggplot(data = data.frame(
  resid = residuos
), aes(sample = resid)) +
  stat_qq() +
  stat_qq_line(color = "red") +
  labs(
    x = "Quantis teóricos",
    y = "Quantis amostrais"
  ) +
  theme_minimal()
