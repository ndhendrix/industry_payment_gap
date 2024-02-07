library(data.table)
library(tidyverse)
library(stringr)
library(lubridate)

args <- commandArgs(trailingOnly = TRUE)
OPENPAYMENTS_DATA_PATH = args[1]
NPPES_DATA_PATH = args[2]
CARECOMPARE_DATA_PATH = args[3]
OUTPUT_FILE = args[4]

##### Read OpenPayment data
filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_GNRL_PGYR2013_P01222021.csv")
pay13 = fread(filename, select = 
                   c("Record_ID", "Physician_Profile_ID", "Recipient_Zip_Code", "Nature_of_Payment_or_Transfer_of_Value", 
                     "Total_Amount_of_Payment_USDollars", "Recipient_Country", "Program_Year", "Physician_First_Name",
                     "Physician_Middle_Name", "Physician_Last_Name", "Physician_Specialty")) %>%
  filter(Recipient_Country == "United States") %>%
  rename(Covered_Recipient_Profile_ID = Physician_Profile_ID,
         Covered_Recipient_First_Name = Physician_First_Name,
         Covered_Recipient_Middle_Name = Physician_Middle_Name,
         Covered_Recipient_Last_Name = Physician_Last_Name,
         Covered_Recipient_Specialty_1 = Physician_Specialty)
  #write.csv("Downloads/OpenPayments/general_2013.csv", row.names=FALSE)

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_GNRL_PGYR2014_P01212022.csv")
pay14 = fread(filename, select = 
        c("Record_ID", "Physician_Profile_ID", "Recipient_Zip_Code", "Nature_of_Payment_or_Transfer_of_Value", 
          "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
          "Program_Year", "Physician_First_Name",
          "Physician_Middle_Name", "Physician_Last_Name", "Physician_Specialty")) %>%
  filter(Recipient_Country == "United States") %>%
  rename(Covered_Recipient_Profile_ID = Physician_Profile_ID,
         Covered_Recipient_First_Name = Physician_First_Name,
         Covered_Recipient_Middle_Name = Physician_Middle_Name,
         Covered_Recipient_Last_Name = Physician_Last_Name,
         Covered_Recipient_Specialty_1 = Physician_Specialty)

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_GNRL_PGYR2015_P01202023.csv")
pay15 = fread(filename, select = 
        c("Record_ID", "Physician_Profile_ID", "Recipient_Zip_Code", "Nature_of_Payment_or_Transfer_of_Value", 
          "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
          "Program_Year", "Physician_First_Name",
          "Physician_Middle_Name", "Physician_Last_Name", "Physician_Specialty")) %>%
  filter(Recipient_Country == "United States") %>%
  rename(Covered_Recipient_Profile_ID = Physician_Profile_ID,
         Covered_Recipient_First_Name = Physician_First_Name,
         Covered_Recipient_Middle_Name = Physician_Middle_Name,
         Covered_Recipient_Last_Name = Physician_Last_Name,
         Covered_Recipient_Specialty_1 = Physician_Specialty)

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_GNRL_PGYR2016_P06302023.csv")
pay16 = fread(filename, select = 
        c("Record_ID", "Covered_Recipient_Profile_ID", "Recipient_Zip_Code", "Nature_of_Payment_or_Transfer_of_Value", 
          "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
          "Program_Year", "Covered_Recipient_First_Name", "Covered_Recipient_Middle_Name",
          "Covered_Recipient_Last_Name", "Covered_Recipient_Specialty_1")) %>%
  filter(grepl("Allopathic & Osteopathic Physicians", Covered_Recipient_Specialty_1) &
           Recipient_Country == "United States") 

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_GNRL_PGYR2017_P06302023.csv")
pay17 = fread(filename, select = 
        c("Record_ID", "Covered_Recipient_Profile_ID", "Recipient_Zip_Code", "Nature_of_Payment_or_Transfer_of_Value", 
          "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
          "Program_Year", "Covered_Recipient_First_Name", "Covered_Recipient_Middle_Name",
          "Covered_Recipient_Last_Name", "Covered_Recipient_Specialty_1")) %>%
  filter(Recipient_Country == "United States")

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_GNRL_PGYR2018_P06302023.csv")
pay18 = fread(filename, select = 
        c("Record_ID", "Covered_Recipient_Profile_ID", "Recipient_Zip_Code", "Nature_of_Payment_or_Transfer_of_Value", 
          "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
          "Program_Year", "Covered_Recipient_First_Name", "Covered_Recipient_Middle_Name",
          "Covered_Recipient_Last_Name", "Covered_Recipient_Specialty_1")) %>%
  filter(Recipient_Country == "United States")

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_GNRL_PGYR2019_P06302023.csv")
pay19 = fread(filename, select = 
        c("Record_ID", "Covered_Recipient_Profile_ID", "Recipient_Zip_Code", "Nature_of_Payment_or_Transfer_of_Value", 
          "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
          "Program_Year", "Covered_Recipient_First_Name", "Covered_Recipient_Middle_Name",
          "Covered_Recipient_Last_Name", "Covered_Recipient_Specialty_1")) %>%
  filter(Recipient_Country == "United States") 

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_GNRL_PGYR2020_P06302023.csv")
pay20 = fread(filename, select = 
        c("Record_ID", "Covered_Recipient_Profile_ID", "Recipient_Zip_Code", "Nature_of_Payment_or_Transfer_of_Value", 
          "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
          "Program_Year", "Covered_Recipient_First_Name", "Covered_Recipient_Middle_Name",
          "Covered_Recipient_Last_Name", "Covered_Recipient_Specialty_1")) %>%
  filter(Recipient_Country == "United States")

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_GNRL_PGYR2021_P06302023.csv")
pay21 = fread(filename, select = 
        c("Record_ID", "Covered_Recipient_Profile_ID", "Recipient_Zip_Code", "Nature_of_Payment_or_Transfer_of_Value", 
          "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
          "Program_Year", "Covered_Recipient_First_Name", "Covered_Recipient_Middle_Name",
          "Covered_Recipient_Last_Name", "Covered_Recipient_Specialty_1")) %>%
  filter(Recipient_Country == "United States") 

