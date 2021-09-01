# Load libraries
library(censusapi)
library(tidycensus)
library(tidyverse)
library(sf)
library(stringr)
library(reshape2)
library(data.table)
library(readr)

#import
int_MCD <- read_csv("G:/Shared drives/Data Coordination/2020 Census/2020 Redistricting Data/Analyses/renamed for GIS/int_MCD.csv")
int_PD <- read_csv("G:/Shared drives/Data Coordination/2020 Census/2020 Redistricting Data/Analyses/renamed for GIS/int_PD.csv")

#analyze
noPhlMCD<-int_MCD[!(int_MCD$GEOCODE=="4210160000"),]

#int_PD$geocode2 <- int_PD$GEOCODE
#int_PD <- subset(int_PD, select = -c(GEOCODE))

allTogetherNow <- bind_rows(int_PD, noPhlMCD)

#export
write.csv(allTogetherNow, "int_MCD_PhiCPA.csv")