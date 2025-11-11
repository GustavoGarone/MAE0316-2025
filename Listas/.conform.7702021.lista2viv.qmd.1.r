#| label: tbl-sumario-mod
#| tbl-cap: "Sumário do modelo completo com correlação"
summary_mod <- summary(mod_completo_corr)
tbl_sumario <- as.data.frame(summary_mod$tTable) |>
  rownames_to_column(var = "Efeito") |>
  mutate(
    Estimativa = round(Value, digits = 4),
    EP = round(`Std.Error`, digits = 4),
    GL = `Df`
    t = round(`t-value`, digits = 4),
    Valor-p = round(`p-value`, digits = 4)
  ) |>
  select(Efeito, Estimate, Std_Error, DF, t_value, p_value)
pander(tbl_sumario)
