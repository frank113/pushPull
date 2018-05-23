ask <- function(prompt, default = NULL) {
  if (!is.null(default) && length(default) > 0) {
    prompt <- paste0(prompt, " (or Enter for '", default, "')")
  }
  rtn <- readline(paste0(prompt, "? "))
  if (toupper(rtn) %in% c("Q", "QUIT"))
    stop("user quit setup()")
  if (!is.null(default) && rtn == "") {
    rtn <- default
  }
  return(rtn)
}
#' @title Ask
#' 
#' @name ask
#' 
#' @author Howard J. Seltman
#' 
#' @description A function that prompts for a given variable name. In the context 
#'     of this package it is used to prompt for settings. 
#' 
#' @usage: 
#' After called for each variable, the resulting dataframe will be saved to sysdata.rda
#' 
"ask"