filename = paste0(OPENPAYMENTS_DATA_PATH,"/OP_DTL_GNRL_PGYR2022_P06302023.csv")
pay22 = fread(filename, select = 
        c("Record_ID", "Covered_Recipient_Profile_ID", "Recipient_Zip_Code", "Nature_of_Payment_or_Transfer_of_Value", 
          "Total_Amount_of_Payment_USDollars", "Recipient_Country", 
          "Program_Year", "Covered_Recipient_First_Name", "Covered_Recipient_Middle_Name",
          "Covered_Recipient_Last_Name", "Covered_Recipient_Specialty_1")) %>%
  filter(Recipient_Country == "United States")

# Combine them into one data.table
pay <- rbindlist(list(pay13, pay14, pay15, pay16, pay17, pay18, pay19, pay20, pay21, pay22)) 
pay = pay[Covered_Recipient_Specialty_1 != "(other)" & str_detect(Covered_Recipient_Specialty_1, "Allopathic & Osteopathic Physicians"),]
pay[, Covered_Recipient_Specialty_1 := sub(".*\\|", "", Covered_Recipient_Specialty_1)]
pay[, Recipient_Zip_Code := substr(Recipient_Zip_Code, 1, 5)]

##### Read deletion data

del17 = fread(paste0(OPENPAYMENTS_DATA_PATH,"/OP_REMOVED_DELETED_PGYR2017_P06302023.csv"))
del18 = fread(paste0(OPENPAYMENTS_DATA_PATH,"/OP_REMOVED_DELETED_PGYR2018_P06302023.csv"))
del19 = fread(paste0(OPENPAYMENTS_DATA_PATH,"/OP_REMOVED_DELETED_PGYR2019_P06302023.csv"))
del20 = fread(paste0(OPENPAYMENTS_DATA_PATH,"/OP_REMOVED_DELETED_PGYR2020_P06302023.csv"))
del21 = fread(paste0(OPENPAYMENTS_DATA_PATH,"/OP_REMOVED_DELETED_PGYR2021_P06302023.csv"))
del <- rbindlist(list(del17, del18, del19, del20, del21))

