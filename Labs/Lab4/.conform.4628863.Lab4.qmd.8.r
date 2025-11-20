residuos_fixo <- resid(modelo_fixo)
dados_residuos_fixo <- tibble(Cow = dados$Cow, Residuos = residuos_fixo)
ggplot(dados_residuos_fixo, aes(x = Cow, y = Residuos)) +
  geom_boxplot() +
  theme_minimal() +
  xlab("Vaca") +
  ylab("Resíduos") +
  theme(axis.text.x = element_blank())
