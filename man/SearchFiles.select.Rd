% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SearchFiles.R
\name{SearchFiles.select}
\alias{SearchFiles.select}
\title{Search Files Select}
\usage{
SearchFiles.select(
  files,
  includeAll = NA_character_,
  includeAny = NA_character_,
  remove = NA_character_,
  spaceReplaceAny = NA_character_,
  andReplaceAny = NA_character_
)
}
\arguments{
\item{files}{A character vector with filenames}

\item{includeAll}{A character vector containing regular expressions}

\item{includeAny}{A character vector containing regular expressions}

\item{remove}{A character vector containing regular expressions}

\item{spaceReplaceAny}{A character vector containing character strings to use instead of spaces}

\item{andReplaceAny}{A character vector containing character strings to use instead of the string "and"}
}
\value{
A character vector that is a subset of \code{files}.  Each element will match all elements of \code{includeAll} and at
  least one element of \code{includeAny}. No elements of the output will match any elements of \code{remove}.
}
\description{
Find filenames that match some regular expressions and not others
}
