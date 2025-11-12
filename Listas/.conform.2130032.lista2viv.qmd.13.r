#| label: fig-ctime
#| fig-cap: "Evolução da densidade mineral óssea ao longo do tempo contínuo"

ggplot(dados, aes(
  x = ctime, y = bmd, color = group
)) +
  geom_point(alpha = 0.3) +
  labs(
    x = "Idade (anos)",
    y = "DMO (g/cm²)",
    color = "Grupo"
  ) +
  theme_minimal()
