#| output: false
df <- df |>
  mutate(
    Media_Imed = media1 * 5,
    Media_Semn = media2 * 5,
    Diagn = meand * 4,
    Retencao = Media_Semn - Media_Imed,
    Velocidade = if_else(str_detect(tolower(Grupo), "2$"), "x2", "normal"),
    Participante = seq(1, 22)
  )


df_long <- df |>
  select(Participante, Idade, Sexo, Topico, Velocidade, Diagn, Media_Imed, Media_Semn) |>
  pivot_longer(cols = c(Media_Imed, Media_Semn), names_to = "Tempo", values_to = "Nota") |>
  mutate(Tempo = if_else(Tempo == "Media_Imed", "Imediato", "Semana"))
