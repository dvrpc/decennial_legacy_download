# Load libraries
library(censusapi)
library(tidycensus)
library(tidyverse)
library(sf)
library(stringr)
library(reshape2)
library(data.table)
library(readr)

#combine 1st
dvrpcRegionAll <- bind_rows(combineNJ, combinePA)
dvrpcRegionAll$GEOID <- as.character(dvrpcRegionAll$GEOID)


#import cdp list
cdpGEOID <- read_csv("~/censusRetrival/cdpGEOID.csv")

#filter for region by list
cdpAll <- dvrpcRegionAll %>% filter(GEOCODE %in% c(cdpGEOID$GEOID))

#filter by cdp sumlev
cdpAll <- cdpAll %>% filter(grepl('160', SUMLEV))
cdp <- cdpAll
  
#export
#############
cdp <- bind_cols(headercdp, cdp)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\Folder Structure for Outputs\\CDP\\'
fileName = paste(path_out, 'cdp.csv',sep = '')
write.csv(cdp, fileName)
fileName2 = paste(path_out, 'cdp.txt',sep = '')
write_tsv(cdp, fileName2)

headercdp <- cdpAll %>% select(c(GEOCODE))
CDP_p1 <- cdpAll %>% select(starts_with("p001"))
CDP_p1 <- bind_cols(headercdp, CDP_p1)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\Folder Structure for Outputs\\CDP\\'
fileName = paste(path_out, 'CDP_p1.csv',sep = '')
write.csv(CDP_p1,fileName)
fileName2 = paste(path_out, 'cdp_p1.txt',sep = '')
write_tsv(CDP_p1, fileName2)


cdp_p2 <- cdp %>% select(starts_with("p002"))
cdp_p2 <- bind_cols(headercdp, cdp_p2)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\Folder Structure for Outputs\\CDP'
fileName = paste(path_out, 'cdp_p2.csv',sep = '')
write.csv(cdp_p2,fileName)
fileName2 = paste(path_out, 'cdp_p2.txt',sep = '')
write_tsv(cdp_p2, fileName2)

cdp_p3 <- cdp %>% select(starts_with("p003"))
cdp_p3 <- bind_cols(headercdp, cdp_p3)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\Folder Structure for Outputs\\CDP'
fileName = paste(path_out, 'cdp_p3.csv',sep = '')
write.csv(cdp_p3,fileName)
fileName2 = paste(path_out, 'cdp_p3.txt',sep = '')
write_tsv(cdp_p3, fileName2)

cdp_p4 <- cdp %>% select(starts_with("p004"))
cdp_p4 <- bind_cols(headercdp, cdp_p4)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\Folder Structure for Outputs\\CDP'
fileName = paste(path_out, 'cdp_p4.csv',sep = '')
write.csv(cdp_p4,fileName)
fileName2 = paste(path_out, 'cdp_p4.txt',sep = '')
write_tsv(cdp_p4, fileName2)

cdp_p5 <- cdp %>% select(starts_with("p005"))
cdp_p5 <- bind_cols(headercdp, cdp_p5)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\Folder Structure for Outputs\\CDP'
fileName = paste(path_out, 'cdp_p5.csv',sep = '')
write.csv(cdp_p5,fileName)
fileName2 = paste(path_out, 'cdp_p5.txt',sep = '')
write_tsv(cdp_p5, fileName2)

cdp_h1 <- cdp %>% select(starts_with("H001"))
cdp_h1 <- bind_cols(headercdp, cdp_h1)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\Folder Structure for Outputs\\CDP'
fileName = paste(path_out, 'h1cdp.csv',sep = '')
write.csv(cdp_h1,fileName)
fileName2 = paste(path_out, 'h1_cdp.txt',sep = '')
write_tsv(cdp_h1, fileName2)
