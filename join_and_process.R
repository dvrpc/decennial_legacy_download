# Load libraries
library(censusapi)
library(tidycensus)
library(tidyverse)
library(sf)
library(stringr)
library(reshape2)
library(data.table)
library(readr)

#pa query
##################
paFilt<- combinePA %>% filter(grepl("^42017|^42029|^42045|^42091|^42101", GEOCODE))

sumLevPA <- paFilt %>% filter(grepl('050|155|060|140|150|750', SUMLEV))


#nj query
#############
njFilt<- combineNJ %>% filter(grepl("^34005|^34007|^34015|^34021", GEOCODE))

sumLevNJ <- njFilt %>% filter(grepl('050|155|060|140|150|750', SUMLEV))

#dvrpc region combo

#query by sum level
####################
dvrpcRegionAll <- bind_rows(sumLevPA, sumLevNJ)
dvrpcRegionAll$GEOCODE <- as.character(dvrpcRegionAll$GEOCODE)

counties <- dvrpcRegionAll %>% filter(grepl('050', SUMLEV))
cdp <- dvrpcRegionAll %>% filter(grepl('155', SUMLEV))
mcd <- dvrpcRegionAll %>% filter(grepl('060', SUMLEV))
tract <- dvrpcRegionAll %>% filter(grepl('140', SUMLEV))
blockGroup <- dvrpcRegionAll %>% filter(grepl('150', SUMLEV))
block <-  dvrpcRegionAll %>% filter(grepl('750', SUMLEV))

#export all data files

#export all geos
################
#blocks
block$GEOCODE <- as.character(block$GEOCODE)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Block\\'
fileName = paste(path_out, 'allBlocks.csv',sep = '')
write.csv(block,fileName)
fileName2 = paste(path_out, 'allBlocks.txt',sep = '')
write_tsv(block, fileName2)

#block group
blockGroup$GEOCODE <- as.character(blockGroup$GEOCODE)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Block Group\\'
fileName = paste(path_out, 'allBlocksGroup.csv',sep = '')
write.csv(blockGroup,fileName)
fileName2 = paste(path_out, 'allBlocksGroup.txt',sep = '')
write_tsv(blockGroup, fileName2)

#tract
tract$GEOCODE <- as.character(tract$GEOCODE)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Tract\\'
fileName = paste(path_out, 'allTract.csv',sep = '')
write.csv(tract,fileName)
fileName2 = paste(path_out, 'allTract.txt',sep = '')
write_tsv(tract, fileName2)

#mcd
mcd$GEOCODE <- as.character(mcd$GEOCODE)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\MCD\\'
fileName = paste(path_out, 'allMCD.csv',sep = '')
write.csv(mcd ,fileName)
fileName2 = paste(path_out, 'allMCD.txt',sep = '')
write_tsv(mcd, fileName2)
#cdp
cdp$GEOCODE <- as.character(cdp$GEOCODE)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\CDP\\'
fileName = paste(path_out, 'allCDP.csv',sep = '')
write.csv(cdp,fileName)
fileName2 = paste(path_out, 'cdp.txt',sep = '')
write_tsv(cdp, fileName2)

#counties
counties$GEOCODE <- as.character(counties$GEOCODE)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\County\\'
fileName = paste(path_out, 'allCounty.csv',sep = '')
write.csv(counties,fileName)
fileName2 = paste(path_out, 'counties.txt',sep = '')
write_tsv(counties, fileName2)

#split files into segments

#block segs
#########
headerBlock <- block %>% select(c(GEOCODE))
block_p1 <- block %>% select(starts_with("p001"))
block_p1 <- bind_cols(headerBlock, block_p1)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Block\\'
fileName = paste(path_out, 'p1Blocks.csv',sep = '')
write.csv(block_p1,fileName)
fileName2 = paste(path_out, 'p1Blocks.txt',sep = '')
write_tsv(block_p1, fileName2)


block_p2 <- block %>% select(starts_with("p002"))
block_p2 <- bind_cols(headerBlock, block_p2)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Block\\'
fileName = paste(path_out, 'p2Blocks.csv',sep = '')
write.csv(block_p2,fileName)
fileName2 = paste(path_out, 'p2Blocks.txt',sep = '')
write_tsv(block_p2, fileName2)

block_p3 <- block %>% select(starts_with("p003"))
block_p3 <- bind_cols(headerBlock, block_p3)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Block\\'
fileName = paste(path_out, 'p3Blocks.csv',sep = '')
write.csv(block_p3,fileName)
fileName2 = paste(path_out, 'p3Blocks.txt',sep = '')
write_tsv(block_p3, fileName2)

