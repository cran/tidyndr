## ---- echo = FALSE, message = FALSE-------------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>", message = FALSE, warning = FALSE)
options(tibble.print_min = 4L, tibble.print_max = 4L)
library(tidyndr)
# library(tidyverse)
set.seed(1014)

## ----setup--------------------------------------------------------------------
library(tidyndr)
library(dplyr)

## ---- tx_net_new--------------------------------------------------------------
## import both previous and current NDR line-lists
file_path <- "https://raw.githubusercontent.com/stephenbalogun/example_files/main/ndr_example.csv"

prev_data <- read_ndr(file_path,
                     time_stamp = "2020-12-31") 
current_data <- read_ndr(file_path,
                     time_stamp = "2020-02-28") 

## generate the tx_curr for each of the imported line-lists
tx_curr_prev <- tx_curr(prev_data)

tx_curr_now <- tx_curr(current_data)

## summarise the treatment currents at state level
tx_currs <- summarise_ndr(tx_curr_prev,
              tx_curr_now,
              level = "state",
              names = c("tx_curr_prev", "tx_curr_now"))

## create a new column that calculates the tx_net_new
tx_net_new <- tx_currs %>%
  mutate(tx_net_new = tx_curr_now - tx_curr_prev)

print(tx_net_new)

## ---- cot_proxy---------------------------------------------------------------
## calculate the tx_new between the two periods
tx_new <- tx_new(current_data, from = "2021-01-01", to = "2021-02-28") %>%
  summarise_ndr(level = "state", names = "tx_new")

## add the tx_new summary to the initial table and calculate the tx_net_new
tx_net_new %>%
  left_join(tx_new, by = c("ip", "state")) %>%
  mutate(cot_proxy = 1 + (
  ((tx_net_new * 4) - (tx_new) * 4 ) /
    (tx_curr_now - tx_net_new + (tx_new * 4)))
  )

## ---- vl_testing_coverage-----------------------------------------------------
vl_eligible <- tx_vl_eligible(current_data, ref = "2021-06-30")

vl_result <- tx_pvls_den(current_data, ref = "2021-06-30")

nrow(vl_result) / nrow(vl_eligible) * 100

## ---- vl_suppression_coverage-------------------------------------------------
vl_result <- tx_pvls_den(current_data, ref = "2021-06-30")

vl_suppressed <- tx_pvls_num(current_data, ref = "2021-06-30")

nrow(vl_suppressed) / nrow(vl_result) * 100

## ---- arv_duration------------------------------------------------------------

less_than_three <- tx_mmd(ndr_example, months = c(0, 1, 2))

three_to_five <- tx_mmd(ndr_example, months = c(3, 4, 5))

six_plus <- tx_mmd(ndr_example, months = c(6:12))

summarise_ndr(less_than_three,
              three_to_five,
              six_plus,
              level = "state",
              names = c(
                "< 3months",
                "3-5months",
                "6+ months"
              ))

