# Load libraries
library(censusapi)
library(tidycensus)
library(tidyverse)
library(sf)
library(stringr)
library(reshape2)
library(data.table)
library(readr)

census_api_key("Insert here")
vari00 <- load_variables(2000, "sf1")
vari10 <- load_variables(2010, "sf1")
write_csv(vari00, "x2000Vari.csv")
write_csv(vari10, "x2010Vari.csv")


vars00 <- c("H003001",
            "H003002",
            "H003003",
            "P001001",
            "P008010",
            "P008003",
            "P008004",
            "P008005",
            "P008006",
            "P008007",
            "P008008",
            "P008009",
            "P027024",
            "P037002",
            "P037003",
            "PCT016025",
            "PCT016010",
            "P037005",
            "P037006",
            "P037007",
            "PCT016034",
            "P037009")
            

vars10 <- c("H003001",
            "H003002",
            "H003003",
            "P001001",
            "P004003",
            "P005003",
            "P005004",
            "P005005",
            "P005006",
            "P005007",
            "P005008",
            "P005009",
            "P042001",
            "P042002",
            "P042003",
            "P042004",
            "P042005",
            "P042006",
            "P042007",
            "P042008",
            "P042009",
            "P042010")

##########county##############

#2010
allCountyPA10 <- get_decennial(geography = "county", variables = vars10, year = 2010, state = "PA", geometry = TRUE, output = "wide")

allCountyNJ10 <- get_decennial(geography = "county", variables = vars10, year = 2010, state = "NJ", geometry = TRUE, output = "wide")

countyPA10<- allCountyPA10 %>% filter(grepl("^42017|^42029|^42045|^42091|^42101", GEOID))

countyNJ10<- allCountyNJ10 %>% filter(grepl("^34005|^34007|^34015|^34021", GEOID))

dvrpcCounty10 <- bind_rows(countyPA10, countyNJ10)

#2000

allCountyPA00 <- get_decennial(geography = "county", variables = vars00, year = 2000, state = "PA", geometry = TRUE, output = "wide")

allCountyNJ00 <- get_decennial(geography = "county", variables = vars00, year = 2000, state = "NJ", geometry = TRUE, output = "wide")

countyPA00 <- left_join(allCountyPA00_1, allCountyPA00_2, by )

countyPA00<- allCountyPA00 %>% filter(grepl("^42017|^42029|^42045|^42091|^42101", GEOID))

countyNJ00<- allCountyNJ00 %>% filter(grepl("^34005|^34007|^34015|^34021", GEOID))

dvrpcCounty00 <- bind_rows(countyPA00, countyNJ00)

###############blocks#######
#2010
BlockPA10_1 <- get_decennial(geography = "block", variables = vars10, year = 2010, state = "PA", county = "Bucks", geometry = TRUE, output = "wide")

BlockPA10_2 <- get_decennial(geography = "block", variables = vars10, year = 2010, state = "PA", county = "Chester", geometry = TRUE, output = "wide")

BlockPA10_3 <- get_decennial(geography = "block", variables = vars10, year = 2010, state = "PA", county = "Delaware", geometry = TRUE, output = "wide")

BlockPA10_4 <- get_decennial(geography = "block", variables = vars10, year = 2010, state = "PA", county = "Montgomery", geometry = TRUE, output = "wide")

BlockPA10_5 <- get_decennial(geography = "block", variables = vars10, year = 2010, state = "PA", county = "Philadelphia ", geometry = TRUE, output = "wide")

BlockNJ10_1 <- get_decennial(geography = "block", variables = vars10, year = 2010, state = "NJ", county = "Burlington", geometry = TRUE, output = "wide")

BlockNJ10_2 <- get_decennial(geography = "block", variables = vars10, year = 2010, state = "NJ", county = "Camden", geometry = TRUE, output = "wide")

BlockNJ10_3 <- get_decennial(geography = "block", variables = vars10, year = 2010, state = "NJ", county = "Gloucester", geometry = TRUE, output = "wide")

BlockNJ10_4 <- get_decennial(geography = "block", variables = vars10, year = 2010, state = "NJ", county = "Mercer", geometry = TRUE, output = "wide")

dvrpcBlock10 <- bind_rows(BlockPA10_1, BlockPA10_2, BlockPA10_3, BlockPA10_4, BlockPA10_5, BlockNJ10_1, BlockNJ10_2, BlockNJ10_3, BlockNJ10_4)