block_p4 <- block %>% select(starts_with("p004"))
block_p4 <- bind_cols(headerBlock, block_p4)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Block\\'
fileName = paste(path_out, 'p4Blocks.csv',sep = '')
write.csv(block_p4,fileName)
fileName2 = paste(path_out, 'p4Blocks.txt',sep = '')
write_tsv(block_p4, fileName2)

block_p5 <- block %>% select(starts_with("p005"))
block_p5 <- bind_cols(headerBlock, block_p5)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Block\\'
fileName = paste(path_out, 'p5Blocks.csv',sep = '')
write.csv(block_p5,fileName)
fileName2 = paste(path_out, 'p5Blocks.txt',sep = '')
write_tsv(block_p5, fileName2)

block_h1 <- block %>% select(starts_with("H001"))
block_h1 <- bind_cols(headerBlock, block_h1)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Block\\'
fileName = paste(path_out, 'h1Blocks.csv',sep = '')
write.csv(block_h1,fileName)
fileName2 = paste(path_out, 'h1Blocks.txt',sep = '')
write_tsv(block_h1, fileName2)

#block group segs
#########
headerBlockGroup <- blockGroup %>% select(c(GEOCODE))
blockGroup_p1 <- blockGroup %>% select(starts_with("p001"))
blockGroup_p1 <- bind_cols(headerBlockGroup, blockGroup_p1)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Block Group\\'
fileName = paste(path_out, 'blockGroup_p1.csv',sep = '')
write.csv(blockGroup_p1,fileName)
fileName2 = paste(path_out, 'blockGroup_p1.txt',sep = '')
write_tsv(blockGroup_p1, fileName2)


blockGroup_p2 <- blockGroup %>% select(starts_with("p002"))
blockGroup_p2 <- bind_cols(headerBlockGroup, blockGroup_p2)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Block Group\\'
fileName = paste(path_out, 'blockGroup_p2.csv',sep = '')
write.csv(blockGroup_p2,fileName)
fileName2 = paste(path_out, 'blockGroup_p2.txt',sep = '')
write_tsv(blockGroup_p2, fileName2)

blockGroup_p3 <- blockGroup %>% select(starts_with("p003"))
blockGroup_p3 <- bind_cols(headerBlockGroup, blockGroup_p3)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Block Group\\'
fileName = paste(path_out, 'blockGroup_p3.csv',sep = '')
write.csv(blockGroup_p3,fileName)
fileName2 = paste(path_out, 'blockGroup_p3.txt',sep = '')
write_tsv(blockGroup_p3, fileName2)

blockGroup_p4 <- blockGroup %>% select(starts_with("p004"))
block_p4 <- bind_cols(headerBlockGroup, blockGroup_p4)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Block Group\\'
fileName = paste(path_out, 'blockGroup_p4.csv',sep = '')
write.csv(blockGroup_p4,fileName)
fileName2 = paste(path_out, 'blockGroup_p4.txt',sep = '')
write_tsv(blockGroup_p4, fileName2)

blockGroup_p5 <- blockGroup %>% select(starts_with("p005"))
block_p5 <- bind_cols(headerBlockGroup, blockGroup_p5)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Block Group\\'
fileName = paste(path_out, 'blockGroup_p5.csv',sep = '')
write.csv(blockGroup_p5,fileName)
fileName2 = paste(path_out, 'blockGroup_p5.txt',sep = '')
write_tsv(blockGroup_p5, fileName2)

blockGroup_h1 <- blockGroup %>% select(starts_with("H001"))
blockGroup_h1 <- bind_cols(headerBlockGroup, blockGroup_h1)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Block Group\\'
fileName = paste(path_out, 'h1Block_Group.csv',sep = '')
write.csv(blockGroup_h1,fileName)
fileName2 = paste(path_out, 'h1Blocks_group.txt',sep = '')
write_tsv(blockGroup_h1, fileName2)

#CDP segs
#########
headerCDP <- cdp %>% select(c(GEOCODE))
cdp_p1 <- cdp %>% select(starts_with("p001"))
cdp_p1 <- bind_cols(headerCDP, cdp_p1)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\CDP\\'
fileName = paste(path_out, 'cdp_p1.csv',sep = '')
write.csv(cdp_p1,fileName)
fileName2 = paste(path_out, 'cdp_p1.txt',sep = '')
write_tsv(cdp_p1, fileName2)


