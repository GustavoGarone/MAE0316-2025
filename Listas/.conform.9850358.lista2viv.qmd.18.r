#| label: tbl-medvar
#| tbl-cap: "Média e variância (entre grupos) dos ganhos de peso por dieta"

# Ignore test
media_ganho <- aggregate(Ganho ~ Grupo, data = dados, FUN = mean)
var_between_groups <- var(media_ganho$Ganho)
tbl_medvar <- tibble(
  Grupo = media_ganho$Grupo,
  Media = round(media_ganho$Ganho, digits = 4)
) |>
  bind_rows(tibble(
    Grupo = "Variância entre grupos",
    Media = round(var_between_groups, digits = 4)
  ))
pander(tbl_medvar)
