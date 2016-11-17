setwd("D:/My Documents/GitHub/GitHub/ProgAssignment3V2")

rankhospital <- function(state, rankArea, num = "best") {
  ## Read outcome data
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  outcome <- outcome[outcome$State == state,]
  if (nrow(outcome) == 0)
    stop("invalid state")
  
  
  
  result <- NULL
  if (rankArea == "heart attack") {
    outcome <- outcome[complete.cases(outcome[,11]),]
    outcome[,11] <- as.numeric(outcome[,11])
    attach(outcome)
    result <- outcome[order(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, Hospital.Name), ]
  } else if (rankArea == "heart failure") {
    outcome <- outcome[complete.cases(outcome[,17]),]
    outcome[,17] <- as.numeric(outcome[,17])
    attach(outcome)
    result <- outcome[order(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, Hospital.Name), ]
  } else if (rankArea == "pneumonia") {
    outcome <- outcome[complete.cases(outcome[,23]),]
    outcome[,23] <- as.numeric(outcome[,23])
    attach(outcome)
    result <- outcome[order(Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, Hospital.Name), ]
  } else
    stop("invalid outcome")
  
  if (num == "best") 
    return (result[1,2])
  else if (num == "worst") {
    return (result[nrow(result),2])
  }
  else if (num >= 1 && num <= nrow(result))
    return (result[num,2])
  else 
    return (NA)
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
}