cdp_p2 <- cdp %>% select(starts_with("p002"))
cdp_p2 <- bind_cols(headerCDP, cdp_p2)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\CDP\\'
fileName = paste(path_out, 'cdp_p2.csv',sep = '')
write.csv(cdp_p2,fileName)
fileName2 = paste(path_out, 'cdp_p2.txt',sep = '')
write_tsv(cdp_p2, fileName2)

cdp_p3 <- cdp %>% select(starts_with("p003"))
cdp_p3 <- bind_cols(headerCDP, cdp_p3)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\CDP\\'
fileName = paste(path_out, 'cdp_p3.csv',sep = '')
write.csv(cdp_p3,fileName)
fileName2 = paste(path_out, 'cdp_p3.txt',sep = '')
write_tsv(cdp_p3, fileName2)

cdp_p4 <- cdp %>% select(starts_with("p004"))
cdp_p4 <- bind_cols(headerCDP, cdp_p4)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\CDP\\'
fileName = paste(path_out, 'cdp_p4.csv',sep = '')
write.csv(cdp_p4,fileName)
fileName2 = paste(path_out, 'cdp_p4.txt',sep = '')
write_tsv(cdp_p4, fileName2)

cdp_p5 <- cdp %>% select(starts_with("p005"))
cdp_p5 <- bind_cols(headerCDP, cdp_p5)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\CDP\\'
fileName = paste(path_out, 'cdp_p5.csv',sep = '')
write.csv(cdp_p5,fileName)
fileName2 = paste(path_out, 'cdp_p5.txt',sep = '')
write_tsv(cdp_p5, fileName2)

cdp_h1 <- cdp %>% select(starts_with("H001"))
cdp_h1 <- bind_cols(headerCDP, cdp_h1)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\CDP\\'
fileName = paste(path_out, 'h1cdp.csv',sep = '')
write.csv(cdp_h1,fileName)
fileName2 = paste(path_out, 'h1_cdp.txt',sep = '')
write_tsv(cdp_h1, fileName2)

#county
#############
headerCounties <- counties %>% select(c(GEOCODE))
counties_p1 <- counties %>% select(starts_with("p001"))
counties_p1 <- bind_cols(headerCounties, counties_p1)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\County\\'
fileName = paste(path_out, 'counties_p1.csv',sep = '')
write.csv(counties_p1,fileName)
fileName2 = paste(path_out, 'counties_p1.txt',sep = '')
write_tsv(counties_p1, fileName2)


counties_p2 <- counties %>% select(starts_with("p002"))
counties_p2 <- bind_cols(headerCounties, counties_p2)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\County\\'
fileName = paste(path_out, 'counties_p2.csv',sep = '')
write.csv(counties_p2,fileName)
fileName2 = paste(path_out, 'counties_p2.txt',sep = '')
write_tsv(counties_p2, fileName2)

counties_p3 <- counties %>% select(starts_with("p003"))
counties_p3 <- bind_cols(headerCounties, counties_p3)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\County\\'
fileName = paste(path_out, 'counties_p3.csv',sep = '')
write.csv(counties_p3,fileName)
fileName2 = paste(path_out, 'counties_p3.txt',sep = '')
write_tsv(counties_p3, fileName2)

counties_p4 <- counties %>% select(starts_with("p004"))
counties_p4 <- bind_cols(headerCounties, counties_p4)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\County\\'
fileName = paste(path_out, 'counties_p4.csv',sep = '')
write.csv(counties_p4,fileName)
fileName2 = paste(path_out, 'counties_p4.txt',sep = '')
write_tsv(counties_p4, fileName2)

counties_p5 <- counties %>% select(starts_with("p005"))
counties_p5 <- bind_cols(headerCounties, counties_p5)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\County\\'
fileName = paste(path_out, 'counties_p5.csv',sep = '')
write.csv(counties_p5,fileName)
fileName2 = paste(path_out, 'counties_p5.txt',sep = '')
write_tsv(counties_p5, fileName2)

counties_h1 <- counties %>% select(starts_with("H001"))
counties_h1 <- bind_cols(headerCounties, counties_h1)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\County\\'
fileName = paste(path_out, 'h1Counties.csv',sep = '')
write.csv(counties_h1,fileName)
fileName2 = paste(path_out, 'h1_counties.txt',sep = '')
write_tsv(counties_h1, fileName2)

#mcd
#############
headermcd <- mcd %>% select(c(GEOCODE))
mcd_p1 <- mcd %>% select(starts_with("p001"))
mcd_p1 <- bind_cols(headermcd, mcd_p1)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\MCD\\'
fileName = paste(path_out, 'mcd_p1.csv',sep = '')
write.csv(mcd_p1,fileName)
fileName2 = paste(path_out, 'mcd_p1.txt',sep = '')
write_tsv(mcd_p1, fileName2)


