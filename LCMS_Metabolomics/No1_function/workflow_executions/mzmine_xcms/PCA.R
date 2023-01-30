library(xcms)
library(faahKO)
library(RColorBrewer)
library(pander)
library(magrittr)
library(pheatmap)
library(SummarizedExperiment)
library(metaMS)
library(factoextra)
library(MSnbase)

fs <- dir("/Users/xinsongdu/mnt/data/metabolomics/ST000235/raw_files/pos_mzmine_mzml/", full.names = TRUE,
            recursive = TRUE)

# pd <- data.frame(sample_name = sub(basename(fs), pattern = ".CDF",
#                                    replacement = "", fixed = TRUE),
#                  stringsAsFactors = FALSE)