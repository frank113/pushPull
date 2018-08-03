.onLoad <- function(...) {
  ## need to get curl working
  os <- Sys.info()["sysname"]
  print("Made it to line 4")
  if (os != "Windows") {
    cat("If you do not have the correct cURL version, we will install it\n")
    bash.profile <- system("cat ~/.bash_profile", 
                           intern = TRUE)
    if ( !('export PATH=\"/usr/local/opt/curl/bin:$PATH\"' %in% bash.profile) ) {
      ## re-install libssh
      cat("Re-installing libssh2\n")
      system("brew install libssh2")
      cat("Now installing curl with libssh2 support\n")
      system("brew install curl --with-libssh2")
      cat("Must now update the PATH\n")
      ## todo: find a way to make sure that we dont keep putting it there
      system("echo 'export PATH=\"/usr/local/opt/curl/bin:$PATH\"' >> ~/.bash_profile")
    } else {
      cat("You are good to go!\n")
    }
  } else {
    cat("Add support for windows\n")
  }
  ## invisible(NULL)
  return()
}

