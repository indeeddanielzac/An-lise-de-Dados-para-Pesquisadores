#################### Instalação e carregamento dos pacotes ####################

# Instalação dos pacotes:

## Opção 1:
### Packages >> Install >> Digitar o nome do pacote

## Opção 2:
install.packages("dplyr")

## Opção 3 (apenas se ainda não tiver sido instalado):
if (!require(dplyr)) {
  install.packages("dplyr")
}


# Carregamento dos pacotes:

library(dplyr)

library(ggplot2)


# Instalação + carregamento de vários pacotes:

if (!require(pacman)) {
  install.packages("pacman")
}

pacman::p_load(dplyr, rstatix, ggplot2, readxl)


######################### Leitura do banco de dados ###########################

# Créditos: banco traduzido de http://www.craigmile.com/peter/teaching/673/datasets/

# Banco em csv
# csv = valores separados por vírgula mas depende do país
# eua separador de coluna é a vírgula, porque lá o seperados de decimal é o ponto
# no padrão brasileiro é o ponto e vírgula ;
# read.csv padrão eua csv2 brasileiro

dados <- read.csv2("FEV.csv")

head(dados, n = 10)
View(dados)


# Banco em Excel (xlsx)

dados <- readxl::read_excel("FEV.xlsx")

head(dados)
View(dados)


########################## Tipos de variáveis no R ############################

# Checando os tipos de variáveis do nosso banco

str(dados)

dplyr::glimpse(dados)


# Transformando as variáveis categóricas em fator:

dados$genero <- factor(dados$genero)


# Estabelecendo que 9 é valor ausente na variável "fumante":
dados$fumante[dados$fumante == 9] <- NA

dados$fumante <- factor(
  dados$fumante,
  levels = c(1, 2),
  labels = c("Sim", "Não")
)


## Criando a variável faixa etária

dados$faixa_etaria <- cut(dados$idade, breaks = seq(0, 21, by = 3))

summary(dados$faixa_etaria)

rotulos <- c(paste(seq(1, 21, by = 3), seq(1 + 3 - 1, 21, by = 3), sep = "-"))

dados$faixa_etaria <- factor(dados$faixa_etaria, labels = rotulos, ordered = T)
