#| output: false
# Declaração dos modelos
mod_completo_corr <- lme(
  bmd ~ age + group + age * group,
  random = ~ age | person,
  data = dados,
  method = "REML"
)

mod_completo_corr_adj <- lme(
  bmd ~ age + group + age * group,
  random = ~ age | person,
  weights = varConstPower(form = ~age),
  data = dados,
  method = "REML"
)

mod_completo_semcorr <- lme(
  bmd ~ age + group + age * group,
  random = list(person = pdDiag(~age)),
  data = dados,
  method = "REML"
)

mod_completo_semcorr_adj <- lme(
  bmd ~ age + group + age * group,
  random = list(person = pdDiag(~age)),
  weights = varPower(form = ~age),
  data = dados,
  method = "REML"
)

mod_semincline <- lme(
  bmd ~ age + group + age * group,
  random = ~ 1 | person,
  data = dados,
  method = "REML"
)

mod_semincline_adj <- lme(
  bmd ~ age + group + age * group,
  random = ~ 1 | person,
  weights = varPower(form = ~age),
  data = dados,
  method = "REML"
)

mod_semintercepto <- lme(
  bmd ~ age + group + age * group,
  random = ~ 0 + age | person,
  data = dados,
  method = "REML"
)

mod_semintercepto_adj <- lme(
  bmd ~ age + group + age * group,
  random = ~ 0 + age | person,
  weights = varPower(form = ~age),
  data = dados,
  method = "REML"
)

mod_semaleatorio <- lm(
  bmd ~ age + group + age * group,
  data = dados
)

mod_semaleatorio_adj <- gls(
  bmd ~ age + group + age * group,
  weights = varPower(form = ~age),
  data = dados
)
