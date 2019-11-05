library(xcms)

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("xcmsraw")
aBiocManager::install("mzR")
BiocManager::install("msdata")
BiocManager::install("pheatmap")
BiocManager::install("ProtGenerics")

library(faahKO)
library(RColorBrewer)
library(pander)
library(magrittr)
library(pheatmap)
library(mzR)
library(ProtGenerics)


Dados_cru  <- xcmsRaw("C://Users/elton/Documents/Bases/Teste/FWS_100perNaCl/alg10.cdf", profstep = 1, profmethod = "bin", profparam =
          list(), includeMSn=FALSE, mslevel=NULL, scanrange=NULL)

names(attributes(Dados_cru))
str(Dados_cru)
head(Dados_cru@scanindex)

Dados_cru@env$mz[100:300]

head(rtime(Dados_cru))


mz.scan1<-Dados_cru@env$mz[(1+Dados_cru@scanindex[1]):Dados_cru@scanindex[2]]
intensity.scan1<-Dados_cru@env$intensity[(1+Dados_cru@scanindex[1]):Dados_cru@scanindex[2]]
plot(mz.scan1, intensity.scan1, type="h", main=paste("Scan 1 of file", basename(cdffiles[1]), sep=""))



#copia e cola
cdfpath <- system.file("cdf")
cdffiles <- list.files("C://Users/elton/Documents/Bases/Teste/", recursive = TRUE, full.names = TRUE)
xr<-xcmsRaw(cdffiles[1])
xr

names(attributes(xr))
str(xr)

mz.scan1<-xr@env$mz[(1+xr@scanindex[1]):xr@scanindex[2]]
 	intensity.scan1<-xr@env$intensity[(1+xr@scanindex[1]):xr@scanindex[2]]
 	plot(mz.scan1, intensity.scan1, type="h", main=paste("Scan 1 of file", basename(cdffiles[1]), sep=""))
 	##the easier way :p
 	scan1<-getScan(xr, 1)
 	head(scan1)
 	plotScan(xr, 1)
 	## End(Not run)

 
 	
 	
 	#####################################
 	cdfpath <- system.file("cdf")
 	cdffiles <- list.files("Bases/Teste/FWS_5percNaCL/", recursive = TRUE, full.names = TRUE)
 	raw_data <- readMSData(files = cdffiles, mode = "onDisk")
 	
 	head(rtime(raw_data))
 	
 	mzs <- mz(raw_data)
 	
 	## Split the list by file
 	mzs_by_file <- split(mzs, f = fromFile(raw_data))
 	
 	length(mzs_by_file)
 	
 	
 	## Get the base peak chromatograms. This reads data from the files.
 	bpis <- chromatogram(raw_data, aggregationFun = "max")
 	## Define colors for the two groups
 	group_colors <- paste0(brewer.pal(3, "Set1")[1:2], "60")
 	names(group_colors) <- c("KO", "WT")
 	
 	## Plot all chromatograms.
 	plot(bpis, col = group_colors[raw_data$sample_group])
 	
 	
 	
 	tc <- split(tic(raw_data), f = fromFile(raw_data))
 	boxplot(tc, col = group_colors[raw_data$sample_group],
 	        ylab = "intensity", main = "Total ion current")
 	
 	rtr <- c(2700, 2900)
 	mzr <- c(334.9, 335.1)
 	## extract the chromatogram
 	chr_raw <- chromatogram(raw_data, mz = mzr, rt = rtr)
 	plot(chr_raw, col = group_colors[chr_raw$sample_group])
 	