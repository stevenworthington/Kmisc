##' Unmelt a Melted Data Frame
##' 
##' This function undoes the \code{melt}ing process done by either
##' \code{reshape2::melt} or \code{\link{melt_}}.
##' 
##' @param data A \code{data.frame}.
##' @param id The index, or name, of the \code{id} vector; analogous to
##'   the vector produced with name \code{variable.name}.
##' @param value The value of the \code{value} vector; analogous to
##'   the vector produced with name \code{value.name}.
##' @export
unmelt <- function(data, id="variable", value="value") {
  if (!is.data.frame(data)) {
    stop("'data' must be a data.frame")
  }
  
  if (length(id) != 1) {
    stop("'id' must have length one")
  }
  
  if (length(value) != 1 ) {
    stop("'value' must have length 1")
  }
  
  if (is.character(id)) {
    idm <- match(id, names(data))
    if (is.na(idm)) {
      stop("No variable with name '", id, "' in 'data'")
    }
    id <- idm
  }
  
  if (is.character(value)) {
    valuem <- match(value, names(data))
    if (is.na(value)) {
      stop("No variable with name '", value, "' in 'data'")
    }
    value <- valuem
  }
  
  if (id < 0 || id > length(data)) {
    stop("'id' variable indexes outside of range of 'data'")
  }
  
  if (value < 0 || value > length(data)) {
    stop("'value' variable indexes outside of range of 'data'")
  }
  
  other <- (1:ncol(data))[-c(id, value)]
  
  return( .Call("unmelt", data, unique(data[[id]]), as.integer(other)-1L, as.integer(id)-1L, as.integer(value)-1L, PACKAGE="Kmisc") )
  
}