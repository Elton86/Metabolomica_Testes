#Teste da Base exportada pelo MATLAB
BiocManager::install("biosigner")

#instalar pacote > R.matlab
library(R.matlab)
library("biosigner")

base <- readMat("MAT/Base/IBDTotal.mat")
BASE <- base
str(base)
head(base)
names(base)
base_teste_con <- base
attach(BASE)


#teste - mexer a parAr daqui

nomes <- as.data.frame("nomes")
nomes <- c("a", "b", "c", "aa", "eb", "3c", "a2", "4b", "5c", "aa7", "5eb", "32c", "ah", "bj", 
           "cj", "aaj", "ebj", "3cj", "a2j", "4jb", "5jc", "aja7", "j5eb", "32jc" ,
           "a4", "b4", "4c", "4aa", "xeb", "3xc", "a2x", "4xb", "5xc", "aaxx7", "5ebx", "32xc", "xah", "bxj", 
           "cxj", "axaj", "ebjx", "3xcj", "a2xj", "4jbx", "5jxc", "axja7")

names(base_teste_con$Spectra) = c("variableMetadata","dataMatrix","sampleMetadata")

base_teste_con$Spectra$variableMetadata <- list(var)
names (base_teste_con[["Spectra"]][["variableMetadata"]]) <- c("variavel")




imageF(base_teste_con$Spectra$dataMatrix)

pac_mat <- opls(base_teste_con$Spectra$sampleMetadata)


variableMetadata <-base_teste_con$Spectra$variableMetadata
dataMatrix <- base_teste_con$Spectra$dataMatrix
sampleMetadata <- base_teste_con$Spectra$sampleMetadata

BASE <- list(dataMatrix, sampleMetadata, variableMetadata)
names(BASE) <- c("dataMatrix", "sampleMetadata", "variableMetadata")

#testanto exemplo com condi??o de peso
pacientes <- BASE$sampleMetadata$nome_pac[1:46]  
  

tabela <- data.frame(pacientes)
tabela$tipo[29:46] <- c("controle")
tabela$tipo[1:28] <- c("tratamento")
tabela$pacientes <- as.character(tabela$pacientes)
tabela$tipo <- as.factor(tabela$tipo)
plot(pca_BASE,
     typeVc = "x-score", #gr?ficos complementares ex: ("outlier", "predict-train", "xy-score", "xy-weight")
     parAsColFcVn = tabela$tipo,
     predI = 1, orthoI = NA
     
     
     ) 

nomes_variaveis <- base[["Spectra"]][[1]]


df_teste <- data.frame(
  nome = c("João", "Pedro", "Amanda", "Fábio", "Fernanda", "Gustavo"),
  altura = c(1.80, 1.77, 1.71, 1.65, 1.66, 1.63),
  idade = c(22, 21, 18, 20, 23, 19),
  sexo = c("masculino", "masculino", "feminino", "masculino", "feminino", "masculino"),
  peso = c(78.3, 82.1, 66.5, 88.1, 58, 75.4),
  fumante = c(TRUE, FALSE, FALSE, FALSE, TRUE, FALSE),
  uf = c("PB", "AL", "PE", "PE", "SP", "CE"),
  renda = c(2, 5, 10, 20, 10, NA)
)

str(df_teste_matriz)

df_teste_matriz <- as.matrix(df_teste)

write.xlsx(data, "MAT/Base/base_exp.xlsx")




data_1 <- data.matrix(sacurine$dataMatrix)
data_2 <- data.frame (base_teste_con$Spectra$dataMatrix)
data_3 <- as.matrix(data_2)


### AAQUUIII - Add nomes as matrizes
colnames(data_3) <- c(1:44001)
rownames(data_3) <- c(nomes)

base.pca <- opls(data_3)

plot(base.pca, typeVc = "correlation") #cria um grafico pelo factor gênero



