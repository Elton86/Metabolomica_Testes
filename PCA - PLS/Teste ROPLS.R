BiocManager::install("ropls")

library(ropls)

#TRABALHANDO COM PCA

data(sacurine) #baixa a base
names(sacurine) #mostra o nome das colunas da base
attach(sacurine)
strF(dataMatrix)
imageF(dataMatrix)#imagem da matriz de ddos

#o comando opls gera o PCA neste pacote
#obs: com este comando tambem ? gerado um sum?rio do modelo
sacurine.pca <- opls(sacurine$dataMatrix)

genderFc <- sampleMetadata[, "gender"] #Cria um vetor com masculino e feminino
plot(sacurine.pca,
     typeVc = "x-score",
     parAsColFcVn = genderFc) #cria um grafico pelo factor gênero

#testanto exemplo com condi??o de peso
valor_bmi <- sacurine$sampleMetadata[,"bmi"]
BMI_teste <- data.frame(valor_bmi)
BMI_teste$Condicao <- ifelse(valor_bmi >= 30, "Obeso", "normal")
BMI_teste$Condicao <- as.factor(BMI_teste$Condicao)
plot(sacurine.pca,
     typeVc = "x-score", #gr?ficos complementares ex: ("outlier", "predict-train", "xy-score", "xy-weight")
     parAsColFcVn = BMI_teste$Condicao) 

names(sampleMetadata)

#personaliza??o dos gr?ficos
plot(sacurine.pca,
     typeVc = "x-score",
     parAsColFcVn = genderFc,
     parLabVc = as.character(sampleMetadata [,"bmi"]),
     parPaletteVc = c( "red", "green"))


#TRABALHANDO COM PLS E PLS-DA
sacurine.plsda <- opls(dataMatrix, genderFc)

#TRABALHANDO COM OPLS E OPLS-DA
sacurine.oplsda <- opls(dataMatrix, genderFc,
                        predI = 1, orthoI = NA
                               )
#customiza??o de gr?ficos 
plot(sacurine.oplsda ,
     typeVc = "x-score",
     parAsColFcVn = genderFc,
     parLabVc = as.character(sampleMetadata[, "gender"]),
     parPaletteVc = c("red", "green3"))


#teste PCA - Biplot
teste_pca <- pca(sacurine$sampleMetadata[,1:3])
biplot(teste_pca)



tabella_teste <- dataMatrix

#tipos de gr?ficos ***********************************************

#'typeVc' elements must be either 'correlation', 'outlier', 'overview', 'permutation', 
#''predict-train', 'predict-test', 'x-loading', 'x-score', 'x-variance', 'xy-score', 'xy-weight'

strF(sacurine.pca)

plot(sacurine.pca,
     typeVc = "x-variance")


#PCA

#plot1
plot(sacurine.pca,
     typeVc = "overview")


#plot2
plot(sacurine.pca,
     typeVc = "x-score",
     parAsColFcVn = genderFc,
     parLabVc = as.character(sampleMetadata[, "age"]),
     parPaletteVc = c("red", "green3"))

#plot3
plot(sacurine.pca,
     typeVc = "outlier",
     parAsColFcVn = genderFc,
     parLabVc = as.character(sampleMetadata[, "age"]),
     parPaletteVc = c("red", "green3"))

     

#plot4
plot(sacurine.pca,
     typeVc = "x-loading")
