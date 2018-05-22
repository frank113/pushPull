push <- function(files) {
  if (length(files) == 0 || !is.character(files))
    stop("'files' must be a string vector")

#   sftpSite = dtf$value[dtf$key=="sftpSite"]
#   sftpName = dtf$value[dtf$key=="sftpName"]
#   sftpPassword = dtf$value[dtf$key=="sftpPassword"]
#   userName = dtf$value[dtf$key=="userName"]

  # Check files
  fid = file.info(files)$isdir
  notFound = is.na(fid)
  if (any(notFound)) {
    stop("missing file(s): '", paste(files[notFound], collapse=", "))
  }
  if (any(fid)) {
    stop("folder not file: ", paste(files[fid], collapse=", "))
  }
  
  # Upload files
  ## Frank removed this
  # if (!require(RCurl, quietly=TRUE, warn.conflicts=FALSE))
  #   stop("install 'RCurl' and try again")
  front = paste0("sftp://", sftpName, ":", sftpPassword, "@", sftpSite)
  opts = list(ftp.create.missing.dirs=TRUE)
  for (f in files) {
    fRemote = file.path(userName, basename(f))
    rtn = try(RCurl::ftpUpload(f, file.path(front, fRemote), .opts=opts), silent=TRUE)
    if (is(rtn, "try-error")) {
      cat("Upload of", f, "failed.\n")
      cat("Message:", as.character(attr(rtn, "condition")))
    }
  }

  invisible(NULL)
}
#' @title Push
#' 
#' @name push
#' 
#' @author Howard J. Seltman and Francis R. Kovacs
#' 
#' @description This is a teaching tool to encourage interaction in programming classes. 
#'     It is based on the existance of an FTP server where files are shared and exchanged.
#' 
#' @usage: 
#' 1. Students are working in class and a student wants to know why their code
#'    failed or you want to show a working (or not working) example from a
#'    particular student.  The student pushes the file with push("myFile.R")
#'    and you pull it with pull("myFile.R", who="studentId").  Now you can
#'    open the file in your current R session.
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
"push"

