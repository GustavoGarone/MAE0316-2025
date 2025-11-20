modelo_misto <- lme(
  protein ~ Time + Inicial + Time * Inicial + Diet + Diet * Time + Inicial,
  random = ~ Time | Cow,
  data = dados,
  method = "REML"
)
