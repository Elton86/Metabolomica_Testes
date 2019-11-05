#Teste 2
#COMO TRANSFORMAR UMA BASE NORMAL PARA EXECUTAR O PCA
data(foods) ## see Eriksson et al. (2001); presence of 3 missing values (NA)
head(foods)
foodMN <- as.matrix(foods[, colnames(foods) != "Country"])
rownames(foodMN) <- foods[, "Country"]
head(foodMN)
foo.pca <- opls(foodMN)

attach(foodMN)
strF(dataMatrix)
imageF(dataMatrix)

#CONVERTENDO
sacurine.neg_sampleMetadata_matrix <- as.matrix(sacurine.neg_sampleMetadata[, colnames(sacurine.neg_sampleMetadata) != "X"])
head(sacurine.neg_sampleMetadata_matrix)
rownames(sacurine.neg_sampleMetadata_matrix) <- sacurine.neg_sampleMetadata[, "X"]
head(sacurine.neg_sampleMetadata_matrix)
sacurine.pca <- opls(sacurine.neg_sampleMetadata_matrix)


fileurl <- "C://Users/elton/Documents/Bases/feces_metabolites.xml"
doc <- xmlParse(fileurl,useInternalNodes = TRUE) ##- is to parse the xml content, the parsed content is stored into doc
doc

xl <-xmlToList(doc, addAttributes = TRUE, simplify = FALSE) #TESTE 2
xL <- xmlToList(doc) ###is to convert xml doc into List

data <- ldply(xL, data.frame)
head(data)