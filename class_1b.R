getwd()
#to create new file
dir.create( "C:/Users/sara2/Documents/R/sara/AI_Omics_Internship_2025/Module_1/raw_data")
dir.create( "C:/Users/sara2/Documents/R/sara/AI_Omics_Internship_2025/Module_1/clean_data")
dir.create( "C:/Users/sara2/Documents/R/sara/AI_Omics_Internship_2025/Module_1/scripts")
dir.create( "C:/Users/sara2/Documents/R/sara/AI_Omics_Internship_2025/Module_1/results")
dir.create( "C:/Users/sara2/Documents/R/sara/AI_Omics_Internship_2025/Module_1/plots")
library(readr)
#to read csv file
patient_info <- read_csv("C:/Users/sara2/Downloads/patient_info.csv")
View(patient_info)
str(patient_info)

#to convert the type of data to integer to decrease the space
patient_info$age_int <- as.integer(patient_info$age)
class(age_int)

#to convert the type of data into factor and determine the level
patient_info$smoker_fac <- as.factor(patient_info$smoker)
class(smoker_fac)
patient_info$smoker_num <- factor(patient_info$smoker_fac, 
                          levels = c("Yes", "No"))
                    
levels(smoker_num)

# to convert the categorized data into numeric data
patient_info$smoker_num <- ifelse(patient_info$smoker_fac == "Yes",1,0)
class(smoker_num)
View(patient_info)

#to save the file into clean data
write.csv(patient_info, file = "clean_data/patient_info_clean.csv")
save.image("Sarahassan_Class_Ib_Assignment.RData")
load("Sarahassan_Class_Ib_Assignment.RData")

#check cholestrol level by if
cholesterol = 240
if (cholesterol > 230){
print("High Cholesterol")
}

#check Blood pressure by if else
Blood_pressure = 120
if (Blood_pressure < 120){
   print("Blood Pressure is normal")
}else{
      print("Blood Pressure is high")
      
}

Systolic_bp = 130 
if (Systolic_bp < 120){
  print("Blood Pressure is normal")
}else{
  print("Blood Pressure is high")
  
}
 
#to read file and make copy of it
metadata.csv = read.csv(file.choose("C:/Users/sara2/Downloads/metadata.csv"))
metadata2.csv = metadata.csv
Patient_info2.csv = patient_info

#use for loop to convert column to factor
fac_cols = c("gender","height")
for (col in fac_cols) {
metadata2.csv[[col]] <- as.factor(metadata2.csv[[col]])

}
str(metadata2.csv)
sort(metadata2.csv$age, decreasing = TRUE)
sort(metadata2.csv$age, decreasing = FALSE)
fac_cols_2 = c("gender","diagnosis","smoker")
for (col in fac_cols_2) {
  Patient_info2.csv[[col]] <- as.factor(Patient_info2.csv[[col]])
}

str(Patient_info2.csv)

#to remove column from the table
Patient_info2.csv = Patient_info2.csv[ ,-8:-9]
str(Patient_info2.csv)

#to convert column into numeric by for loop and ifelse
binary_col=c("smoker")
for (col in binary_col) {
     
  Patient_info2.csv[[col]] <- ifelse(Patient_info2.csv[[col]] == "Yes",1,0) 
}
 
 help("reserved") 
?median
 