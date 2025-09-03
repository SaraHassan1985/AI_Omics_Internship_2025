input_dir <- "raw_data"
output_dir <- "results"
getwd()

# المسار القديم (Downloads)
old_path <- "C:/Users/sara2/Downloads"

# المسار الجديد داخل المشروع (تأكدي من المسار صح عندك)
new_path <- "C:/Users/sara2/Documents/R/sara/AI_Omics_Internship_2025/Module_1/raw_Data"

# لو الفولدر مش موجود، اعملي إنشاؤه
if (!dir.exists(new_path)) {
  dir.create(new_path, recursive = TRUE)
}

# جيبي كل ملفات CSV من Downloads
files <- list.files(path = old_path, pattern = "\\.csv$", full.names = TRUE)

# نسخ الملفات بدل النقل
file.copy(from = files,
          to = file.path(new_path, basename(files)),
          overwrite = TRUE)

# تأكيد النسخ
list.files(new_path, pattern = "\\.csv$")

is.na(new_path)
sum(is.na(data)) 

result_list=list()
files_to_process <- c("DEGs_Data_ 1.csv","DEGs_Data_2.csv") 
for (file_names in files_to_process) {
  cat("\nProcessing:", file_names, "\n")}
input_file_path <- file.path(c("~/R/sara/AI_Omics_Internship_2025/Module_1/raw_data/DEGs_Data_ 1.csv","~/R/sara/AI_Omics_Internship_2025/Module_1/raw_data/DEGs_Data_2.csv") )
cat("\nProcessing:", input_file_path, "\n")
input_file_path
data <- read.csv(input_dir, input_file_path , header = TRUE)
cat("File imported. Checking for missing values...\n")
 if("padj" %in% names(data)){
   missing_count <- sum(is.na(data$padj))
   
   cat("Missing values in 'padj':", missing_count, "\n")
   data$padj[is.na(data$padj)] <- mean(data$padj, na.rm = TRUE)
 }
 
 if("logFC" %in% names(data)){
   missing_count <- sum(is.na(data$logFC))
   
   cat("Missing values in 'logFC':", missing_count, "\n")
   data$logFC[is.na(data$logFC)] <- mean(data$logFC, na.rm = TRUE)
 } 
 
classify_gene <- function(logFC, padj) {
   if (logFC > 1 & padj < 0.05) {
     return("Upregulated")
   } else if (logFC < -1 & padj < 0.05) {
     return("Downregulated")
   } else {
     return("Otherwise")
   }
 }
 
 data$status <- mapply(classify_gene,data$logFC, data$padj, SIMPLIFY = TRUE)
 cat("gene is classified successfully.\n")
 
 result_list[[file_names]] <- data  
 
 
 output_file_path <- file.path("~/R/sara/AI_Omics_Internship_2025/Module_1", paste0("results/classified", file_names))
 write.csv(data, output_file_path, row.names = FALSE)
 cat("Results saved to:", output_file_path, "\n")
 
 results_1 <- result_list[[1]] 
 results_2 <- result_list[[2]] 
 