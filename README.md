# Modeling equid tooth growth, the accumulation of stable isotopes in dental enamel, and subsequent sampling for reconstructing paleoenvironments
This repository contains code and data associated with a forthcoming manuscript "Simulating the formation of herbivore tooth death assemblages to improve
expectations for paleoenvironmental reconstruction from intra-tooth isotopic analysis," currently under review in _Journal of Archaeological Science_. The code is written using the R Statistical Computing platform (v4.5.0):

  R Core Team (2025). _R: A Language and Environment
  for Statistical Computing_. R Foundation for
  Statistical Computing, Vienna, Austria.
  <https://www.R-project.org/>.

## Description of repository
Included in the repository are:
 - teethModel.Rproj: An R project file that is used to establish the working directory for the associated code
 - zebraTeethSim8.Rmd: An RMarkdown document containing the code used for the simulation of equid tooth growth
 - teethDataViz.qmd: A Quarto document containing the code used to generate visualizations of the data from the simulation
 - EFTM_analysis.R: An R script file used for the comparitive analysis between simulation outcomes and data from the South Afrcan site of Elandsfontein
 - A **data** folder, containing
   - birthDeath.csv: A comma-separated values file containing fertility and mortality profiles for the equid tooth simulations
   - growthRates.csv: A comma-separated values file containing daily growth rates for the linear and non-linear growth models used in the simulations
   - sim_d18O.csv: A comma-separated values file containing models of change in environmental d18O at different levels of amplitude
   - sim_d180.csv: A comma-separated values file containing models of change in environmental d18O at different levels of amplitude (duplicated)
 - An **outputs** folder, containing
   - simZebraDataEX12.csv: A comma-separated values file containing simulation outputs for Experiments 1 & 2
   - simZebraDataEX3.csv: A comma-separated values file containing simulation outputs for Experiment 3
   - simZebraDataEX4.csv: A comma-separated values file containing simulation outputs for Experiment 4 (resampled in subsequent experiments)
 - An **elandsfonteinData** folder, containing
   - EFTM Equus d18O.csv: A comma-separated values file containing measured d18O from zebra teeth recovered from the South Afrcan site of Elandsfontein
   - EFTM Equus d18O.xlsx: A Microsoft Excel spreadsheet file containing measured d18O from zebra teeth recovered from the South Afrcan site of Elandsfontein

## Instructions
To reproduce the published results or modify the outcomes, it is highly recommended to use [Posit RStudio](https://posit.co/download/rstudio-desktop/) (2025.05.1 Build 513 used here), and open the associated R project file (teethModel.Rproj). 
- To run the **simulation** code, use the *zebraTeethSim8.Rmd* file (Note: To overwrite the published output datafiles, uncomment lines starting with 'write.csv')
- To **visualize the output data and reproduce the visualizations used in the study**, use the *teethDataViz.qmd* file
- For the **Elandsfontein data assessment (Table 3)**, use the *EFTM_analysis.R* file

## R Session Info
```
R version 4.5.0 (2025-04-11 ucrt)
Platform: x86_64-w64-mingw32/x64
Running under: Windows 11 x64 (build 26100)

Matrix products: default
  LAPACK version 3.12.1

locale:
[1] LC_COLLATE=English_United States.utf8 
[2] LC_CTYPE=English_United States.utf8   
[3] LC_MONETARY=English_United States.utf8
[4] LC_NUMERIC=C                          
[5] LC_TIME=English_United States.utf8    

time zone: America/New_York
tzcode source: internal

attached base packages:
[1] stats     graphics  grDevices utils     datasets 
[6] methods   base     

other attached packages:
 [1] scales_1.4.0    lubridate_1.9.4 forcats_1.0.0  
 [4] stringr_1.5.1   dplyr_1.1.4     purrr_1.0.4    
 [7] readr_2.1.5     tidyr_1.3.1     tibble_3.3.0   
[10] ggplot2_3.5.2   tidyverse_2.0.0

loaded via a namespace (and not attached):
 [1] gtable_0.3.6       compiler_4.5.0     tidyselect_1.2.1  
 [4] yaml_2.3.10        fastmap_1.2.0      R6_2.6.1          
 [7] generics_0.1.4     knitr_1.50         pillar_1.10.2     
[10] RColorBrewer_1.1-3 tzdb_0.5.0         rlang_1.1.6       
[13] stringi_1.8.7      xfun_0.52          timechange_0.3.0  
[16] cli_3.6.5          withr_3.0.2        magrittr_2.0.3    
[19] digest_0.6.37      grid_4.5.0         rstudioapi_0.17.1 
[22] hms_1.1.3          lifecycle_1.0.4    vctrs_0.6.5       
[25] evaluate_1.0.3     glue_1.8.0         farver_2.1.2      
[28] rmarkdown_2.29     tools_4.5.0        pkgconfig_2.0.3   
[31] htmltools_0.5.8.1
```
