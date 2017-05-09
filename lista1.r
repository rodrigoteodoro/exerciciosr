#Crie um vetor chamado vec contendo os elementos {26, NA, 72, 45, 12, 16, NA, 88} e obtenha o
#que se pede:
vec <- c(26, NA, 72, 45, 12, 16, NA, 88)

#a) Obtenha um novo vetor (vec1) contendo o primeiro e o último elementos do vetor vec;
vec1 <- c(vec[c(1, length(vec))])

#b) Insira entre os elementos 72 e 45 do vetor vec os elementos {24, 13, 42}. Dica: a função append()
#pode ser útil;
vec <- append(vec, c(24, 13, 42))

#c) Obtenha o produto dos elementos do vetor vec;
prod(vec, na.rm = TRUE)

#d) Obtenha os valores que não sejam NA;
vec_sem_na = vec[!is.na(vec)]

#e) Obtenha os valores maiores que a média dos elementos do vetor vec.
vec_gt_media <- vec_sem_na[vec_sem_na>mean(vec_sem_na)]

#f) Obtenha um vetor contendo os valores que imediatamente antecedem e sucedem a cada NA. Dica: a
#função which() pode ser útil;
vec_val_pos_na <- vec[c(which(is.na(vec))+1)]

#g) Dados os vetores a <- c(14, 27, 45, 72, 19, -12) e b <- c(6, 9, 8, NA, 7, 5), calcule a + b
#+ 5;
a <- c(14, 27, 45, 72, 19, -12) 
b <- c(6, 9, 8, NA, 7, 5)
c <- a + b + 5
print(c)

#h) Crie um vetor num_pares contendo os números inteiros pares menores que 100;
num_pares <- c(2:100)
num_pares <- num_pares[num_pares %% 2 == 0]
print(num_pares)

#i) Exclua deste vetor os valores maiores que 60 e menores que 80;
num_pares_gt_60_lt_80 <- num_pares[num_pares > 60 & num_pares < 80]
print(num_pares_gt_60_lt_80)

#j) Encontre a variância dos valores remanescentes.
variancia = var(num_pares_gt_60_lt_80, na.rm=TRUE)
print(variancia)

#1.2 - O volume de um cone de raio R e altura H é dado por 13 × π × R 2 × H. Tendo obtido o volume e a
#altura de seis cones, apresentados a seguir, calcule o volume de cada um deles.
#R = {2.27, 1.98, 1.69, 1.88, 1.64, 2.14}
#H = {8.28, 8.04, 9.06, 8.70, 7.58, 8.34}
R <- c(2.27, 1.98, 1.69, 1.88, 1.64, 2.14)
H <- c(8.28, 8.04, 9.06, 8.70, 7.58, 8.34)
# Formula do volume do cone: (Pi * r^2 * h) / 3
fn <- function(r, h) { (pi * (r^2) * h) / 3 }
volume <-fn(R, H)
print(volume)

#Operações matemáticas
#1.3 - Calcule o que se pede:
# A
v <- 3 + 9 / 5
print(v)

# B
v <- ((56^4) + (29/5))
print(v)

# C
v <- sqrt(76)
print(v)

# D
v <- log(12345) 
print(v)

# E
v <- log2(12345) 
print(v)

# F
v <- log10(12345) 
print(v)

# G
v <- combn(6, 2)
print(v)

# H
#|18 − 50|
v <- abs(18-50)
print(v)

# I - sin(π), cos(π), tan(π)
v <- sin(pi)
print(v)
v <- cos(pi)
print(v)
v <- tan(pi)
print(v)

# J - Arredonde o valor de π para 4 casas decimais;
v <- round(pi,digits = 4)
print(v)


#Matrizes
a <- rbind(c(35, 72, 45), c(20, 9, 17), c(13, 16, 78))
print(a)

# a) obtenha os elementos da diagonal principal
dig <-diag(a)
print(dig)

# b) obtenha a soma dos elementos da matriz;
v <- sum(a)
print(v)

