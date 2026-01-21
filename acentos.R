# Passo 1: Carregar os pacotes que serão usados

if (!require(pacman)) {
  install.packages("pacman")
}
pacman::p_load(dplyr, stringi)


# Passo 2: Carregar o banco de dados

# Importante: selecionar o diretório de trabalho (working directory)
# Isso pode ser feito manualmente: Session > Set Working Directory > Choose Directory

# Lendo o banco especificando o encoding

dados <- read.csv2("Banco 1.csv", fileEncoding = "latin1")
View(dados)


# Detectar o encoding de um banco

stringi::stri_enc_detect("Banco 1.csv")


# Outra opção: alterar o local (locale)

## Verificar locale atual
Sys.getlocale()

## Alterar o locale
Sys.setlocale(category = "LC_ALL", locale = "pt_BR.ISO8859-1")


# Lendo o banco sem precisar especificar o encoding
dados <- read.csv2('Banco 1.csv')
View(dados)