#2000
BlockPA00_1 <- get_decennial(geography = "block", variables = vars00, year = 2000, state = "PA", county = "Bucks", geometry = TRUE, output = "wide")

BlockPA00_2 <- get_decennial(geography = "block", variables = vars00, year = 2000, state = "PA", county = "Chester", geometry = TRUE, output = "wide")

BlockPA00_3 <- get_decennial(geography = "block", variables = vars00, year = 2000, state = "PA", county = "Delaware", geometry = TRUE, output = "wide")

BlockPA00_4 <- get_decennial(geography = "block", variables = vars00, year = 2000, state = "PA", county = "Montgomery", geometry = TRUE, output = "wide")

BlockPA00_5 <- get_decennial(geography = "block", variables = vars00, year = 2000, state = "PA", county = "Philadelphia ", geometry = TRUE, output = "wide")

BlockNJ00_1 <- get_decennial(geography = "block", variables = vars00, year = 2000, state = "NJ", county = "Burlington", geometry = TRUE, output = "wide")

BlockNJ00_2 <- get_decennial(geography = "block", variables = vars00, year = 2000, state = "NJ", county = "Camden", geometry = TRUE, output = "wide")

BlockNJ00_3 <- get_decennial(geography = "block", variables = vars00, year = 2000, state = "NJ", county = "Gloucester", geometry = TRUE, output = "wide")

BlockNJ00_4 <- get_decennial(geography = "block", variables = vars00, year = 2000, state = "NJ", county = "Mercer", geometry = TRUE, output = "wide")

dvrpcBlock00 <- bind_rows(BlockPA00_1, BlockPA00_2, BlockPA00_3, BlockPA00_4, BlockPA00_5, BlockNJ00_1, BlockNJ00_2, BlockNJ00_3, BlockNJ00_4)

###############block groups#######
#2010
blockGroupPA10_1 <- get_decennial(geography = "block group", variables = vars10, year = 2010, state = "PA", county = "Bucks", geometry = TRUE, output = "wide")

BlockGroupPA10_2 <- get_decennial(geography = "block group", variables = vars10, year = 2010, state = "PA", county = "Chester", geometry = TRUE, output = "wide")

BlockGroupPA10_3 <- get_decennial(geography = "block group", variables = vars10, year = 2010, state = "PA", county = "Delaware", geometry = TRUE, output = "wide")

BlockGroupPA10_4 <- get_decennial(geography = "block group", variables = vars10, year = 2010, state = "PA", county = "Montgomery", geometry = TRUE, output = "wide")

BlockGroupPA10_5 <- get_decennial(geography = "block group", variables = vars10, year = 2010, state = "PA", county = "Philadelphia ", geometry = TRUE, output = "wide")

BlockGroupNJ10_1 <- get_decennial(geography = "block group", variables = vars10, year = 2010, state = "NJ", county = "Burlington", geometry = TRUE, output = "wide")

BlockGroupNJ10_2 <- get_decennial(geography = "block group", variables = vars10, year = 2010, state = "NJ", county = "Camden", geometry = TRUE, output = "wide")

BlockGroupNJ10_3 <- get_decennial(geography = "block group", variables = vars10, year = 2010, state = "NJ", county = "Gloucester", geometry = TRUE, output = "wide")

BlockGroupNJ10_4 <- get_decennial(geography = "block group", variables = vars10, year = 2010, state = "NJ", county = "Mercer", geometry = TRUE, output = "wide")

dvrpcBlockGroup10 <- bind_rows(blockGroupPA10_1, BlockGroupPA10_2, BlockGroupPA10_3, BlockGroupPA10_4, BlockGroupPA10_5, BlockGroupNJ10_1, BlockGroupNJ10_2, BlockGroupNJ10_3, BlockGroupNJ10_4)

#2000
BlockGroupPA00_1 <- get_decennial(geography = "block group", variables = vars00, year = 2000, state = "PA", county = "Bucks", geometry = TRUE, output = "wide")

BlockGroupPA00_2 <- get_decennial(geography = "block group", variables = vars00, year = 2000, state = "PA", county = "Chester", geometry = TRUE, output = "wide")

BlockGroupPA00_3 <- get_decennial(geography = "block group", variables = vars00, year = 2000, state = "PA", county = "Delaware", geometry = TRUE, output = "wide")

BlockGroupPA00_4 <- get_decennial(geography = "block group", variables = vars00, year = 2000, state = "PA", county = "Montgomery", geometry = TRUE, output = "wide")

