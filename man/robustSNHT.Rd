% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/robustSNHT.R
\name{robustSNHT}
\alias{robustSNHT}
\title{Robust SNHT}
\usage{
robustSNHT(data, period, scaled=TRUE, rmSeasonalPeriod=Inf
      ,estimator=function(x, minObs=5){
      x = x[!is.na(x)]
      if(length(x)<minObs) #Too many NA values, don't return a result
        return(c(NA,NA))
      if(max(table(x))>length(x)/2) #Too many duplicate values, MAD will be 0
        return(c(NA,NA))
      fit = MASS::huber(x)
      return(c(fit[[1]], fit[[2]]))        
})
}
\arguments{
\item{data}{The data to be analyzed for changepoints.}

\item{period}{The SNHT works by calculating the mean of the data on the
previous period observations and the following period observations. Thus,
this argument controls the window size for the test statistics.}

\item{scaled}{See ?snht.}

\item{rmSeasonalPeriod}{See ?snht.}

\item{estimator}{A custom function may be supplied to this function which
computes estimates for the mean and standard deviation. The function should
only take one argument (a numeric vector of data) and should return a
vector of length two: the estimated center and spread. The huber function
from MASS is implemented for the robust SNHT by default (along with some
data quality checks).}
}
\value{
Returns a data.frame, with columns score, leftMean, and rightMean,
and time. Statistic is the SNHT test statistic described above, and leftMean
(rightMean) are the means to the left (right) of the current observation.

Note that new (missing) observations were introduced to the dataset to
ensure the same number of observations occur per day.
}
\description{
This function performs a standard normal homogeneity test using a robust
estimator of the mean and standard deviation.  It also allows for a user-
defined definition of these statistics.
}
\details{
The SNHT works by calculating the mean of the data on the previous
period and on the following period. The test statistic at each observation
is then computed as described in Haimberger (2007). Essentially, though, it
just compares the means of these two periods and normalizes by the standard
deviation.

Note: if there are not enough observations both before and after the
current observation, no test is performed.

Large values of the test statistic suggests the presence of a changepoint.
Haimberger (see references) suggests values larger than 100 should be
considered changepoints.  However, this does not apply if scaled = TRUE.
}
\references{
L. Haimberger. Homogenization of radiosonde temperature time
series using innovation statistics. Journal of Climate, 20(7): 1377-1403,
2007.
}
\seealso{
\code{\link{huber}}

Other snht functions: \code{\link{robustSNHTunequal}},
  \code{\link{snht}}
}
\author{
Josh Browning (jbrownin@mines.edu)
}
\keyword{~homogeneity}
\keyword{~robust}
\keyword{~snht}
