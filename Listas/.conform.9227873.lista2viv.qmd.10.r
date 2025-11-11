#| label: fig-perfis
#| fig-cap: "Perfis da DMO das participantes ao longo do tempo contínuo"
ggplot(dados, aes(
  x = ctime, y = bmd,
  group = person,
)) +
  geom_line(tau = 0.3) +
  labs(
    x = "Tempo contínuo",
    y = "DMO (g/cm²)",
  ) +
  theme_minimal()
