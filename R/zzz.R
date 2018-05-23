# .onLoad <- function(...) {
#   ## function to prompt for the information needed from the user
#   ask <- function(prompt, default = NULL) {
#     if (!is.null(default) && length(default) > 0) {
#       prompt <- paste0(prompt, " (or Enter for '", default, "')")
#     }
#     rtn <- readline(paste0(prompt, "? "))
#     if (toupper(rtn) %in% c("Q", "QUIT"))
#       stop("user quit setup()")
#     if (!is.null(default) && rtn == "") {
#       rtn <- default
#     }
#     return(rtn)
#   }
#   
#   # Get new values for all parameters
#   ## we need dummy variables, so we will use the dorms of frank
#   sftpSite <- "scobell"
#   sftpName <- "hamerschlag"
#   sftpPassword <- "mudge_as_ra"
#   userName <- "mudge_as_ca"
#   cat("~~~Remember to run library(pushPull) if you need to change anything~~~\nWhat displays below cannot be changed, please ignore it\n")
#   ## hide ask if not installed
#   sftpSite <- ask("sftp site [not including sftp://]", sftpSite)
#   sftpName <- ask("sftp login name", sftpName)
#   sftpPassword <- ask("sftp password", sftpPassword)
#   userName <- ask("Your user name", userName)
#     
#   ## store the information as variables
#   ## use Howard's framework for saving as a dataframe
#   key <- c("sftpSite", "sftpName", "sftpPassword", "userName")
#   value <- c(sftpSite, sftpName, sftpPassword, userName)
#   dtf <- data.frame(key = key, 
#                     value = value)
#   ## print("We made it to 35")
#   if (file.exists("sysdata.rda")) {
#     file.remove("sysdata.rda")
#   }
#   suppressMessages(devtools::use_data(dtf, 
#                                       internal = TRUE, 
#                                       overwrite = TRUE))
#   ## print("We made it to 40")
#   ## invisible(NULL)
#   return()
# }
# 
