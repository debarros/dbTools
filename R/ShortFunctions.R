# ShortFunctions.R


#' @title Intersect Several
#' @description Find intersection of several sets
#' @param ... Any number of vectors of the same mode
#' @return A vector of the same mode as the inputs containing elements that appear in all of the input sets.  If there are none, it will return an empty vector.
#' @examples
#' ex1 = 6:10
#' ex2 = (1:5)*3
#' ex3 = c(1, 10, NA, 6, 2)
#' ex4 = c(NA, NA, NA, 6, 5)
#' intersectSeveral(ex1, ex2)
#' intersectSeveral(ex1, ex3)
#' intersectSeveral(ex1, ex4)
#' intersectSeveral(ex2, ex3)
#' intersectSeveral(ex2, ex4)
#' intersectSeveral(ex3, ex4)
#' intersectSeveral(ex1, 7)
#' intersectSeveral(ex3, 5)
#' intersectSeveral(ex3, NA)
intersectSeveral <- function(...) {
  Reduce(intersect, list(...))
} # /function



#' @title Set Length
#' @description Set the length of a vector
#' @param x a vector
#' @param y integer of length 0
#' @return The vector x truncated if y < length(x) or padded with NA if y > length(x)
#' @examples
#' ex1 = 6:10
#' ex2 = LETTERS[1:10]
#' ex3 = c(1, 10, NA, 6, 2)
#' ex4 = c(NA, NA, NA, 6, 5)
#' setlength(ex1, 7)
#' setlength(ex2, 5)
#' setlength(ex2, 15)
#' setlength(ex3, 4)
#' setlength(ex4, 50)
setlength <- function(x,y){
  length(x) <- y
  return(x)
} # /function




#' @title One Drop
#' @description Drops all elements of a character vector that have fewer than 2 characters
#' @param x a character vector
#' @param keep.na logical vector of length 1 indicating whether to keep NA elements
#' @return A vector containing the elements of \code{x} that are longer than 1 character
#' @examples
#' ex1 = LETTERS[1:10]
#' ex2 = paste0(c("A","B","C", "D"), c("","ABC","AB","A"))
#' ex3 = c(NA, NA, NA, "1 2 3", "6", "591", "A ")
#' one.drop(ex1)
#' one.drop(ex2)
#' one.drop(ex3)
#' one.drop(ex3, TRUE)
one.drop = function(x, keep.na = F){
  x = x[nchar(x) > 1]
  if(!keep.na){
    x = x[!is.na(x)]
  }
  return(x)
}




#' @title Sort by Length
#' @description Sort a character vector by the lengths of its elements
#' @param x a character vector
#' @param decreasing logical vector of length 1 indicating whether to keep NA elements.  Defaults to TRUE
#' @param na.last for controlling the treatment of NAs. If TRUE, missing values in the data are put last; if FALSE, they are put first; if NA, they are removed.
#' @return A vector containing the elements of \code{x} sorted by length
#' @examples
#' ex1 = c("Green", "Tech", "High", "Charter", "School")
#' ex2 = c(NA, NA, NA, "1 2 3", "6", "591", "A ")
#' SortLength(ex1)
#' SortLength(ex1, F)
#' SortLength(ex2)
#' SortLength(ex2, F)
#' SortLength(ex2, na.last = T)
#' SortLength(ex2, na.last = F)
#' SortLength(ex2, F, na.last = T)
#' SortLength(ex2, F, na.last = F)
SortLength = function(x, decreasing = TRUE, na.last = NA){
  x[sort.int(nchar(x), na.last = na.last, decreasing = decreasing, index.return = TRUE)[[2]]]
}







#' @title Suppress Warnings and Messages
#' @description Suppress warnings and messages when evaluating an expression
#' @param expr expression to evaluate
SWSM = function(expr){
  suppressMessages(suppressWarnings(expr))
}






#' @title Sort Unlist Unique
#' @description Get the unique set, convert it from list to vector, and then sort it
#' @param thing thing to get a sorted, unlisted vector of.  This is often a column of a data.table.
#' @examples
#' X = sample(x = letters[1:20], size = 30, replace = T, prob = (1:20)/sum(1:20))
#' Y = sample(x = letters[1:20], size = 30, replace = T, prob = (1:20)/sum(1:20))
#' Z = sample(x = letters[1:20], size = 30, replace = T, prob = (1:20)/sum(1:20))
#' thing1 = data.table(X = X, Y = Y, Z = Z, stringsAsFactors = F)
#' thing2 = thing1[,2,with = F]
#' thing3 = SUU(thing2)
#' print(thing3)
#' str(thing3)
#' SUU(thing1[,1,with = F])
#' SUU(thing1[,3,with = F])
SUU = function(thing){
  sort(unlist(unique(thing)))
}





#' @title Convert dates from Excel
#' @description Convert date values pulled from an Excel workbook, such as .xslx.  This function just runs as.Date with the origin set to "1899-12-30".  Excel apparently uses this as the origin because they did not realize that 1900 was not a leap year.
#' @param x a numeric vector
#' @return A vector containing the elements of \code{x} converted to Date format
#' @examples
#' xlDate(42359)
#' xlDate(0)
#' xlDate(-1365)
#' datevector = 40000 + (1:10)*365
#' xlDate(datevector)
xlDate = function(x){
  if(!is.integer(x)){
    x = as.integer(x)
  }
  as.Date(x, origin = "1899-12-30")
}
