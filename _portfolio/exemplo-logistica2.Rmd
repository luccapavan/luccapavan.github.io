---
title: "Exemplo Logística"
author: "Lucca Pavan"
date: "08/04/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library(boot) # package with the simplex function
library(tidyverse)
```

```{r}
`Carga` <- sample(seq(500,1000,10), 100, replace = TRUE) # em mil kilos
`Tempo no cliente` <-  0.15 * `Carga` + rnorm(100, 30,30) # em minutos

Dados <- tibble(`Tempo no cliente`, `Carga`)

head(Dados)

```

```{r}
regressao <- lm(`Tempo no cliente` ~ Carga, Dados)

summary(regressao)

ggplot(Dados, aes(`Carga`, `Tempo no cliente`))+
  geom_point()+
  geom_smooth(method='lm')

```
```{r}
Dados$chuva <- Dados$`Tempo no cliente` > 150
write.csv(Dados, "Dados.csv")
head(Dados)

regressao2 <- lm(`Tempo no cliente` ~ Carga + chuva, Dados)

summary(regressao2)

```
```{r}
ggplot(Dados, aes(`Carga`, `Tempo no cliente`, colour = chuva))+
  geom_point()+
  geom_smooth(method='lm')
```



```{r}
ggplot(Dados, aes(`Carga`, `Tempo no cliente`))+
  geom_point()+
  geom_smooth(method='lm')+
    facet_wrap(~chuva)
```