# Remove deleted records
pay = pay[!Record_ID %in% del$Record_ID]
pay = pay %>%
  filter(Nature_of_Payment_or_Transfer_of_Value != "Space rental or facility fees (teaching hospital only)") %>%
  select("Covered_Recipient_Profile_ID", "Recipient_Zip_Code", "Nature_of_Payment_or_Transfer_of_Value",
         "Total_Amount_of_Payment_USDollars", "Program_Year") %>%
  mutate(Nature_of_Payment_or_Transfer_of_Value = case_when(Nature_of_Payment_or_Transfer_of_Value %in%
                                                              c("Acquisitions", 
                                                                "Royalty or License",
                                                                "Current or prospective ownership or investment interest") ~
                                                              "Intellectual Property",
                                                            Nature_of_Payment_or_Transfer_of_Value %in%
                                                              c("Compensation for services other than consulting, including serving as faculty or as a speaker at a venue other than a continuing education program",
                                                                "Compensation for serving as faculty or as a speaker for a medical education program",
                                                                "Compensation for serving as faculty or as a speaker for a non-accredited and noncertified continuing education program",
                                                                "Compensation for serving as faculty or as a speaker for an accredited or certified continuing education program",
                                                                "Consulting Fee",
                                                                "Honoraria") ~ "Compensation and Honoraria",
                                                            Nature_of_Payment_or_Transfer_of_Value %in%
                                                              c("Entertainment","Food and Beverage","Gift","Travel and Lodging") ~ "Travel, Food, and Gifts",
                                                            Nature_of_Payment_or_Transfer_of_Value == "Charitable Contribution" ~ "Charitable Contribution",
                                                            TRUE ~ "Misc."))

##### Read NPPES data and covered recipient data
nppes = fread(paste0(NPPES_DATA_PATH,"/npidata_pfile_20050523-20231008.csv"),
              select = c("NPI", "Entity Type Code", "Provider Gender Code", 
                         "Provider Credential Text", "Provider Enumeration Date",
                         "Healthcare Provider Taxonomy Code_1",
                         "Provider Business Mailing Address Postal Code")) %>%
  filter(
    (str_detect(`Provider Credential Text`, regex("\\bM\\.?\\s?D\\.", ignore_case = TRUE)) |
    str_detect(`Provider Credential Text`, regex("\\bD\\.?\\s?O\\.", ignore_case = TRUE))) &
    !is.na(`Provider Gender Code`) & `Entity Type Code` == 1 & !grepl("D.M.D.",`Provider Credential Text`)
  ) %>%
  mutate(npi_year = case_when(year(mdy(`Provider Enumeration Date`)) < 2013 ~ 2013,
                              TRUE ~ year(mdy(`Provider Enumeration Date`))),
         ZIP = substr(`Provider Business Mailing Address Postal Code`,1,5))

taxonomy = fread(paste0(NPPES_DATA_PATH,"/NUCC Taxonomy.csv"), select = c("Code", "Classification"))

setkey(nppes, `Healthcare Provider Taxonomy Code_1`)
setkey(taxonomy, Code)
nppes = nppes[taxonomy, nomatch=0] %>%
  select(NPI, `Provider Gender Code`, npi_year, Classification, ZIP)

recipients = fread(paste0(OPENPAYMENTS_DATA_PATH,'/OP_CVRD_RCPNT_PRFL_SPLMTL_P06302023.csv'),
                   select = c('Covered_Recipient_Profile_ID', 'Covered_Recipient_NPI')) 
setkey(recipients, Covered_Recipient_Profile_ID)
setkey(pay, Covered_Recipient_Profile_ID)
pay = pay[recipients, nomatch=0]

