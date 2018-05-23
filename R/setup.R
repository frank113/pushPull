setup <- function(...) {
  sftpSite <- NULL
  sftpName <- NULL
  sftpPassword <- NULL
  userName <- NULL
  sftpSite <- ask("sftp site [not including sftp://]", sftpSite)
  sftpName <- ask("sftp login name", sftpName)
  sftpPassword <- ask("sftp password", sftpPassword)
  userName <- ask("Your user name", userName)
  
  ## store the information as variables
  ## use Howard's framework for saving as a dataframe
  key <- c("sftpSite", "sftpName", "sftpPassword", "userName")
  value <- c(sftpSite, sftpName, sftpPassword, userName)
  dtf <- data.frame(key = key, 
                    value = value)
  suppressMessages(devtools::use_data(dtf, 
                     internal = TRUE, 
                     overwrite = TRUE))
  invisible(NULL)
}
#' @title Configure the sftp server information
#' 
#' @name setup
#' 
#' @author Francis R. Kovacs
#' 
#' @description This function allows the user to reset the configuration for their ftp server. 
#' 
#' @usage: This function will be called during .onLoad and whenever the user prompts it.
#' 
#' @details: To do later.
#' 
#' @export
"setup"

