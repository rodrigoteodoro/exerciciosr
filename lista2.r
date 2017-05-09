#2.2-Importe o conjunto de dados DadosColetados_PerfilGovTI 2014.xlsx e diga quantos registros tem a base
#de dados.
library(readxl)
DadosColetados_PerfilGovTI_2014 <- read_excel("~/Desktop/ILE/Lab1/dados/DadosColetados_PerfilGovTI 2014.xlsx", 
                                              skip = 2)
#View(DadosColetados_PerfilGovTI_2014)
v <- nrow(DadosColetados_PerfilGovTI_2014)
print(v)

#2.3-Utilizando o pacote sqldf e o conjunto de dados ESCOLAS.CSV importe os registros relativos às escolas
#do município do Rio de Janeiro.
#Para fazer esta seleção as variáveis FK_COD_MUNICIPIO e ID_DEPENDENCIA_ADM devem ser, respectivamente,
#iguais á 3304557 e 3.
library(sqldf)
Escolas <- read.csv.sql("~/Desktop/ILE/Lab1/dados/ESCOLAS.CSV", 
                        sql = "select * from file where FK_COD_MUNICIPIO = 3304557 and ID_DEPENDENCIA_ADM = 3", 
                        dbname = "escolas_db", header = T, row.names = F, sep = "|")
#View(Escolas)

# 2.4 - No site do Sistema de Inoformações Contábeis e Fiscais(Siconfi) é possível baixar diversos conjuntos de
# dados contábeis e fiscais de estados e municípios.
# O arquivo finbraRREO_MUN_Receitarealizadatotal(ultimos12meses).zip, obtido no site em referência,
# contém um arquivo .csv com informações relativas ao Anexo 03-Demonstrativo da Receita Corrente
# Líquida para o primeiro bimestre de 2015. Importe o conteúdo do arquivo. Quantos registros tem o conjunto
# de dados?
library(sqldf)
finbra <- read.csv.sql("~/Desktop/ILE/Lab1/dados/finbraRREO2.csv", 
                        sql = "select * from file", 
                        header = TRUE, row.names = FALSE, sep = ";", skip = 5)
#View(finbra)
v <- nrow(finbra)
print(v)
# OU
v <- read.csv.sql("~/Desktop/ILE/Lab1/dados/finbraRREO2.csv", 
                       sql = "select count(*) from file", 
                       header = TRUE, row.names = FALSE, sep = ";", skip = 5)
print(v)

# 2.5 - O arquivo SICONFI_DCA_6561_ANUAL_1.xls contém dados contábeis do município de Angra dos Reis
#relativos ao exercício de 2014. Utilizando qualquer um dos pacotes para importação de arquivos em excel
#vistos em sala de aula, importe o conteúdo da planilha DCA-Anexo I-G.
library(readxl)
SICONFI_DCA_6561_ANUAL_1 <- read_excel("~/Desktop/ILE/Lab1/dados/SICONFI_DCA_6561_ANUAL_1.xls", 
                                       skip = 16)
View(SICONFI_DCA_6561_ANUAL_1)

#2.6 - O R dispõe dos conjuntos de dados rock e ToothGrowth. Exporte estes dados para um arquivo do
#Excel, de forma que cada conjunto de dados fique em uma planilha diferente.
library(xlsx)
data("rock")
data(ToothGrowth)
file <- paste('/home/rodrigo/Desktop/ILE/Lab1/dados/out', "/arquivo.xls", sep="")
res <- write.xlsx(rock, file, sheetName="rock", col.names=TRUE, row.names=FALSE)  
res <- write.xlsx(ToothGrowth, file, sheetName="ToothGrowth", append=TRUE, col.names=TRUE, row.names=FALSE)

#2.7 - Importe os dados contidos no arquivo 14SerieRouboVeiculo2015.xls obtido no site do Instituto de
#Segurança Pública (ISP). Ignore a coluna e linha de totalizações.
library(readxl)
SerieRouboVeiculo2015 <- read_excel("~/Desktop/ILE/Lab1/dados/14SerieRouboVeiculo2015.xls", 
                                    range = "B7:O146")

