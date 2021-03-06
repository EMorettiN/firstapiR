% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/firstapiR_http.R
\name{GetSession}
\alias{GetSession}
\title{Create a firstapiR session}
\usage{
GetSession(username, key, season = .default_season, format = "data.frame",
  staging = FALSE)
}
\arguments{
\item{username}{A character vector containing the username assigned by FIRST.}

\item{key}{A character vector containing the authorization key assigned by
FIRST, or the value "key".}

\item{season}{An integer vector containing the 4-digit year. Must be equal to
or less than the current season and greater than or equal to 2015.
Optional: defaults to the current year.}

\item{format}{A character vector that specifies the data format that will be
returned by firstapiR functions. Can be "json", "data.frame", or "xml"
(case insensitive). Optional: defaults to "data.frame".}

\item{staging}{A logical vector. If set to \code{TRUE}, firstapiR uses the
staging URL. Optional: defaults to \code{FALSE}.}
}
\value{
A Session object containing all GetSession parameters.
  The class attribute is set to c("list", "Session")
}
\description{
Every firstapiR function requires a Session object as its first parameter.
}
\details{
The Session object is an R list that contains the FIRST API username and
authorization key, season, format, and a boolean value that specifies whether
to use the staging server instead of the production server.

The \code{key} argument may be set to the value "key". If this is done, the
firstapiR functions will skip the HTTP request and will extract example data
from the R/sysdata.rda file, which is included with the firstapiR package.
This function is for testing and demonstrations when no internet connection
or valid authorization key is available. Example data frames returned by
firstapiR functions will have their \emph{local_test_data} attribute set to
\code{TRUE} and the \emph{time_downloaded} attribute will be set to the date
and time that the example data was downloaded from the server and stored in
the R/sysdata.rda file.

Throws an error if \code{season}, \code{format}, or \code{staging} arguments
are incorrect.
}
\examples{
sn <- GetSession("myUserName", "myAuthorizationKey")
sn <- GetSession("myUserName", "myAuthorizationKey", season = 2015)
sn$format <- "xml"
}

