% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/utils.R
\name{linearKernel}
\alias{linearKernel}
\title{Linear Kernel}
\usage{
linearKernel(x, y = NULL, selx = integer(0), sely = integer(0),
  sparse = FALSE, triangular = TRUE, diag = TRUE, lowerLimit = 0)
}
\arguments{
\item{x}{a dense or sparse explicit representation. \code{x} must be a
sparse explicit representation when a sparse kernel matrix should be
returned by the function (see parameter \code{sparse}).}

\item{y}{a dense or sparse explicit representation. If \code{x} is dense,
\code{y} must be dense. If \code{x} is sparse, \code{y} must be sparse.}

\item{selx}{a numeric or character vector for defining a subset of
\code{x}. Default=integer(0)}

\item{sely}{a numeric or character vector for defining a subset of
\code{y}. Default=integer(0)}

\item{sparse}{boolean indicating whether returned kernel matrix
should be sparse or dense. For value \code{FALSE} a dense kernel matrix
of class \code{\link{KernelMatrix}} is returned. If set to \code{TRUE}
the kernel matrix is returned as sparse matrix of class
\code{\linkS4class{dgCMatrix}}. In case of a symmetric matrix either the
lower triangular part or the full matrix can be returned. Please note that
a sparse kernel matrix currently can not be used for SVM based learning
in \code{kebabs}. Default=FALSE}

\item{triangular}{boolean indicating whether just the lower triangular or
the full sparse matrix should be returned. This parameter is only relevant
for a sparse symmetric kernel matrix. Default=TRUE}

\item{diag}{boolean indicating whether the diagonal should be included
in a sparse triangular matrix. This parameter is only relevant when
parameter \code{sparse} and \code{triangular} are set to \code{TRUE}.
Default=TRUE}

\item{lowerLimit}{a numeric value for a similarity threshold. The
parameter is relevant for sparse kernel matrices only. If set to a value
larger than 0 only similarity values larger than this threshold will
be included in the sparse kernel matrix. Default=0}
}
\value{
linearKernel:
kernel matrix as class \code{\linkS4class{KernelMatrix}} or sparse
kernel matrix of class \code{\linkS4class{dgCMatrix}}
dependent on parameter \code{sparse}
}
\description{
Create a dense or sparse kernel matrix from an explicit
representation
}
\examples{
## load sequence data and change sample names
data(TFBS)
names(enhancerFB) <- paste("S", 1:length(enhancerFB), sep="_")

## create the kernel object for dimers with normalization
speck <- spectrumKernel(k=5)

## generate sparse explicit representation
ers <- getExRep(enhancerFB, speck)

## compute dense kernel matrix (as currently used in SVM based learning)
km <- linearKernel(ers)
km[1:5, 1:5]

## compute sparse kernel matrix
## because it is symmetric just the lower diagonal
## is computed to save storage
km <- linearKernel(ers, sparse=TRUE)
km[1:5, 1:5]

## compute full sparse kernel matrix
km <- linearKernel(ers, sparse=TRUE, triangular=FALSE)
km[1:5, 1:5]

## compute triangular sparse kernel matrix without diagonal
km <- linearKernel(ers, sparse=TRUE, triangular=TRUE, diag=FALSE)
km[1:5, 1:5]

## plot histogram of similarity values
hist(as(km, "numeric"), breaks=30)

## compute sparse kernel matrix with similarities above 0.5 only
km <- linearKernel(ers, sparse=TRUE, lowerLimit=0.5)
km[1:5, 1:5]
}
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
\keyword{kernel}
\keyword{linearKernel}

