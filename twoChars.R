# hackerrank.com/challenges/two-characters

uniqchars <- function(x) unique(strsplit(x, "")[[1]])

checkAlternating <- function(x){
  chars <- unlist(strsplit(x, ""))
  
  for(i in (1: (length(chars) - 1))){
    if(chars[i] == chars[i+1]){
      return(FALSE)
    }
  }
  return(TRUE)
}

# get input stream
input<-file('stdin', 'r')

# read number of chars in string
numChars <- readLines(input, n=1)

# read in string to reduce
inputString <- readLines(input, n=1)

# initialize the return value to base case
maxLength <- 0

# get unique chars
uniqueChars <- uniqchars(inputString)

# must be at least two characters, otherwise check for pattern and return string length
if(as.integer(numChars) <= 1){
  maxLength <- 0
}else if(as.integer(numChars) == 2) {
  if(checkAlternating(inputString)) maxLength <- nchar(inputString)
}else{
  # if only one or two unique characters, check for pattern and return string length
  if(length(uniqueChars) <= 2){
    if(checkAlternating(inputString)) maxLength <- nchar(inputString)
  }else{
    # find the unique characters to remove to generate possible result strings, there 
    # can only be 2 chars in the result string find all char combos to remove and test for
    removes <- combn(uniqueChars, length(uniqueChars) - 2, simplify = FALSE)
  
    for(i in (1: length(removes))){
      # copy input string
      temp <- inputString

      # collapse characters into a pipe delimited string for regex matching
      regexStr <- paste(removes[[i]],collapse = "|")
  
      # remove all instances of the characters from the string
      resStr <- gsub(regexStr, '',  temp)

      # if we have a string > 1 character, check for pattern
      if(nchar(resStr) > 1 && checkAlternating(resStr)){
        thisLength <- nchar(resStr)
      }else if(nchar(resStr) == 1){
        thisLength <- 0
      }else{
        thisLength <- 0
      }
      if(thisLength > maxLength) maxLength = thisLength
    }
  }
}

cat(maxLength)
