power.anova.test(
  groups = 3,
  n = length(dados$Grupo) / 3,
  between.var = var_between_groups,
  within.var = mean_sq_res
)
