#| label: fig-resid-ajust
#| fig-cap: Resíduos x Ajustados do Modelo com Correlação

resid <- data.frame(
  Fitted = fitted(mod_completo_corr),
  Residuals = residuals(mod_completo_corr)
)
res_ajust <- ggplot(resid, aes(x = Fitted, y = Residuals)) +
  geom_point() +
  labs(
    x = "Ajustados", y = "Resíduos"
  ) +
  theme_minimal() +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  theme(plot.title = element_text(hjust = 0.5))

res_ajust