BlockGroupPA00_5 <- get_decennial(geography = "block group", variables = vars00, year = 2000, state = "PA", county = "Philadelphia ", geometry = TRUE, output = "wide")

BlockGroupNJ00_1 <- get_decennial(geography = "block group", variables = vars00, year = 2000, state = "NJ", county = "Burlington", geometry = TRUE, output = "wide")

BlockGroupNJ00_2 <- get_decennial(geography = "block group", variables = vars00, year = 2000, state = "NJ", county = "Camden", geometry = TRUE, output = "wide")

BlockGroupNJ00_3 <- get_decennial(geography = "block group", variables = vars00, year = 2000, state = "NJ", county = "Gloucester", geometry = TRUE, output = "wide")

BlockGroupNJ00_4 <- get_decennial(geography = "block group", variables = vars00, year = 2000, state = "NJ", county = "Mercer", geometry = TRUE, output = "wide")

dvrpcBlockGroup00 <- bind_rows(BlockGroupPA00_1, BlockGroupPA00_2, BlockGroupPA00_3, BlockGroupPA00_4, BlockGroupPA00_5, BlockGroupNJ00_1, BlockGroupNJ00_2, BlockGroupNJ00_3, BlockGroupNJ00_4)


##############tract#######

#2010
alltractPA10 <- get_decennial(geography = "tract", variables = vars10, year = 2010, state = "PA", geometry = TRUE, output = "wide")

alltractNJ10 <- get_decennial(geography = "tract", variables = vars10, year = 2010, state = "NJ", geometry = TRUE, output = "wide")

tractPA10<- alltractPA10 %>% filter(grepl("^42017|^42029|^42045|^42091|^42101", GEOID))

tractNJ10<- alltractNJ10 %>% filter(grepl("^34005|^34007|^34015|^34021", GEOID))

dvrpctract10 <- bind_rows(tractPA10, tractNJ10)

#2000

alltractPA00 <- get_decennial(geography = "tract", variables = vars00, year = 2000, state = "PA", geometry = TRUE, output = "wide")

alltractNJ00 <- get_decennial(geography = "tract", variables = vars00, year = 2000, state = "NJ", geometry = TRUE, output = "wide")

tractPA00<- alltractPA00 %>% filter(grepl("^42017|^42029|^42045|^42091|^42101", GEOID))

tractNJ00<- alltractNJ00 %>% filter(grepl("^34005|^34007|^34015|^34021", GEOID))

dvrpctract00 <- bind_rows(tractPA00, tractNJ00)


##############county subs######
#2010
allcountySubdivisionPA10 <- get_decennial(geography = "county subdivision", variables = vars10, year = 2010, state = "PA", geometry = TRUE, output = "wide")

allcountySubdivisionNJ10 <- get_decennial(geography = "county subdivision", variables = vars10, year = 2010, state = "NJ", geometry = TRUE, output = "wide")

countySubdivisionPA10<- allcountySubdivisionPA10 %>% filter(grepl("^42017|^42029|^42045|^42091|^42101", GEOID))

countySubdivisionNJ10<- allcountySubdivisionNJ10 %>% filter(grepl("^34005|^34007|^34015|^34021", GEOID))

dvrpccountySubdivision10 <- bind_rows(countySubdivisionPA10, countySubdivisionNJ10)

princeton <- subset(dvrpccountySubdivision10, GEOID == "3402160900" | GEOID == "3402160915")

dvrpccountySubdivision10 <- dvrpccountySubdivision10 [(!(dvrpccountySubdivision10$GEOID=="3402160900") & !(dvrpccountySubdivision10$GEOID=="3402160915")),]

princeton$GEOID <- as.numeric(princeton$GEOID)

princeton <- subset(princeton, select = -c(NAME))

princeton <- aggregate(princeton, 
                        by = list(unique.values = princeton$P042009), 
                        FUN = sum)

princeton$GEOID <- as.character(princeton$GEOID)

dvrpccountySubdivision10 <- bind_rows(dvrpccountySubdivision10, princeton)

#2000 
BlockToMCD_2000 <- read_csv("G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\mcd\\Sept10\\BlockToMCD.txt", 
                       col_types = cols(SUB_MCD = col_character(), 
                                        SUBNAME = col_character()))

BlockToMCD_2000 <- BlockToMCD_2000 %>% select(GEOID, GISJOIN2)

BlockToMCD_2000$GEOID <- as.character(BlockToMCD_2000$GEOID)

