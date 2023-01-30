library(xcms)
library(faahKO)
library(RColorBrewer)
library(pander)
library(magrittr)
library(pheatmap)
library(SummarizedExperiment)
library(metaMS)
library(factoextra)

# Set the path of data files
data_path = "/Users/xinsongdu/mnt/data/metabolomics/ST000235/raw_files/pos/"

# Initialize list of data file paths
data_files = list.files(data_path, recursive = TRUE, full.names = TRUE)

# Peak detection
xset = xcmsSet(data_files)

# Peak grouping
xset = group(xset)

# retention time correction
xset2 = retcor(xset, family = "symmetric", plottype = "mdevden")

# Peak re-grouping after retention time correction
xset2 = group(xset2, bw=10)

# Peak filling
xset3 = fillPeaks(xset2)

# Produce peak table
peak_table = getPeakTable(xset3)

# Define group information
group_blank = c("QE2_sbs_11_1.blank.", "QE2_sbs_11_42.blank.", 
                "QE2_sbs_11_16.blank.", "QE2_sbs_11_29.blank.")
group_NOC = c("QE2_sbs_11_11.27NOC.", "QE2_sbs_11_15.29NOC.", "QE2_sbs_11_22.26NOC.", 
              "QE2_sbs_11_33.25NOC.", "QE2_sbs_11_12.30NOC.", "QE2_sbs_11_23.28NOC.", 
              "QE2_sbs_11_36.31NOC.", "QE2_sbs_11_41.32NOC.")
group_S = c("QE2_sbs_11_13.3S.", "QE2_sbs_11_9.5S.", "QE2_sbs_11_10.2S.", 
            "QE2_sbs_11_14.6S.", "QE2_sbs_11_21.1S.", "QE2_sbs_11_38.8S.", 
            "QE2_sbs_11_45.7S.", "QE2_sbs_11_6.4S.")
group_N = c("QE2_sbs_11_19.16N.", "QE2_sbs_11_20.11N.", "QE2_sbs_11_28.12N.", 
            "QE2_sbs_11_40.13N.", "QE2_sbs_11_46.14N.", "QE2_sbs_11_7.10N.", 
            "QE2_sbs_11_32.15N.", "QE2_sbs_11_8.9N.")
group_OC = c("QE2_sbs_11_24.17OC.", "QE2_sbs_11_26.23OC.", "QE2_sbs_11_35.22OC.", 
             "QE2_sbs_11_37.21OC.", "QE2_sbs_11_39.20OC.", "QE2_sbs_11_25.18OC.", 
             "QE2_sbs_11_27.24OC.", "QE2_sbs_11_34.19OC.")
group_pooledQC = c("QE2_sbs_11_31.pooled_qc.", "QE2_sbs_11_44.pooled_qc.", "QE2_sbs_11_18.pooled_qc.", 
                   "QE2_sbs_11_5.pooled_qc.")
group_neatQC = c("QE2_sbs_11_17.neat_qc.", "QE2_sbs_11_30.neat_qc.", "QE2_sbs_11_4.neat_qc.", 
                 "QE2_sbs_11_43.neat_qc.")
group_all = c(group_blank, group_NOC, group_S, group_N, group_OC, group_pooledQC, group_neatQC)

# PCA plot
peak_matrix = peak_table[group_all]
peak_matrix_t = t(peak_matrix)
peak_pca = prcomp(t(peak_matrix), scale = TRUE)
groups = c("blank", "blank", "blank", "blank", "NOC", "NOC", "NOC", "NOC", "NOC", 
           "NOC", "NOC", "NOC", "S", "S", "S", "S", "S", "S", "S", "S", "N", "N", 
           "N", "N", "N", "N", "N", "N", "OC", "OC", "OC", "OC", "OC", "OC", "OC",
           "OC", "pooledQC", "pooledQC", "pooledQC", "pooledQC", "neatQC", "neatQC", 
           "neatQC", "neatQC")
groups = as.factor(groups)

fviz_pca_ind(peak_pca,
             col.ind = groups, # color by groups
             palette = brewer.pal(n = 7, name = "Set2"),
             addEllipses = TRUE, # Concentration ellipses
             ellipse.type = "confidence",
             legend.title = "Groups",
             repel = TRUE
)