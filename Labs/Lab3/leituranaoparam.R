# Pacotes
library(readxl)
library(npmv)
library(vegan)
library(devtools)
install_github("pmartinezarbizu/pairwiseAdonis/pairwiseAdonis")
library(pairwiseAdonis)

# Lendo a base de dados
tabela_padronizada <- read_excel("~/Planejamento Geral/2025/Tabela_Padronizada.xlsx")

# Removendo NAs
tabela_padronizada_nona <- na.omit(tabela_padronizada)

# Dividindo entre genes e miRNAs
tabela_padronizada_nonag <- tabela_padronizada_nona[, c(1:8, 13)]
tabela_padronizada_nonam <- tabela_padronizada_nona[, c(9:13)]

# Testes nonpartest

# Aplicando o teste não paramétrico para ambos
nonpartest(TP53 | CDKN1A | PTEN | MDM4 | MYB | SHIP | EIF4 | CEBPB | miR_155 | miR_150 | miR_34a | miR_17_5p ~ Fase, data = tabela_padronizada_nona, permreps = 1000)

# Aplicando o teste não paramétrico para os genes
nonpartest(TP53 | CDKN1A | PTEN | MDM4 | MYB | SHIP | EIF4 | CEBPB ~ Fase, data = tabela_padronizada_nonag, permreps = 1000)

# Aplicando o teste não paramétrico para os miRNAs
nonpartest(miR_155 | miR_150 | miR_34a | miR_17_5p ~ Fase, data = tabela_padronizada_nonam, permreps = 1000)

# Testes adonis2

# Aplicando o teste não paramétrico para os miRNAs + genes
Y <- tabela_padronizada_nona[, c(1:12)]
adonis2(Y ~ tabela_padronizada_nona$Fase, method = "euclidean")
pairwise.adonis(Y, tabela_padronizada_nona$Fase, sim.method = "euclidean", p.adjust.m = "bonferroni")

# Aplicando o teste não paramétrico para os genes
Y <- tabela_padronizada_nonag[, c(1:8)]
adonis2(Y ~ tabela_padronizada_nonag$Fase, method = "euclidean")
pairwise.adonis(Y, tabela_padronizada_nonag$Fase, sim.method = "euclidean", p.adjust.m = "bonferroni")

# Aplicando o teste não paramétrico para os miRNAs
Y <- tabela_padronizada_nonam[, c(1:4)]
adonis2(Y ~ tabela_padronizada_nonam$Fase, method = "euclidean")
pairwise.adonis(Y, tabela_padronizada_nonam$Fase, sim.method = "euclidean", p.adjust.m = "bonferroni")