BlockToMCD_2000 <- left_join(dvrpcBlock00, BlockToMCD_2000, by = c("GEOID" = "GEOID"))

BlockToMCD_2000$GEOID <- as.numeric(BlockToMCD_2000$GEOID)

BlockToMCD_2000 <- subset(BlockToMCD_2000, select = -c(NAME))

dvrpccountySubdivision00 <- aggregate(BlockToMCD_2000, 
                        by = list(unique.values = BlockToMCD_2000$GISJOIN2), 
                        FUN = sum)

dvrpccountySubdivision00$building1 <- as.numeric(substr(dvrpccountySubdivision00$unique.values, 1,2))

dvrpccountySubdivision00$building2 <- as.numeric(substr(dvrpccountySubdivision00$unique.values, 4,6))

dvrpccountySubdivision00$unique.values <- as.character(dvrpccountySubdivision00$unique.values)

dvrpccountySubdivision00 <- dvrpccountySubdivision00 %>%
  mutate(unique.values = replace(unique.values, unique.values == "3402177210", "3402163850"))

dvrpccountySubdivision00 <- subset(dvrpccountySubdivision00, select = -c(GISJOIN2, GEOID))

dvrpccountySubdivision00 <- dvrpccountySubdivision00 %>% rename(GEOID = unique.values)

dvrpccountySubdivision00$GEOID <- as.character(dvrpccountySubdivision00$GEOID)

dvrpccountySubdivision00$GEOID[dvrpccountySubdivision00$GEOID == "340021060915"] <- "340021060900"

dvrpccountySubdivision00 <- dvrpccountySubdivision00 %>% group_by(GEOID) %>% summarise_each(funs(sum))

dvrpccountySubdivision00$GEOID[dvrpccountySubdivision00$GEOID == "340021077210"] <- "340021063850"
#############planning dist####

#2010

X2010distLookup <- read_csv("~/censusRetrival/2000distLookup.csv")

philaPD10 <- dvrpctract10 %>% filter(GEOID %in% c(X2010distLookup$TractID))

philaPD10$GEOID <- as.numeric(philaPD10$GEOID)

philaPD10 <- left_join(philaPD10, X2010distLookup, by = c("GEOID" = "TractID"))

philaPD10Nums <- philaPD10 %>% select(-c(NAME, geometry, DistrictName))

philaPD10 <- aggregate(philaPD10Nums, 
                        by = list(unique.values = philaPD10Nums$DistrictID), 
                        FUN = sum)

noPhlMCD<- dvrpccountySubdivision10[!(dvrpccountySubdivision10$GEOID=="4210160000"),]

noPhlMCD$GEOID <- as.numeric(noPhlMCD$GEOID)

philaPD10 = subset(philaPD10, select = -c(GEOID,DistrictID))

philaPD10 <- philaPD10 %>% rename(GEOID = unique.values)

dvrpcPD10 <- bind_rows(noPhlMCD, philaPD10)

dvrpcPD10$GEOID[dvrpcPD10$GEOID == "6804321815"] <- "3402160900"


## 2000
BlockToPhiPlanDist_2000 <- read_csv("G:/Shared drives/Data Coordination/2020 Census/2020 Redistricting Data/historicData/mcd/BlockToPhiPlanDist_2000.txt", 
                                    col_types = cols(SUB_MCD = col_character()))

BlockToPhiPlanDist_2000 <- BlockToPhiPlanDist_2000 %>% select(GEOID, GISJOIN2)

dvrpcBlock00$GEOID <- as.numeric(dvrpcBlock00$GEOID)

BlockToPhiPlanDist_2000 <- left_join(BlockToPhiPlanDist_2000, dvrpcBlock00, by = c("GEOID" = "GEOID"))

BlockToPhiPlanDist_2000 <- subset(BlockToPhiPlanDist_2000, select = -c(NAME, geometry))

philaPD00 <- BlockToPhiPlanDist_2000 %>% group_by(GISJOIN2) %>% summarise_each(funs(sum))

noPhlMCD00<- dvrpccountySubdivision00[!(dvrpccountySubdivision00$GEOID=="4210160000"),]

philaPD00 <- philaPD00 %>% select(-c(GEOID))

philaPD00 <- philaPD00 %>% rename(GEOID = GISJOIN2)

philaPD00$GEOID <- as.character(philaPD00$GEOID)

dvrpcPD00 <- bind_rows(noPhlMCD00, philaPD00)

dvrpcPD00$GEOID[dvrpcPD00$GEOID == "340021060915"] <- "340021060900"

