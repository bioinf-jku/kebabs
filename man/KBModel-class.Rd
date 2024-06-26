% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/AllClasses.R
\docType{class}
\name{KBModel-class}
\alias{KBModel}
\alias{KBModel-class}
\alias{class:KBModel}
\title{KeBABS Model Class}
\description{
KeBABS Model Class
}
\details{
Instances of this class represent a model object for the KeBABS
meta-SVM.
}
\section{Slots}{

\describe{
\item{\code{call}}{invocation string of KeBABS meta-SVM}

\item{\code{numSequences}}{number of sequences used for training}

\item{\code{sel}}{index subset of samples used for training}

\item{\code{y}}{vector of target values}

\item{\code{levels}}{levels of target}

\item{\code{numClasses}}{number of classes}

\item{\code{classNames}}{class labels}

\item{\code{classWeights}}{class weights}

\item{\code{SV}}{support vectors}

\item{\code{svIndex}}{support vector indices}

\item{\code{alphaIndex}}{list of SVM indices per SVM}

\item{\code{trainingFeatures}}{feature names used in training}

\item{\code{featureWeights}}{feature Weights}

\item{\code{b}}{model offset}

\item{\code{probA}}{fitted logistic function parameter A}

\item{\code{probB}}{fitted logistic function parameter A}

\item{\code{sigma}}{scale of Laplacian fitted to regression residuals}

\item{\code{cvResult}}{cross validation result of class
\code{\linkS4class{CrossValidationResult}}}

\item{\code{modelSelResult}}{model selection / grid search result of class
\code{\linkS4class{ModelSelectionResult}}}

\item{\code{ctlInfo}}{KeBABS control info of class
\code{\linkS4class{ControlInformation}}}

\item{\code{svmInfo}}{info about requested / used SVM of class
\code{\linkS4class{SVMInformation}}}

\item{\code{svmModel}}{original model returned from SVM}
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

