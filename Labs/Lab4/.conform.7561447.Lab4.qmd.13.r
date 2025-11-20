#| label: fig-perfis-vacas
#| fig-cap: "Gráfico de perfis da quantidade de proteína ao longo do tempo para cada vaca, diferenciando as dietas."
ggplot(dados, aes(x = Time, y = protein, group = Cow, colour = Diet)) +
  geom_line() +
  theme_minimal() +
  xlab("Semana") +
  ylab("Quantidade de Proteína") +
  labs(colour = "Dieta")
