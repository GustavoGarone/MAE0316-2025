#| label: tbl-sumario-mod
#| tbl-cap: "Sumário do modelo completo com correlação"
summary_mod <- summary(mod_completo_corr)$tTable
tbl_sumario <- as_tibble(summary_mod) |>
  mutate(
    Termo = c("Intecepto", "Idade", "Grupo(P)", "Idade:Grupo(P)"),
    Estimativa = round(Value, digits = 4),
    EP = round(`Std.Error`, digits = 4),
    GL = `DF`,
    t = round(`t-value`, digits = 4),
    "Valor-p" = round(`p-value`, digits = 4)
  ) |>
  select(Termo, Estimativa, EP, GL, t, `Valor-p`)
pander(tbl_sumario)
