# Automated Workflow Composition System for LC-HRMS Metabolomics Research

The objective of this study is to develop an automated workflow composition system for LC-HRMS metabolomics data processing. The system is built upon [APE](https://github.com/sanctuuary/APE)

## How to reproduce the result

```
bash run.sh
```

Recommended workflows for the three use cases will be stored under folders `LC_MS_Metabolomics/No1_function/`. `LC_MS_Metabolomics/No2_function/`, `LC_MS_Metabolomics/No3_function/`.

## Related configurations

1. The **domain model** is stored in `LCMS_Metabolomics/bio.tools_lcms_metabolomics_function.json`

2. **Workflow specification** are stored in files `LCMS_Metabolomics/No1_function/config_no1.json`. `LCMS_Metabolomics/No2_function/config_no2.json`, `LCMS_Metabolomics/No3_function/config_no3.json`.

3. **Workflow constraints** are stored in files `LCMS_Metabolomics/No1_function/constraints_no1.json`. `LCMS_Metabolomics/No2_function/constraints_no2.json`, `LCMS_Metabolomics/No3_function/constraints_no3.json`.