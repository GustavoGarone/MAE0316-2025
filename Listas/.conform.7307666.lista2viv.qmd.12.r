#| label: fig-visit
#| fig-cap: "Evolução da densidade mineral óssea ao longo das visitas"
pmean <- ggplot(dados, aes(
  x = visit, y = bmd,
  linetype = group, color = group, group = group
)) +
  stat_summary(fun = mean, geom = "line") +
  stat_summary(fun = mean, geom = "point") +
  labs(
    x = "Visita",
    y = "Média da DMO (g/cm²)",
    linetype = "Grupo",
    color = "Grupo"
  ) +
  theme_minimal()
pmed <- ggplot(dados, aes(
  x = visit, y = bmd,
  linetype = group, color = group, group = group,
)) +
  stat_summary(fun = median, geom = "line") +
  stat_summary(fun = median, geom = "point") +
  labs(
    x = "Visita",
    y = "Mediana da DMO (g/cm²)",
    linetype = "Grupo",
    color = "Grupo"
  ) +
  theme_minimal()
pmean + pmed + plot_layout(axis_titles = "collect", guides = "collect")
