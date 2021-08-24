## Getting the Code and Software

1. Clone the repository. 
2. Download and install R from https://www.r-project.org/
3. Download and install R Studio from https://www.rstudio.com/products/rstudio/#Desktop

## Installing Package Dependencies 

The R script has the following dependencies: 
censusap
tidycensus
tidyverse
sf
stringr
reshape2
data.table
readr

If you have not previously installed the dependencies, you will need to do so. If you try to run the script without installing the packages, you will get an error message like 
`Error in library (name_of_package) : there is no package called 'name_of_package'`.

Install each package from R Studio's console (typically at the bottom of the screen in R Studio) with the command  `install.packages('name_of_package')` (include the quotation marks). 

## Updating the Script for a new Decennial Release 

1. Visit the census website to download scrips for accessing varibles
2. Adjust file names in R scripts and run

## Script Inventory
pa_pl_1.r , pa_pl_2.r and pa_pl_3.r 
-versions of the scripts provided by the census bureau for downloading of the ftp .pl format

pa_pl_4_all.r
-an adapted version of the script provided by the census bureau for joining all 3 parts of the PA files

nj_pl_1.r , nj_pl_2.r and nj_pl_3.r 
-versions of the scripts provided by the census bureau for downloading of the ftp .pl format

nj_pl_4_all.r
-an adapted version of the script provided by the census bureau for joining all 3 parts of the PA files

join_and_process.r 
-joins processes and exports to appropriate file folders 

## Running the Code

1. Open RStudio. 
2. Open the R file (File -> Open File)
3. Start with the variable.r file running it in its entirety then run the dataCollection.r files
4. Run the code by clicking the Source button or Ctrl+A followed by Ctrl+Enter.

