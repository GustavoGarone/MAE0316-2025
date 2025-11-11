#| label: fig-age
#| fig-cap: "Evolução da DMO ao longo do tempo contínuo, separada por idade"
ggplot(dados, aes(
  x = age, y = bmd, color = group
)) +
  geom_point(tau = 0.3) +
  labs(
    x = "Idade (anos)",
    y = "DMO (g/cm²)",
    color = "Grupo"
  ) +
  theme_minimal()
