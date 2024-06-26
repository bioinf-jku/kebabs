% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/AllClasses.R
\docType{class}
\name{ControlInformation-class}
\alias{ControlInformation}
\alias{ControlInformation-class}
\alias{class:ControlInformation}
\title{KeBABS Control Information Class}
\description{
KeBABS Control Information Class
}
\details{
Instances of this class store control information for the
KeBABS meta-SVM.
}
\section{Slots}{

\describe{
\item{\code{classification}}{indicator for classification task}

\item{\code{multiclassType}}{type of multiclass SVM}

\item{\code{featureWeights}}{feature weights control information}

\item{\code{selMethod}}{selected processing method}

\item{\code{onlyDense}}{indicator that only dense processing can be performed}

\item{\code{sparse}}{indicator for sparse processing}

\item{\code{runtimeWarning}}{indicator for runtime warning}
}}
\author{
Johannes Palme
}
\references{
\url{https://github.com/UBod/kebabs}\cr\cr
J. Palme, S. Hochreiter, and U. Bodenhofer (2015) KeBABS: an R package
for kernel-based analysis of biological sequences.
\emph{Bioinformatics}, 31(15):2574-2576.
DOI: \doi{10.1093/bioinformatics/btv176}.
}

