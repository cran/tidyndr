#' Line-list of 50,000 Simulated Clients Provided in the NDR Format.
#'
#' A dataset containing clients' details that were randomly generated to simulate
#' the NDR patient line-list downloaded from the front-end of the Nigeria National Data
#' Repository. Three additional variables are added for easy referencing during analysis.
#' These variables are: `date_ltfu`, `appointment_date` and `current_status`.
#'
#' @format A data frame with 50000 rows and 52 variables:
#' \describe{
#'   \item{ip}{Implementing Partner}
#'   \item{state}{State of registration of client}
#'   \item{lga}{Local Government Area where client was registered}
#'   \item{facility}{Facility where the client was registered}
#'   \item{datim_code}{'DATIM CODE' of the facility of registration}
#'   \item{sex}{The gender that the client identified as, "M" or "F"}
#'   \item{patient_identifier}{Patient unique id}
#'   \item{hospital_number}{assigned hospital reference number}
#'   \item{date_of_birth}{Birth day of client, in "yyyy-dd-mm"}
#'   \item{age_at_art_initiation}{Age of client at commencement of ART}
#'   \item{current_age}{Age of client as at when the dataset was generated}
#'   \item{art_start_date}{Date of commencement of ART}
#'   \item{art_start_date_source}{The reference for the art_start_date}
#'   \item{last_drug_pickup_date}{Date of last medication refill}
#'   \item{last_drug_pickup_date_q1}{Date of last medication refill in Q1}
#'   \item{last_drug_pickup_date_q2}{Date of last medication refill in Q2}
#'   \item{last_drug_pickup_date_q3}{Date of last medication refill in Q3}
#'   \item{last_drug_pickup_date_q4}{Date of last medication refill in Q4}
#'   \item{last_regimen}{The combination regimen dispensed during last medication refill}
#'   \item{last_clinic_visit_date}{Date of last hospital visit (for any reason)}
#'   \item{days_of_arv_refill}{Number of days of medications dispensed}
#'   \item{pregnancy_status}{Pregnancy status of client entered as "P", "NP" or "BF"}
#'   \item{current_viral_load}{Value of the most recent viral load result of client}
#'   \item{date_of_current_viral_load}{Date of most recent viral load result}
#'   \item{current_viral_load_q1}{Viral load result of client at end of Q1}
#'   \item{date_of_current_viral_load_q1}{Date of last viral load result in Q1}
#'   \item{current_viral_load_q2}{Viral load result of client at end of Q2}
#'   \item{date_of_current_viral_load_q2}{Date of last viral load result in Q2}
#'   \item{current_viral_load_q3}{Viral load result of client at end of Q3}
#'   \item{date_of_current_viral_load_q3}{Date of last viral load result in Q3}
#'   \item{current_viral_load_q4}{Viral load result of client at end of Q4}
#'   \item{date_of_current_viral_load_q4}{Date of last viral load result in Q4}
#'   \item{current_status_28_days}{28-day treatment status of client as at generation of line-list}
#'   \item{current_status_90_days}{90-day treatment status of client as at generation of line-list}
#'   \item{current_status_q1_28_days}{28-day treatment status of client as at end of Q1}
#'   \item{current_status_q1_90_days}{28-day treatment status of client as at end of Q1}
#'   \item{current_status_q2_28_days}{28-day treatment status of client as at end of Q2}
#'   \item{current_status_q2_90_days}{28-day treatment status of client as at end of Q2}
#'   \item{current_status_q3_28_days}{28-day treatment status of client as at end of Q3}
#'   \item{current_status_q3_90_days}{90-day treatment status of client as at end of Q3}
#'   \item{current_status_q4_28_days}{28-day treatment status of client as at end of Q4}
#'   \item{current_status_q4_90_days}{28-day treatment status of client as at end of Q4}
#'   \item{patient_has_died}{TRUE or FALSE (or NA) indicating if patient is alive or not}
#'   \item{patient_deceased_date}{Date patient known to be deceased, if dead}
#'   \item{patient_transferred_out}{TRUE or FALSE (or NA) indicating if patient has been transferred out}
#'   \item{transferred_out_date}{Date of transfer, if transferred out}
#'   \item{patient_transferred_in}{TRUE or FALSE (or NA) indicating if patient is a transferred from other facility}
#'   \item{transferred_in_date}{TRUE or FALSE (or NA) indicating date client was transferred in}
#'   \item{x49}{column missing column name and containing negligible entries}
#'   \item{current_status}{TRUE or FALSE indicating whether the client is active or not based on the calculated date of LTFU}
#'   \item{date_lost}{The calculated expected LTFU date based on the last_drug_pick_up_date, days_of_arv_refill and 28 days missed appointment date}
#'    \item{appointment_date}{The calculated expected next date of medication refill based on the last_drug_pick_up_date and days_of_arv_refill}
#'   }
#' @note for more information, kindly visit \url{https://ndr.phis3project.org.ng/}
"ndr_example"
