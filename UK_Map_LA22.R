#Script that:
# 
# Created by: 
# 
#Requires the packages tidyr, ggplot2, readxl

rm(list = ls(all = TRUE))

x <- c("sf", "tidyverse", "classInt", "viridis" ,"ggmap", "rgdal", "rgeos", "maptools", "dplyr", "tidyr", "tmap", "ggplot2")
# install.packages(x) # warning: uncommenting this may take a number of minutes
lapply(x, library, character.only = TRUE) # load the required packages

library(sf) 
library(tidyverse)  
library(classInt) 
library(viridis)


#https://hub.arcgis.com/datasets/ons::local-authority-districts-december-2022-names-and-codes-in-the-united-kingdom/explore


sf_gb <- st_read("https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/Local_Authority_Districts_May_2022_UK_BFE_V3_2022/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson", quiet = TRUE)

glimpse(sf_gb)

st_geometry(sf_gb)

# A large Map - 
#plot(st_geometry(sf_gb))

# Greater Manchester 

sf_gm <- sf_gb  %>%
  filter(LAD22NM %in% 
           c("Bolton","Bury","Manchester","Oldham","Rochdale",
             "Salford","Stockport","Tameside","Trafford","Wigan"))  


plot(st_geometry(sf_gm))


