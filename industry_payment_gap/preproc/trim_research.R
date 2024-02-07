library(data.table)
library(tidyverse)
library(stringr)
library(lubridate)

# Process args from shell script
args <- commandArgs(trailingOnly = TRUE)
OPENPAYMENTS_DATA_PATH = args[1]
NPPES_DATA_PATH = args[2]
ORIGINAL_FILE = args[3]
OUTPUT_FILE = args[4]
  
##### Read OpenPayment data

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_RSRCH_PGYR2013_P01222021.csv")
pay13 = fread(filename, select = 
                   c("Physician_Profile_ID", "Covered_Recipient_Type", "Total_Amount_of_Payment_USDollars", 
                     "Recipient_Country", "Program_Year", "Physician_Specialty")) %>%
  filter(Recipient_Country == "United States",
         Covered_Recipient_Type == "Covered Recipient Physician",
         grepl("Allopathic & Osteopathic Physicians", Physician_Specialty)) %>%
  rename(Covered_Recipient_Profile_ID = Physician_Profile_ID,
         Covered_Recipient_Specialty_1 = Physician_Specialty)

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_RSRCH_PGYR2014_P01212022.csv")
pay14 = fread(filename, select = 
                c("Physician_Profile_ID", "Covered_Recipient_Type", "Total_Amount_of_Payment_USDollars", 
                  "Recipient_Country", "Program_Year", "Physician_Specialty")) %>%
  filter(Recipient_Country == "United States",
         Covered_Recipient_Type == "Covered Recipient Physician",
         grepl("Allopathic & Osteopathic Physicians", Physician_Specialty)) %>%
  rename(Covered_Recipient_Profile_ID = Physician_Profile_ID,
         Covered_Recipient_Specialty_1 = Physician_Specialty)

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_RSRCH_PGYR2015_P01202023.csv")
pay15 = fread(filename, select = 
                c("Physician_Profile_ID", "Covered_Recipient_Type", "Total_Amount_of_Payment_USDollars", 
                  "Recipient_Country", "Program_Year", "Physician_Specialty")) %>%
  filter(Recipient_Country == "United States",
         Covered_Recipient_Type == "Covered Recipient Physician",
         grepl("Allopathic & Osteopathic Physicians", Physician_Specialty)) %>%
  rename(Covered_Recipient_Profile_ID = Physician_Profile_ID,
         Covered_Recipient_Specialty_1 = Physician_Specialty)

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_RSRCH_PGYR2016_P06302023.csv")
pay16 = fread(filename, select = 
        c("Covered_Recipient_Profile_ID", "Covered_Recipient_Type", "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
          "Program_Year", "Covered_Recipient_Specialty_1")) %>%
  filter(grepl("Allopathic & Osteopathic Physicians", Covered_Recipient_Specialty_1),
         Covered_Recipient_Type == "Covered Recipient Physician",
         Recipient_Country == "United States") 

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_RSRCH_PGYR2017_P06302023.csv")
pay17 = fread(filename, select = 
                c("Covered_Recipient_Profile_ID","Covered_Recipient_Type",  "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
                  "Program_Year", "Covered_Recipient_Specialty_1")) %>%
  filter(grepl("Allopathic & Osteopathic Physicians", Covered_Recipient_Specialty_1),
         Covered_Recipient_Type == "Covered Recipient Physician",
         Recipient_Country == "United States")

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_RSRCH_PGYR2018_P06302023.csv")
pay18 = fread(filename, select = 
                c("Covered_Recipient_Profile_ID","Covered_Recipient_Type",  "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
                  "Program_Year", "Covered_Recipient_Specialty_1")) %>%
  filter(grepl("Allopathic & Osteopathic Physicians", Covered_Recipient_Specialty_1),
         Covered_Recipient_Type == "Covered Recipient Physician",
         Recipient_Country == "United States")

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_RSRCH_PGYR2019_P06302023.csv")
pay19 = fread(filename, select = 
                c("Covered_Recipient_Profile_ID","Covered_Recipient_Type",  "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
                  "Program_Year", "Covered_Recipient_Specialty_1")) %>%
  filter(grepl("Allopathic & Osteopathic Physicians", Covered_Recipient_Specialty_1),
         Covered_Recipient_Type == "Covered Recipient Physician",
         Recipient_Country == "United States") 

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_RSRCH_PGYR2020_P06302023.csv")
pay20 = fread(filename, select = 
                c("Covered_Recipient_Profile_ID","Covered_Recipient_Type",  "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
                  "Program_Year", "Covered_Recipient_Specialty_1")) %>%
  filter(grepl("Allopathic & Osteopathic Physicians", Covered_Recipient_Specialty_1),
         Covered_Recipient_Type == "Covered Recipient Physician",
         Recipient_Country == "United States")

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_RSRCH_PGYR2021_P06302023.csv")
pay21 = fread(filename, select = 
                c("Covered_Recipient_Profile_ID","Covered_Recipient_Type",  "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
                  "Program_Year", "Covered_Recipient_Specialty_1")) %>%
  filter(grepl("Allopathic & Osteopathic Physicians", Covered_Recipient_Specialty_1),
         Covered_Recipient_Type == "Covered Recipient Physician",
         Recipient_Country == "United States") 

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_RSRCH_PGYR2022_P06302023.csv")
pay22 = fread(filename, select = 
                c("Covered_Recipient_Profile_ID","Covered_Recipient_Type",  "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
                  "Program_Year", "Covered_Recipient_Specialty_1")) %>%
  filter(grepl("Allopathic & Osteopathic Physicians", Covered_Recipient_Specialty_1),
         Covered_Recipient_Type == "Covered Recipient Physician",
         Recipient_Country == "United States")

# Combine them into one data.table
pay <- rbindlist(list(pay13, pay14, pay15, pay16, pay17, pay18, pay19, pay20, pay21, pay22)) 
pay[, Covered_Recipient_Specialty_1 := sub(".*\\|", "", Covered_Recipient_Specialty_1)]

# Get NPI
filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_CVRD_RCPNT_PRFL_SPLMTL_P06302023.csv")
recipients = fread(filename,
                   select = c('Covered_Recipient_Profile_ID', 'Covered_Recipient_NPI')) 
setkey(recipients, Covered_Recipient_Profile_ID)
setkey(pay, Covered_Recipient_Profile_ID)
pay = pay[recipients, nomatch=0]

# Reformat to match format of general funding table
pay_reformat= pay %>%
  rename(NPI = Covered_Recipient_NPI,
         year = Program_Year) %>%
  group_by(NPI, year) %>%
  summarize(total_payments = sum(Total_Amount_of_Payment_USDollars)) %>%
  mutate(type = "Research") %>%
  as.data.table()

# Load general funding table
general = fread(ORIGINAL_FILE,
                select = c("NPI", "year", "Classification", "Provider Gender Code", "env_type", "region", "subregion",
                           "Med_sch", "Grd_yr", "yrs_in_practice")) %>%
  group_by(NPI, year) %>%
  distinct() %>%
  as.data.table()

# Add columns to research table
research = merge(general, pay_reformat, by = c("NPI", "year"), all.x = TRUE)
research[is.na(research$total_payments),"total_payments"] = 0
research$type = "Research"

# Join tables
general = fread(ORIGINAL_FILE,
                select = c("NPI", "year", "type", "Classification", "Provider Gender Code", "env_type", "region", "subregion",
                           "Med_sch", "Grd_yr", "yrs_in_practice", "total_payments")) 
out = rbind(general, research)
out = out[with(out, order(NPI, year, type)), ]

# Save merged dataset
write.csv(OUTPUT_FILE, row.names = FALSE)
