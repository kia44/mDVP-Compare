library(readxl)
library(daff)
library(xlsx)

JPCF_mDVP <- read_excel("~/mDVP/JPCF_mDVP_3.xlsx", 
                            sheet = "CRF Data", col_types = c("skip", "text", "text", "text", "text", "text", 
                                                              "text", "text", "text", "text", "skip", 
                                                              "skip", "text"), na = "default", 
                                                               skip = 0)



template_mDVP2 <- read_excel("~/mDVP/LillyTemplate_Onc_Infusion_mDVP.xlsx", 
                            sheet = "CRF Data", col_types = c("skip", 
                                                              "text", "text", "text", "text", "text", 
                                                              "text", "text", "text", "text", "skip", 
                                                              "skip", "text"), na = "default", skip = 2)


JPCF_mDVP_diff <- diff_data(JPCF_mDVP, template_mDVP2, ignore_whitespace = TRUE, never_show_order = TRUE, show_unchanged = FALSE)


render_diff(JPCF_mDVP_diff, title="JPCF mDVP vs LillyTemplate_Onc_Infusion_mDVP Comparison", pretty = TRUE) #This is the best one it seems



# wb     <- loadWorkbook("~/mDVP/JPCF_mDVP_3.xlsx")
# sheet1 <- getSheets(wb)[[3]]
# rows  <- getRows(sheet1)
# cells <- getCells(rows)
# styles <- sapply(cells, getCellStyle)
