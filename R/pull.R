pull <- function(files, who = NULL) {
  if (length(files) == 0 || !is.character(files))
    stop("'files' must be a string vector")
  ## print("Made it to 4")
  sftpSite <- dtf$value[dtf$key == "sftpSite"]
  sftpName <- dtf$value[dtf$key == "sftpName"]
  sftpPassword <- dtf$value[dtf$key == "sftpPassword"]
  userName <- dtf$value[dtf$key == "userName"]
  
  # Fixup files (subdirectories must be through "who")
  files <- basename(files)
  if (!is.null(who)) {
    files <- paste0(who, "/", files)
  }
  
  # Helper function to add "-user" to file names
  addUser <- function(f, user) {
    if (is.null(user)) user <- "."
    user <- trimws(user)
    if (user %in% c("", ".")) user="instructor"
    f <- strsplit(f, "[.]")[[1]]
    len <- length(f)
    if (len == 1) return(paste0(f, "-", user))
    if (len > 2) {
      f <- c(paste(f[1:(len-1)], collapse="."), f[len])
    }
    return(paste0(f[1], "-", user, ".", f[2]))
  }
  
  # Download files
  front <- paste0("sftp://", sftpName, ":", sftpPassword, "@", sftpSite)
  opts <- list(ftp.create.missing.dirs=TRUE)
  for (f in files) {
    url <- paste0("sftp://", sftpSite, "/", f)
    userpwd <- paste0(sftpName, ":", sftpPassword)
    rtn <- try(getURL(url, userpwd=userpwd), silent=TRUE)
    if (is(rtn, "try-error")) {
      cat("Download of", f, "failed.\n")
      cat("Message:", as.character(attr(rtn, "condition")))
    } else {
      fLocal <- addUser(basename(f), who)
      rtn <- try(write(rtn, fLocal), silent=TRUE)
      if (is(rtn, "try-error")) {
        cat("Download of", fLocal, "succeeded, but save to", getwd(), "failed.\n")
        cat("Message:", as.character(attr(rtn, "condition")))
      }
    }
  }
  
  invisible(NULL)
}
#' @title Pull
#' 
#' @name pull
#' 
#' @author Howard J. Seltman and Francis R. Kovacs
#' 
#' @description This is a teaching tool to encourage interaction in programming classes. 
#'     It is based on the existance of an FTP server where files are shared and exchanged.
#' 
#' @usage: 
#' Students are attempting to code something, and you want everyone to
#'    "catch up" to your version.  Run push("myfile.R").  Each student can
#'    then run pull("myFile.R"), and open your version on their computer.
#' 
#' @details:
#' Students use push(files) to upload file(s) from their computer to
#'   the sftp site in their folder (as specified by their setup user name).
#'   Typically one or more files in the current folder are specified, but
#'   relative and absolute locations are allowed.
#'   Students use pull(files) to download files to their current folder
#'   from the root folder of the ftp site.
# '  Teachers use push(files) to upload file(s) from their computer to the
#'   sftp site's root folder (by specifying user name ".").
#'   Teachers use pull(files, who="studentUserId") to download one or more
#'   student files to their current folder.
#' 
#' @references 
#' https://stackoverflow.com/questions/15950396/sftp-get-files-with-r
#' https://jonkimanalyze.wordpress.com/2014/11/20/r-quick-sftp-file-transfer/
#' @export
"pull"

