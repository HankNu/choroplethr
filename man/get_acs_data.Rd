% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/acs.R
\name{get_acs_data}
\alias{get_acs_data}
\title{Returns a list representing American Community Survey (ACS) estimates}
\usage{
get_acs_data(tableId, map, endyear = 2012, span = 5, column_idx = -1,
  include_moe = FALSE)
}
\arguments{
\item{tableId}{The id of an ACS table}

\item{map}{The map you want to use. Must be one of "state", "county" or "zip".}

\item{endyear}{The end year of the survey to use.  See acs.fetch (?acs.fetch) and http://1.usa.gov/1geFSSj for details.}

\item{span}{The span of time to use.  See acs.fetch and http://1.usa.gov/1geFSSj for details.
on the same longitude and latitude map to scale. This variable is only checked when the "states" variable is equal to all 50 states.}

\item{column_idx}{The optional column id of the table to use. If not specified and the table has multiple columns,
you will be prompted for a column id.}

\item{include_moe}{Whether to include the 90 percent margin of error.}
}
\description{
Given a map, ACS tableId, endyear and span. Prompts user for the column id if there 
are multiple tables. The first element of the list is a data.frame with estimates. 
The second element is the ACS title of the column.
Requires the acs package to be installed, and a Census API Key to be set with the 
acs's api.key.install function.  Census API keys can be obtained at http://api.census.gov/data/key_signup.html.
}
\examples{
\dontrun{
library(Hmisc) # for cut2
# States with greater than 1M residents
df       = get_acs_data("B01003", "state")[[1]] # population
df$value = cut2(df$value, cuts=c(0,1000000,Inf))
state_choropleth(df, title="States with a population over 1M", legend="Population")

# Counties with greater than or greater than 1M residents
df       = get_acs_data("B01003", "county")[[1]] # population
df$value = cut2(df$value, cuts=c(0,1000000,Inf))
county_choropleth(df, title="Counties with a population over 1M", legend="Population")
}
}
\seealso{
http://factfinder2.census.gov/faces/help/jsf/pages/metadata.xhtml?lang=en&type=survey&id=survey.en.ACS_ACS, which lists all ACS Surveys.
}
