#| label: tbl-vardentro
#| tblcap: Estimativa obtida pelo ANOVA para variância dentro dos grupos
modelo <- anova(lm(dados$Ganho ~ dados$Grupo))
mean_sq_res <- modelo$`Mean Sq`[2]
tbl_vardentro <- tibble(
  "Estimativa da variância dentro dos grupos" = round(mean_sq_res, digits = 4)
)
pander(tbl_vardentro)