dvrpcPD00 <- dvrpcPD00 %>% group_by(GEOID) %>% summarise_each(funs(sum))

dvrpcPD00$GEOID[dvrpcPD00$GEOID == "340021077210"] <- "340021063850"

##############export######
#county
st_write(dvrpcCounty10, "G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\county\\county2010.shp")
dvrpcCounty2010 <- dvrpcCounty10 %>% select(-c(geometry))
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\county\\'
fileName = paste(path_out, 'county2010.csv',sep = '')
write_csv(dvrpcCounty2010,fileName)

st_write(dvrpcCounty00, "G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\county\\county2000.shp")
dvrpcCounty2000 <- dvrpcCounty00 %>% select(-c(geometry))
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\county\\'
fileName = paste(path_out, 'county2000.csv',sep = '')
write_csv(dvrpcCounty2000,fileName)

#blocks
st_write(dvrpcBlock10, "G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\block\\block2010.shp")
dvrpcBlock2010 <- dvrpcBlock10 %>% select(-c(geometry))
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\block\\'
fileName = paste(path_out, 'block2010.csv',sep = '')
write_csv(dvrpcBlock2010,fileName)

st_write(dvrpcBlock00, "G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\block\\block2000.shp")
dvrpcBlock2000 <- dvrpcBlock00 %>% select(-c(geometry))
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\block\\'
fileName = paste(path_out, 'block2000.csv',sep = '')
write_csv(dvrpcBlock2000,fileName)

#BlockGroups
st_write(dvrpcBlockGroup10, "G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\BlockGroup\\BlockGroup2010.shp")
dvrpcBlockGroup2010 <- dvrpcBlockGroup10 %>% select(-c(geometry))
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\BlockGroup\\'
fileName = paste(path_out, 'blockGroup2010.csv',sep = '')
write_csv(dvrpcBlockGroup2010,fileName)

st_write(dvrpcBlockGroup00, "G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\BlockGroup\\BlockGroup2000.shp")
dvrpcBlockGroup2000 <- dvrpcBlockGroup00 %>% select(-c(geometry))
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\BlockGroup\\'
fileName = paste(path_out, 'blockGroup2000.csv',sep = '')
write_csv(dvrpcBlockGroup2000,fileName)
          
#tract
st_write(dvrpctract10, "G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\tract\\tract2010.shp")
dvrpcTract2010 <- dvrpctract10 %>% select(-c(geometry))
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\tract\\'
fileName = paste(path_out, 'tract2010.csv',sep = '')
write_csv(dvrpcTract2010,fileName)

st_write(dvrpctract00, "G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\tract\\tract2000.shp")
dvrpcTract2000 <- dvrpctract00 %>% select(-c(geometry))
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\tract\\'
fileName = paste(path_out, 'tract2000.csv',sep = '')
write_csv(dvrpcTract2000,fileName)

#planning district
st_write(dvrpcPD10, "G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\mcd_phi_cpa\\mcd_Phi_CPA2010.shp")
PD2010 <- dvrpcPD10 %>% select(-c(geometry))
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\mcd_phi_cpa\\'
fileName = paste(path_out, 'mcd_Phi_CPA2010.csv',sep = '')
write_csv(PD2010,fileName)

st_write(dvrpcPD00, "G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\mcd_phi_cpa\\mcd_Phi_CPA2000.shp")
dvrpcPD00 <- st_set_geometry(dvrpcPD00, NULL)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\mcd_phi_cpa\\'
fileName = paste(path_out, 'mcd_Phi_CPA2000.csv',sep = '')
write_csv(dvrpcPD00,fileName)

#county subs
st_write(dvrpccountySubdivision10, "G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\mcd\\mcd2010.shp")
dvrpccountySubdivision10 <- dvrpccountySubdivision10 %>% select(-c(geometry))
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\mcd\\'
fileName = paste(path_out, 'MCD2010.csv',sep = '')
write_csv(dvrpccountySubdivision10,fileName)

st_write(dvrpccountySubdivision00, "G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\mcd\\mcd2000.shp")
dvrpccountySubdivision00 <- st_set_geometry(dvrpccountySubdivision00, NULL)
path_out = 'G:\\Shared drives\\Data Coordination\\2020 Census\\2020 Redistricting Data\\historicData\\mcd\\'
fileName = paste(path_out, 'MCD2000.csv',sep = '')
write_csv(dvrpccountySubdivision00,fileName)
