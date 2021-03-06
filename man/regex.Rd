% Generated by roxygen2 (4.0.0): do not edit by hand
\name{ngrep}
\alias{extract.re}
\alias{extract_rows.re}
\alias{fgrep}
\alias{ngrep}
\alias{re.exists}
\alias{re_exists}
\alias{re_extract}
\alias{re_extract_rows}
\alias{re_without}
\alias{re_without_rows}
\alias{without.re}
\alias{without_rows.re}
\title{Pattern matching and Replacement}
\usage{
ngrep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE,
  fixed = FALSE, useBytes = FALSE)

fgrep(pattern, x, ignore.case = FALSE, value = FALSE, useBytes = FALSE,
  invert = FALSE)

re_exists(x, pattern, perl = TRUE, fixed = FALSE, ...)

re.exists(pattern, x, perl = TRUE, fixed = FALSE, ...)

re_extract(x, pattern, perl = TRUE, fixed = FALSE, ...)

extract.re(x, pattern, perl = TRUE, fixed = FALSE, ...)

re_without(x, pattern, perl = TRUE, fixed = FALSE, ...)

without.re(x, pattern, perl = TRUE, fixed = FALSE, ...)

re_extract_rows(x, pattern, match_var = rownames(x), perl = TRUE,
  fixed = FALSE, drop = FALSE, ...)

extract_rows.re(x, pattern, match_var = rownames(x), perl = TRUE,
  fixed = FALSE, ...)

re_without_rows(x, pattern, match_var = rownames(x), perl = TRUE,
  fixed = FALSE, drop = FALSE, ...)

without_rows.re(x, pattern, match_var = rownames(x), perl = TRUE,
  fixed = FALSE, ...)
}
\arguments{
  \item{x}{An \R object (in the case of \code{re_}
  methods), or a character vector (in the case of
  \code{ngrep}, \code{fgrep})}

  \item{pattern}{character string containing a character
  string to be matched in the given character vector;
  coerced by \code{\link{as.character}} if possible.}

  \item{ignore.case}{boolean; if \code{TRUE} we perform
  case-insensitive matching.}

  \item{perl}{boolean; if \code{TRUE}, we use
  perl-compatible regular expressions.}

  \item{value}{boolean; if \code{TRUE} we return the actual
  matches; if \code{FALSE} we return the indices
  corresponding to the matches.}

  \item{fixed}{boolean; if \code{TRUE} the pattern is
  matched as-is. Overrides all conflicting arguments.}

  \item{useBytes}{boolean; if \code{TRUE} we perform
  matching byte-by-byte rather than character by
  character.}

  \item{match_var}{A variable to match on, as used in the
  \code{re_extract_rows} function.}

  \item{invert}{Invert the results of the regular
  expression match?}

  \item{...}{Optional arguments passed to \code{grep} or
  \code{grepl}.}
}
\description{
These functions provide simple extensions to base regular expressions in \R,
primarily intended to assist with extraction of elements based on the
result of a regular expression evaluation.
}
\details{
The order is \emph{reversed} for the \code{re_} set of functions;
i.e., an \R object is expected first, rather than a regular expression pattern.
}
\examples{
ngrep( "abc", c("abc", "babcd", "abcdef", "apple"), value=TRUE )
if( re_exists(c("apple", "banana"), "^ap") ) print("yay!")
dat <- data.frame( x=letters, y=LETTERS )
rownames(dat) <- 1:26
## get all rows in dat with a 1, 2, 3 or 4 in the name
re_extract_rows( dat, "[1-4]" )
dat <- data.frame( x=letters, y=LETTERS )
rownames(dat) <- 1:26
## get all rows in dat with a 1, 2, 3 or 4 in the name
re_without_rows( dat, "[0-4]" )
}
\seealso{
\code{\link{grep}}

\code{\link{grep}}, \code{\link{regex}}
}

