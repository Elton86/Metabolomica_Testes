BiocManager::install("ropls")

#TRABALHANDO COM PCA

data(sacurine) #baixa a base
names(sacurine) #mostra o nome das colunas da base
attach(sacurine)
strF(dataMatrix)
imageF(dataMatrix)#imagem da matriz de ddos

#o comando opls gera o PCA neste pacote
#obs: com este comando tambem é gerado um sumário do modelo
sacurine.pca <- opls(dataMatrix)



genderFc <- sampleMetadata[, "gender"] #Cria um vetor com masculino e feminino
plot(sacurine.pca,
     typeVc = "x-score",
     parAsColFcVn = genderFc) #cria um grafico pelo factor genedro


#testanto exemplo com condição de peso
valor_bmi <- sampleMetadata[,"bmi"]
BMI_teste <- data.frame(valor_bmi)
BMI_teste$Condicao <- ifelse(valor_bmi >= 30, "Obeso", "normal")
BMI_teste$Condicao <- as.factor(BMI_teste$Condicao)
plot(sacurine.pca,
     typeVc = "x-score", #gráficos complementares ex: ("outlier", "predict-train", "xy-score", "xy-weight")
     parAsColFcVn = BMI_teste$Condicao) 

names(sampleMetadata)

#personalização dos gráficos
plot(sacurine.pca,
     typeVc = "x-score",
     parAsColFcVn = genderFc,
     parLabVc = as.character(sampleMetadata[, "age"]),
     parPaletteVc = c("blue2", "magenta"))



#TRABALHANDO COM PLS E PLS-DA
sacurine.plsda <- opls(dataMatrix, genderFc)

#TRABALHANDO COM OPLS E OPLS-DA
sacurine.oplsda <- opls(dataMatrix, genderFc,
                        predI = 1, orthoI = NA
                               )
#customização de gráficos 
plot(sacurine.oplsda ,
     typeVc = "x-variance",
     parAsColFcVn = genderFc,
     parLabVc = as.character(sampleMetadata[, "gender"]),
     parPaletteVc = c("red", "green3"))



#teste PCA - Biplot
teste_pca <- pca(sacurine$sampleMetadata[,1:3])
biplot(teste_pca)


#tipos de gráficos ***********************************************

#'typeVc' elements must be either 'correlation', 'outlier', 'overview', 'permutation', 
#''predict-train', 'predict-test', 'x-loading', 'x-score', 'x-variance', 'xy-score', 'xy-weight'