# c) obtenha a soma dos elementos da primeira linha e da segunda coluna (A 11 + A 12 + A 13 + A 12 + A 22 + A 32 )
v <- sum(a[1,], a[,2])
print(v)

# d) obtenha a soma da primeira coluna com com a terceira linha (A .1 + A3.)
v <- sum(a[,1], a[3,])
print(v)

# e) faça a trasposição da matriz;
v <- t(a)
print(v)

# f) crie duas novas colunas com os valores: coluna 4:{27, 48, 23}, coluna 5:{12, 3, 9};
a <- cbind(a, c(27, 48, 23), c(12, 3, 9))
print(a)

# g) substitua a terceira coluna de A pela soma da segunda e terceira colunas;
v <- a[,2] + a[,3]
a[,3] <- v 
print(a)

# Dataframes
df <- data.frame(
  nome = c('Marcos', 'João', 'José', NA, 'Maria', 'Helena', 'Jordana'),
  idade = c(44, 26, NA, 29, 41, 55, 72))

# a) Obtenha as linhas para as quais existam NA. Dica: a função complete.cases() pode ser útil;
v <- complete.cases(df)
v = df[which(!complete.cases(df)),]
print(v)

# b) Obtenha a soma dos valores da coluna idade;
v <- sum(df$idade, na.rm = TRUE)
print(v)

# c) Selecione a linha contendo o nome da pessoa de menor idade;
v <- df[which(df$idade == min(df$idade, na.rm = TRUE)), ]
print(v)

# d) Obtenha as linhas para as quais não existam NA;
v <- df[which(complete.cases(df)),]
print(v)

# e) Calcule as dimensões de df['idade'] e df[['idade']]. Use a função dim();
v <- dim(df['idade'])
print(v)
v <- dim(df['nome']) # deve ser nome, erro no copy and paste da questao
print(v)

# f) Obtenha os nomes das variáveis do data frame df;
v <- names(df)
print(v)

# g) Adicione ao data frame os seguintes valores {Felipe, 36}, {Carla, 49} e {Rosane, 18};
de<-data.frame(nome = c("Felipe", "Carla", "Rosane"), idade=c(36, 49, 18))
v <- rbind(df, de)
print(v)

# h) Obtenha os números das linhas para as quais existam NA;
v = which(!complete.cases(df))
print(v)

#1.6 - Considere que você possua dados sobre o peso (em kg) e altura (em cm) de um conjunto de pessoas,
# conforme mostrado na tabela abaixo.
df<-data.frame(nome = c('Pedro', 'Jose', 'Maria', 'Sandra'), 
               altura=c(180, 165, 160, 193), 
               peso=c(87, 58, 65, 100))
print(df)
# Calcule o índice de massa corporal das 4 pessoas e identifique qual delas está com o IMC maior que 25.
imc <- function(peso, altura) { 
  i <- round((peso/((altura/100)^2)), 1) 
  i}
dfimc <- data.frame(nome=df$nome,
                  imc=imc(df$peso, df$altura))
print(dfimc)
print(dfimc[which(dfimc$imc > 26),])

#vFunções
#1.7 - Experimente o comando which.min(c(3,5,1,7,8)). Explique o valor retornado pela função.
v <- which.min(c(3,5,1,7,8))
print(v)
# RESPOSTA: Retorna o indice (localizacao) do menor valor contido no vetor

# Listas
#1.8 - Considere a lista x.lis definida da seguinte forma: x.lis <- list(a=1:10, b=letters[1:3],
#                                                                        c=matrix(1:10,ncol=2)).

x.lis <- list(a=1:10, b=letters[1:3], c=matrix(1:10,ncol=2))
print(x.lis)

# a) Obtenha a soma acumulada dos elementos da primeira componente;
v <- sum(x.lis[[1]])
print(v)

# b) Obtenha a segunda componente;
print(x.lis[[2]])

# c) Obtenha os nomes das componentes da lista;
print(names(x.lis))

# d) Adicione o vetor vec criado anteriormente à lista;
vec <- c(26, NA, 72, 45, 12, 16, NA, 88)  # Criei array novamente com os valores iniciais
x.lis$d <- vec
print(x.lis)
