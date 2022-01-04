## ---- echo = FALSE, message = FALSE-------------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
options(tibble.print_min = 4L, tibble.print_max = 4L)
library(tidyndr)
set.seed(1014)

## ---- eval = FALSE------------------------------------------------------------
#  library(tidyndr)

## ---- read_ndr, eval = FALSE--------------------------------------------------
#  
#  ## import file from the computer. This uses the "treatment" example file that comes with the {tidyndr} package.
#  
#  file_path <- system.file("extdata",
#                           "ndr_example.csv",
#                           package = "tidyndr")
#  
#  ex_ndr <- read_ndr(file_path, time_stamp = "2021-12-15")
#  
#  ## import file from the computer using a few of the `...` arguments and setting `quiet` to TRUE
#  
#  ndr_example <- read_ndr(file_path,
#                          time_stamp = "2021-12-15",
#                          skip = 0,
#                          comment = "",
#                          quiet = TRUE)
#  
#  ## import recent infection example file
#  
#  file_path2 <- system.file(
#    "extdata",
#    "recency_example.csv",
#    package = "tidyndr"
#  )
#  
#  ex_recency <- read_ndr(file_path2, type = "recency")

## ---- tx_new------------------------------------------------------------------
## generate tx_new clients between January and June 2021 for all states in the data
tx_new(ndr_example, from = "2021-01-01", to = "2021-06-30")

## generate tx_new for only one state ("Arewa" in the data) for January 2021.

tx_new(ndr_example,
       from = "2021-01-01",
       to = "2021-01-31",
       states = "Arewa")

## ---- tx_curr-----------------------------------------------------------------
## generate current clients using the calculated `current_status` column
tx_curr(ndr_example)

## generate current clients using the default `current_status_28_days` column
tx_curr(ndr_example,
        status = "default")

## ---- tx_ml, eval = FALSE-----------------------------------------------------
#  ## generate the line-list of clients who were active at the beginning of October 2020
#  ## (beginning of FY21) but became inactive at the end of December 2020.
#  tx_ml(new_data = ndr_example,
#        from = "2021-10-01",
#        to = "2021-12-31")
#  
#  ## if data from two periods are available, you can supply these to determine the `tx_ml"
#  
#  file_path <- "https://raw.githubusercontent.com/stephenbalogun/example_files/main/ndr_example.csv"
#  ndr_old <- read_ndr(file_path, time_stamp = "2021-02-15")
#  ndr_new <- ndr_example
#  tx_ml(old_data = ndr_old,
#        new_data = ndr_new)
#  
#  ## generate the line-list of clients who have become inactive for "Arewa" and "Abaji"
#  ## since the beginning of October 2021.
#  tx_ml(ndr_example,
#        states = c("Abaji", "Arewa"), from = "2021-10-01")

## ---- tx_ml_outcomes, eval = FALSE--------------------------------------------
#  ## generate the line-list of all clients who became inactive this Fiscal Year
#  ml_example <- tx_ml(ndr_example)
#  
#  ## subset inactive clients who were transferred out
#  tx_ml_outcomes(ml_example, outcome = "transferred out")

## ---- tx_rtt, eval = FALSE----------------------------------------------------
#  ## location of the old line-list that contains the list of inactive clients
#  file_path <- "https://raw.githubusercontent.com/stephenbalogun/example_files/main/ndr_example.csv"
#  
#  old_data <- read_ndr(file_path,
#                       time_stamp = "2021-02-15")
#  
#  new_data <- ndr_example
#  tx_rtt(old_data, new_data)

## ---- tx_appt-----------------------------------------------------------------
## generate list of clients with medication appointment in Q2 of FY21
q2_appt <- tx_appointment(ndr_example,
              from = "2022-01-01",
              to = "2022-03-31")

## print the number of clients with appointments in Q2
nrow(q2_appt)

## ---- tx_mmd------------------------------------------------------------------
tx_mmd(ndr_example)

## filter clients who had more than 6 months of ARV
tx_mmd(ndr_example,
       months = c(7, Inf))

## list of clients who had either more than 6 months, or < 3 months medications dispensed
tx_mmd(ndr_example,
       months = c(1, 2, 7, Inf))

## ---- tx_vl_eligible----------------------------------------------------------
## list of clients who are eligible for VL sample collection by the end of March 2022
tx_vl_eligible(ndr_example,
               ref = "2022-03-31",
               sample = TRUE)

## filter clients who are eligible for VL test (result) by 31st of December 2021
tx_vl_eligible(ndr_example,
               ref = "2021-12-31")

## ---- tx_pvls_den-------------------------------------------------------------
## determine clients whose viral load result is within the last 1 year for adults (>= 20 years) 
## and 6 months for paediatrics and adolescents
tx_pvls_den(ndr_example)

## List of clients who will not be due for a repeat VL test by the end of September 2021
tx_pvls_den(ndr_example,
            ref = "2021-09-30")

## ---- tx_pvls_num-------------------------------------------------------------
## clients whose last viral load result is within the last 1 year for adults (>= 20 years) 
## and 6 months for paediatrics and adolescents, and are virally suppressed
tx_pvls_num(ndr_example)

## generate the list of clients whose viral load result is less than 50
tx_pvls_num(ndr_example,
            n = 50)

## ---- tx_vl_unsuppressed------------------------------------------------------
## clients whose last viral load result is within the last 1 year for adults (>= 20 years) 
## and 6 months for paediatrics and adolescents but were unsuppressed
tx_vl_unsuppressed(ndr_example)

## ---- summarise_ndr-----------------------------------------------------------
curr <- tx_curr(ndr_example) # generate active clients and assign to "curr"

new <- tx_new(ndr_example, from = "2021-10-01", to = "2021-12-31") # generate TX_NEW for the FY and assign to "new"

summarise_ndr(curr, new, level = "state", names = c("curr", "tx_new")) # when the `names` argument is not supplied, the data names are used

## ---- disaggregate, eval = FALSE----------------------------------------------
#  ## generate list of inactive clients
#  inactives <- tx_ml(new_data = ndr_example, from = "2021-01-01", to = "2021-03-31")
#  
#  ## disaggregate inactive clients by gender at state level
#  disaggregate(inactives,
#               by = "sex")
#  
#  ## disaggregate inactive clients by "age group" at country level
#  disaggregate(inactives,
#               by = "current_age",
#               level = "country",
#               pivot_wide = FALSE)
#  

