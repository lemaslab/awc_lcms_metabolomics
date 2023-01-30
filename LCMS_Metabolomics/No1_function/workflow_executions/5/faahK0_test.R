library(faahKO)
xs <- group(faahko)

mzt <- data.frame(character(0))
mzt <- xcms:::mzTabHeader(mzt,
                          version="1.0", mode="Complete", type="Quantification",
                          description="faahKO",
                          xset=xs)
mzt <- xcms:::mzTabAddSME(mzt, xs)

xcms:::writeMzTab(mzt, "/Users/xinsongdu/mnt/projects/metabolomics_ontology/My_Cases/LCMS_Metabolomics/No1_function/workflow_executions/5/results/faahK0.mzTab")
