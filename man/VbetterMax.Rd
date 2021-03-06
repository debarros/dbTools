% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/VbetterMax.R
\name{VbetterMax}
\alias{VbetterMax}
\title{Vector Better Max}
\usage{
VbetterMax(x, y)
}
\arguments{
\item{x}{A numeric vector}

\item{y}{A numeric vector of the same length as \code{x} or of length 1 (if y has length 1, it will be repeated to the length of x)}
}
\value{
A numeric vector where each position is the largest value stored in those positions of the input vectors.  If both input vectors have NA for a particular position, that position in the output will also contain NA.
}
\description{
Find the element by element max of two vectors
}
\examples{
ex1 = 6:10
ex2 = (1:5)*3
ex3 = c(1, 10, NA, 6, 2)
ex4 = c(NA, NA, NA, NA, 5)
VbetterMax(ex1, ex2)
VbetterMax(ex1, ex3)
VbetterMax(ex1, ex4)
VbetterMax(ex2, ex3)
VbetterMax(ex2, ex4)
VbetterMax(ex3, ex4)
VbetterMax(ex1, 7)
VbetterMax(ex3, 5)
VbetterMax(ex3, NA)
}
