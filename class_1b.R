getwd()
dir.create( "C:/Users/sara2/Documents/R/sara/AI_Omics_Internship_2025/Module_1/raw_data")
dir.create( "C:/Users/sara2/Documents/R/sara/AI_Omics_Internship_2025/Module_1/clean_data")
dir.create( "C:/Users/sara2/Documents/R/sara/AI_Omics_Internship_2025/Module_1/scripts")
dir.create( "C:/Users/sara2/Documents/R/sara/AI_Omics_Internship_2025/Module_1/results")
dir.create( "C:/Users/sara2/Documents/R/sara/AI_Omics_Internship_2025/Module_1/plots")
library(readr)
patient_info <- read_csv("C:/Users/sara2/Downloads/patient_info.csv")
View(patient_info)
str(patient_info)

patient_info$age_int <- as.integer(patient_info$age)
class(age_int)

patient_info$smoker_fac <- as.factor(patient_info$smoker)
class(smoker_fac)

patient_info$smoker_num <- factor(patient_info$smoker_fac, 
                          levels = c("Yes", "No"))
                    
levels(smoker_num)

patient_info$smoker_num <- ifelse(patient_info$smoker_fac == "Yes",1,0)
class(smoker_num)
View(patient_info)

write.csv(patient_info, file = "clean_data/patient_info_clean.csv")
