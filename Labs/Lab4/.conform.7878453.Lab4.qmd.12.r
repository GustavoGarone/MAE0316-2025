#| label: fig-medias-dietas
#| fig-cap: "Média da quantidade de proteína ao longo do tempo para cada dieta."
medias <- dados |>
  dplyr::group_by(Time, Diet) |>
  dplyr::summarise(media = mean(protein), .groups = "drop")

ggplot(medias, aes(x = Time, y = media, colour = Diet, group = Diet)) +
  geom_line(linewidth = 1.2) +
  theme_minimal() +
  xlab("Semana") +
  ylab("Média da Quantidade de Proteína") +
  labs(colour = "Dieta")
