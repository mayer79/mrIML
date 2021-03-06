% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_vi.R
\name{plot_vi}
\alias{plot_vi}
\title{Plots global importance (i.e. cumulative importance of all features for all response variables) and individual response importance.}
\usage{
plot_vi(
  VI,
  modelPerf,
  Y,
  X,
  groupCov = NULL,
  cutoff = 0.2,
  plot.pca = "no",
  model = "regression"
)
}
\arguments{
\item{VI}{A \code{dataframe} dataframe generated from mrvip function}

\item{modelPerf}{A \code{dataframe} dataframe generated by modelPerf function}

\item{Y}{A \code{dataframe} feature dataset}

\item{X}{A \code{dataframe} response dataset}

\item{cutoff}{A \code{numeric} determines  mathews correlation coefifcent (mcc) threshold for displaying individual reponse model. Default is 0.5}

\item{mod}{\code{character}'classification' or 'regression' i.e., is the generative model a regression or classification?}
}
\description{
Plots global importance (i.e. cumulative importance of all features for all response variables) and individual response importance.
}
\details{
1st plot: 
and individual reponse feature plots (2nd plot). Requires object generated from the R function mrvip as well as feature data (Y).
Variables also need to be grouped to allow for easier interpretation.
}
