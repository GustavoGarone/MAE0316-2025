#| output: false
df <- read.csv2("./Book1.csv", nrows = 22)

df[df == "Não sei"] <- 0
df$media1 <- (as.numeric(df$que1) + as.numeric(df$que2) + as.numeric(df$que3) +
  as.numeric(df$que4) + as.numeric(df$que5)) / 5

df$media2 <- (as.numeric(df$que12) + as.numeric(df$que22) + as.numeric(df$que32) +
  as.numeric(df$que42) + as.numeric(df$que52)) / 5

df$meand <- (as.numeric(df$diag1) + as.numeric(df$diag2) + as.numeric(df$diag3) +
  as.numeric(df$diag4)) / 4

df$Topico <- ifelse(df$Grupo %in% c("bio1", "bio2"), "bio", "mat")
