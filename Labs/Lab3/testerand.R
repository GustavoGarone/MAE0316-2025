###############################################################
## RANDOMIZATION TEST (Gary Oehlert)
## Estatística F + Comparações múltiplas (a posteriori)
## RCBD com 3 tratamentos — dados fictícios
###############################################################

set.seed(123)

### ---------------------------------------------------------
### 1. Gerar dados fictícios
### ---------------------------------------------------------

t <- 3 # tratamentos A, B, C
b <- 6 # blocos

trat <- factor(rep(LETTERS[1:t], b))
bloco <- factor(rep(1:b, each = t))

# Médias fictícias
verdades <- c(5, 7, 6.2)

# Dados simulados
y <- rnorm(t * b, mean = rep(verdades, b), sd = 0.6)

dados <- data.frame(bloco, trat, y)
dados

## Função para obter F da ANOVA em blocos
F_stat <- function(y, trat, bloco) {
  # Soma de quadrados tratamentos
  medias_t <- tapply(y, trat, mean)
  media_geral <- mean(y)
  n_i <- table(trat)

  SS_trat <- sum(n_i * (medias_t - media_geral)^2)
  gl_trat <- length(levels(trat)) - 1
  QM_trat <- SS_trat / gl_trat

  # Soma de quadrados bloco
  medias_b <- tapply(y, bloco, mean)
  n_j <- table(bloco)
  SS_bloco <- sum(n_j * (medias_b - media_geral)^2)
  gl_bloco <- length(levels(bloco)) - 1

  # Soma de quadrados residual
  SS_total <- sum((y - media_geral)^2)
  SS_res <- SS_total - SS_trat - SS_bloco
  gl_res <- length(y) - (gl_trat + gl_bloco + 1)
  QM_res <- SS_res / gl_res

  F <- QM_trat / QM_res
  return(F)
}

F_obs <- F_stat(y, trat, bloco)
F_obs
B <- 5000
F_perm <- numeric(B)

for (k in 1:B) {
  trat_perm <- unlist(tapply(trat, bloco, sample))
  F_perm[k] <- F_stat(y, trat_perm, bloco)
}

p_value_global <- mean(F_perm >= F_obs)
p_value_global


pares <- combn(levels(trat), 2, simplify = FALSE)

# estatística observada para cada comparação: diferença absoluta das médias
diff_obs <- sapply(pares, function(par) {
  abs(mean(y[trat == par[1]]) - mean(y[trat == par[2]]))
})
names(diff_obs) <- sapply(pares, paste, collapse = " vs ")

# randomization null distribution para cada comparação
diff_perm <- matrix(0, nrow = B, ncol = length(pares))

for (k in 1:B) {
  trat_perm <- unlist(tapply(trat, bloco, sample))
  for (j in 1:length(pares)) {
    p <- pares[[j]]
    diff_perm[k, j] <- abs(mean(y[trat_perm == p[1]]) -
      mean(y[trat_perm == p[2]]))
  }
}

# p-values individuais
p_raw <- colMeans(diff_perm >= matrix(diff_obs,
  nrow = B, ncol = length(pares),
  byrow = TRUE
))

# Correção para múltiplos testes (Holm)
p_adj <- p.adjust(p_raw, method = "holm")

# Tabela final
comparacoes <- data.frame(
  Comparacao = names(diff_obs),
  Dif_observada = diff_obs,
  p_raw,
  p_ajustado_Holm = p_adj
)

comparacoes