mcd_p2 <- mcd %>% select(starts_with("p002"))
mcd_p2 <- bind_cols(headermcd, mcd_p2)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\MCD\\'
fileName = paste(path_out, 'mcd_p2.csv',sep = '')
write.csv(mcd_p2,fileName)
fileName2 = paste(path_out, 'mcd_p2.txt',sep = '')
write_tsv(mcd_p2, fileName2)

mcd_p3 <- mcd %>% select(starts_with("p003"))
mcd_p3 <- bind_cols(headermcd, mcd_p3)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\MCD\\'
fileName = paste(path_out, 'mcd_p3.csv',sep = '')
write.csv(mcd_p3,fileName)
fileName2 = paste(path_out, 'mcd_p3.txt',sep = '')
write_tsv(mcd_p3, fileName2)

mcd_p4 <- mcd %>% select(starts_with("p004"))
mcd_p4 <- bind_cols(headermcd, mcd_p4)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\MCD\\'
fileName = paste(path_out, 'mcd_p4.csv',sep = '')
write.csv(mcd_p4,fileName)
fileName2 = paste(path_out, 'mcd_p4.txt',sep = '')
write_tsv(mcd_p4, fileName2)

mcd_p5 <- mcd %>% select(starts_with("p005"))
mcd_p5 <- bind_cols(headermcd, mcd_p5)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\MCD\\'
fileName = paste(path_out, 'mcd_p5.csv',sep = '')
write.csv(mcd_p5,fileName)
fileName2 = paste(path_out, 'mcd_p5.txt',sep = '')
write_tsv(mcd_p5, fileName2)

mcd_h1 <- mcd %>% select(starts_with("H001"))
mcd_h1 <- bind_cols(headermcd, mcd_h1)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\MCD\\'
fileName = paste(path_out, 'h1mcd.csv',sep = '')
write.csv(mcd_h1,fileName)
fileName2 = paste(path_out, 'h1_mcd.txt',sep = '')
write_tsv(mcd_h1, fileName2)

#tract
#############
headertract <- tract %>% select(c(GEOCODE))
tract_p1 <- tract %>% select(starts_with("p001"))
tract_p1 <- bind_cols(headertract, tract_p1)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Tract\\'
fileName = paste(path_out, 'tract_p1.csv',sep = '')
write.csv(tract_p1,fileName)
fileName2 = paste(path_out, 'tract_p1.txt',sep = '')
write_tsv(tract_p1, fileName2)


tract_p2 <- tract %>% select(starts_with("p002"))
tract_p2 <- bind_cols(headertract, tract_p2)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Tract\\'
fileName = paste(path_out, 'tract_p2.csv',sep = '')
write.csv(tract_p2,fileName)
fileName2 = paste(path_out, 'tract_p2.txt',sep = '')
write_tsv(tract_p2, fileName2)

tract_p3 <- tract %>% select(starts_with("p003"))
tract_p3 <- bind_cols(headertract, tract_p3)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Tract\\'
fileName = paste(path_out, 'tract_p3.csv',sep = '')
write.csv(tract_p3,fileName)
fileName2 = paste(path_out, 'tract_p3.txt',sep = '')
write_tsv(tract_p3, fileName2)

tract_p4 <- tract %>% select(starts_with("p004"))
tract_p4 <- bind_cols(headertract, tract_p4)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Tract\\'
fileName = paste(path_out, 'tract_p4.csv',sep = '')
write.csv(tract_p4,fileName)
fileName2 = paste(path_out, 'tract_p4.txt',sep = '')
write_tsv(tract_p4, fileName2)

tract_p5 <- tract %>% select(starts_with("p005"))
tract_p5 <- bind_cols(headertract, tract_p5)

path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Tract\\'
fileName = paste(path_out, 'tract_p5.csv',sep = '')
write.csv(tract_p5,fileName)
fileName2 = paste(path_out, 'tract_p5.txt',sep = '')
write_tsv(tract_p5, fileName2)

tract_h1 <- tract %>% select(starts_with("H001"))
tract_h1 <- bind_cols(headertract, tract_h1)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 redistricting legacy format\\Folder Structure for Outputs\\Tract\\'
fileName = paste(path_out, 'h1tract.csv',sep = '')
write.csv(tract_h1,fileName)
fileName2 = paste(path_out, 'h1_tract.txt',sep = '')
write_tsv(tract_h1, fileName2)