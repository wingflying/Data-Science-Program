setwd("D:/My Documents/GitHub/GitHub/ProgAssignment3V2")

rankall <- function(rankArea, num = "best") {
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  if (rankArea == "heart attack") {
    outcome <- outcome[!is.na(outcome[11]),]
    outcome[,11] <- as.numeric(outcome[,11])
    attach(outcome)
    result <- outcome[order(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, Hospital.Name), ]
  } else if (rankArea == "heart failure") {
    outcome <- outcome[!is.na(outcome[17]),]
    outcome[,17] <- as.numeric(outcome[,17])
    attach(outcome)
    result <- outcome[order(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, Hospital.Name), ]
  } else if (rankArea == "pneumonia") {
    outcome <- outcome[!is.na(outcome[23]),]
    outcome[,23] <- as.numeric(outcome[,23])
    attach(outcome)
    result <- outcome[order(Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, Hospital.Name), ]
  } else
    stop("invalid outcome")
  
  result <- split(result, result$State)
  l <- lapply(result, function(x) {
    if (num == "best") {
      return (x[1, c(2,7)])
    } else if (num == "worst") {
      return (x[nrow(x),c(2,7)])
    } else if (num >= 1 && num <= nrow(x))
      return (x[num, c(2,7)])
    else
      return (c(NA, x[1,7]))
  }
  )
  ans <- data.frame(matrix(unlist(l), nrow=length(l), byrow=T))
  names(ans) <- c("hospital","state") 
  return (ans);
}