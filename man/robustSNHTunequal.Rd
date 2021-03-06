% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/robustSNHTunequal.R
\name{robustSNHTunequal}
\alias{robustSNHTunequal}
\title{Robust SNHT with Unequal Times}
\usage{
robustSNHTunequal(data, period, time, estimator = NULL, scaled=TRUE
    ,rmSeasonalPeriod = Inf)
}
\arguments{
\item{data}{The data to be analyzed for changepoints.}

\item{period}{The SNHT works by calculating the mean of the data on the
previous period observations and the following period observations. Thus,
this argument controls the window size for the test statistics.}

\item{time}{Numeric vector specifying times for the observations. If not
supplied, it is assumed that each observation occurs on one time period. If
supplied, then the algorithm will create a new dataset with the same number
of observations for each time unit by adding missing values.}

\item{estimator}{See ?robustSNHT}

\item{scaled}{See ?snht.}

\item{rmSeasonalPeriod}{See ?snht.}
}
\value{
Returns a data.frame, with columns score, leftMean, and rightMean,
and time. Statistic is the SNHT test statistic described above, and leftMean
(rightMean) are the means to the left (right) of the current observation.

Note that new (missing) observations were introduced to the dataset to
ensure the same number of observations occur per day.
}
\description{
This function performs a standard normal homogeneity test, but allows for
unequally spaced observations in time.
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

Other snht functions: \code{\link{robustSNHT}},
  \code{\link{snht}}
}
\author{
Josh Browning (jbrownin@mines.edu)
}
\keyword{~homogeneity}
\keyword{~robust}
\keyword{~snht}
