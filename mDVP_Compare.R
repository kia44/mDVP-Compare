library(readxl)
library(sqldf)
library(daff)

study_mDVP <- Oncology_Infusion_mDVPv7_JGDM_mDVP_Comparison <- read_excel("~/mDVP/Oncology Infusion mDVPv7__JGDM mDVP Comparison.xlsx", 
                                                                 sheet = "JGDM mDVP CRF Data", col_types = c("skip", "text", "text", "text", "text", "text", 
                                                                                                                       "text", "text", "text", "text", "skip", 
                                                                                                                       "skip", "skip", "skip", "skip", 
                                                                                                                       "skip", "skip", "skip"), na = "default", 
                                                                 skip = 1)



template_mDVP <- read_excel("~/mDVP/LillyTemplate_Onc_Infusion_mDVP.xlsx", 
                                              sheet = "CRF Data", col_types = c("skip", 
                                                                                "text", "text", "text", "text", "text", 
                                                                                "text", "text", "text", "text", "skip", 
                                                                                "skip", "skip"), na = "default", skip = 2)


mDVP_diff <- diff_data(study_mDVP, template_mDVP, ignore_whitespace = TRUE)


render_diff(mDVP_diff, title="Study mDVP vs LillyTemplate_Onc_Infusion_mDVP Comparison", pretty = TRUE) #This is the best one it seems


