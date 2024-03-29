% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tx_curr.R
\name{tx_curr}
\alias{tx_curr}
\title{Subset Clients who are Currently on Treatment}
\usage{
tx_curr(
  data,
  states = NULL,
  facilities = NULL,
  status = "default",
  remove_duplicates = FALSE
)
}
\arguments{
\item{data}{An NDR dataframe imported using the \code{read_ndr()}.}

\item{states}{The name(s) of the State(s) of interest. The default utilizes all
the states in the dataframe. If specifying more than one state, combine the
states using the \code{c()} e.g. \code{c("State 1", "State 2")}.}

\item{facilities}{The name(s) of the facilit(ies) of interest. Default is to utilize
all the facilities contained in the dataframe. If specifying more than one
facility, combine the facilities using the \code{c()} e.g.
\code{c("Facility 1", "Facility 2")}.}

\item{status}{Determines how the number of active clients is calculated.
The options are to either to use the NDR current_status_28_days column
or the derived current_status column ("calculated").}

\item{remove_duplicates}{Boolean argument. It specifies if duplicate patient entries in the facilities should be removed or kept}
}
\value{
TX_CURR
}
\description{
\code{tx_curr} pulls up the line-list of clients who are active
on treatment using the calculated \code{current_status} column. You can specify
the state(s) and/or facilit(ies) of interest using the \code{region} or
\code{site} arguments.
}
\examples{
# Calculated active clients using the derived current status
tx_curr(ndr_example)

# Calculate the active clients using the NDR `current_status_28_days` column
tx_curr(ndr_example, status = "default")

# generate the TX_CURR for two states (e.g. "Arewa" and "Okun" in the ndr_example file)
tx_curr(ndr_example,
  states = c("Okun", "Arewa")
)

# determine the active clients in two facilities ("Facility1", and "Facility2) in "Abaji"
tx_curr(ndr_example,
  states = "Abaji",
  facilities = c("Facility1", "Facility2")
)
}
