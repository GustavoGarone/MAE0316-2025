#| label: fig-boxplot-diet
#| fig-cap: "Boxplot da quantidade de proteína para cada dieta."
ggplot(dados, aes(x = Diet, y = protein, fill = Diet)) +
  geom_boxplot() +
  theme_minimal() +
  xlab("Dieta") +
  ylab("Quantidade de Proteína") +
  labs(fill = "Dieta")
