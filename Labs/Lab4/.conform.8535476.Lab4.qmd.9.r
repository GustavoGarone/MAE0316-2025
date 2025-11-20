modelo_fixo <- lm(protein ~ Time + Inicial + Time * Inicial + Diet + Diet * Time +
  Inicial, data = dados)
