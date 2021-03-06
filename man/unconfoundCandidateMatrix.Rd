% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/unconfoundCandidateMatrix.R
\name{unconfoundCandidateMatrix}
\alias{unconfoundCandidateMatrix}
\title{Unconfound candidate matrix}
\usage{
unconfoundCandidateMatrix(candidate, pairs, statistics, data, period, avgDiff)
}
\arguments{
\item{candidate}{The candidate matrix, as computed by 
?createCandidateMatrix.}

\item{pairs}{The list object whose ith element specifies the neighboring 
locations to the ith location.}

\item{statistics}{The time x (number of pairs) matrix of SNHT statistics 
computed for each difference series.}

\item{data}{The data.frame containing the observations, restructured as in 
pairwiseSNHT.  So, the first column should be time, and the other columns 
should be named with the locations and contain the observed values at each
location.}

\item{period}{The SNHT works by calculating the mean of the data on the 
previous period observations and the following period observations.  Thus,
this argument controls the window size for the test statistics.}

\item{avgDiff}{A matrix containing the average differences between time 
series pairs.  Generally this is created within pairwiseSNHT().}
}
\value{
A list of two elements.  The first element contains the data after 
  the breaks have been removed.  The second element is a data.frame with 
  information regarding the detected changepoints (or NULL if none are
  found).
}
\description{
This function "unconfounds" the candidate matrix.  At each time point and 
for each location, we have the number of difference series which resulted in
a changepoint.  The location with the largest count is assumed to be the
location where the changepoint occurs.  Assignment of changepoints should
then proceed iteratively, where each new changepoint is assigned based on
the current highest count.
}
