% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rita_result.R
\name{rita_result}
\alias{rita_result}
\title{Generate List of RTRI-Positive Clients with Documented Viral Load Results}
\usage{
rita_result(data, from = NULL, to = NULL, states = NULL, facilities = NULL)
}
\arguments{
\item{data}{An NDR dataframe imported using the \code{read_ndr()}.}

\item{from}{The start date in ISO8601 format (i.e. "yyyy-mm-dd").
The default is to start at the beginning of the current Fiscal Year (i.e. 1st of October).}

\item{to}{The end date written in ISO8601 format (i.e. "yyyy-mm-dd").
The default is the date of analysis.}

\item{states}{The name(s) of the State(s) of interest. The default utilizes all
the states in the dataframe. If specifying more than one state, combine the
states using the \code{c()} e.g. \code{c("State 1", "State 2")}.}

\item{facilities}{The name(s) of the facilit(ies) of interest. Default is to utilize
all the facilities contained in the dataframe. If specifying more than one
facility, combine the facilities using the \code{c()} e.g.
\code{c("Facility 1", "Facility 2")}.}
}
\value{
Line-list of clients with recent infection and a viral load result
}
\description{
Generate List of RTRI-Positive Clients with Documented Viral Load Results
}
\examples{
## Get HTS_POS clients who had a documented viral load result for recency in 2021
rita_result(recency_example, from = "2021-01-01")
}