payment_types = unique(pay$Nature_of_Payment_or_Transfer_of_Value)
nppes_years_payment_types = data.table(NPI = rep(unique(nppes$NPI), each=50),
                                       year = rep(seq(2013,2022,by=1),each=5),
                                       type = payment_types)
setkey(nppes, NPI)
setkey(nppes_years_payment_types, NPI)
nppes_payments = nppes_years_payment_types[nppes, nomatch=0] %>%
  filter(year >= npi_year)

full_pay <- left_join(nppes_payments, pay, 
                      by = c("NPI"="Covered_Recipient_NPI", 
                               "year"="Program_Year", 
                               "type"="Nature_of_Payment_or_Transfer_of_Value"))

full_pay <- full_pay %>%
  mutate(Total_Amount_of_Payment_USDollars = ifelse(is.na(Total_Amount_of_Payment_USDollars), 
                                                    0, Total_Amount_of_Payment_USDollars))
full_pay <- left_join(full_pay, nppes[, c("NPI", "ZIP")], by = "NPI") %>%
  mutate(ZIP = ifelse(is.na(ZIP.x), ZIP.y, ZIP.x)) %>%
  select(-Recipient_Zip_Code, -Covered_Recipient_Profile_ID, -ZIP.x, -ZIP.y)

##### Read RUCA data

ruca = fread(paste0(NPPES_DATA_PATH,"/ruca.csv"), select = c(1,4,5,6))
ruca$ZIPA = str_pad(as.character(ruca$ZIPA),5,pad='0')
setkey(ruca, ZIPA)
setkey(full_pay, ZIP)
full_pay <- full_pay[ruca, nomatch = 0]

##### Add school and grad year info

cc22 = fread(paste0(CARECOMPARE_DATA_PATH,"/DAC_NationalDownloadableFile.csv"),
             select=c("NPI", "Med_sch", "Grd_yr")) %>%
            mutate(year = 2022)
cc19 = fread(paste0(CARECOMPARE_DATA_PATH, "/Physician_Compare_National_Downloadable_File_201907.csv"),
             select=c("NPI", "Med_sch", "Grd_yr")) %>%
            mutate(year = 2019)
cc17 = fread(paste0(CARECOMPARE_DATA_PATH,"/Refresh_Data_Archive_04_2017.csv"),
             select=c("NPI", "Credential", "Medical school name")) %>%
  rename(Med_sch = Credential,
         Grd_yr = `Medical school name`) %>%
  mutate(year = 2017)
cc = rbindlist(list(cc22,cc17,cc19)) %>%
    group_by(NPI) %>%
    mutate(
      Med_sch = ifelse(toupper(Med_sch) == "OTHER" & any(toupper(Med_sch) != "OTHER"), 
                       Med_sch[toupper(Med_sch) != "OTHER"][1], 
                       Med_sch)
    ) %>%
    ungroup() %>%
    group_by(NPI) %>%
    arrange(year) %>%  # Sort by Year within each group
    mutate(Med_sch = first(Med_sch)) %>%  # Take the first (earliest) School value
    ungroup() %>%
    distinct(NPI, Med_sch, Grd_yr) %>%
    as.data.table()
  
# Count pre-matching with CareCompare data
#length(unique(as.character(full_pay$NPI)))

setkey(full_pay, NPI)
setkey(cc, NPI)
pay_cci = full_pay[cc, nomatch = 0]

# Count post-matching with CareCompare data
#length(unique(as.character(pay_cci$NPI)))

##### Wrangle pay data

out = pay_cci %>%
  select(NPI, year, type, Total_Amount_of_Payment_USDollars,
         Classification, `Provider Gender Code`, env_type, region,
         subregion, Med_sch, Grd_yr) %>%
  group_by(NPI, year, type, env_type, subregion) %>%
  mutate(total_payments = sum(Total_Amount_of_Payment_USDollars)) %>%
  distinct(NPI, year, type,
           Classification, `Provider Gender Code`, env_type, region,
           subregion, Med_sch, Grd_yr, total_payments) %>%
  mutate(yrs_in_practice = year - Grd_yr)
write.csv(OUTPUT_FILE, row.names = FALSE)  
