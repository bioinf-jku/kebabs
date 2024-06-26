% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/AllClasses.R
\docType{class}
\name{MotifKernel-class}
\alias{MotifKernel}
\alias{MotifKernel-class}
\alias{class:MotifKernel}
\title{Motif Kernel Class}
\description{
Motif Kernel Class
}
\details{
Instances of this class represent a kernel object for the motif
kernel. The class is derived from \link{SequenceKernel}. The motif
character vector is not stored in the kernel object.
}
\section{Slots}{

\describe{
\item{\code{r}}{exponent (for details see \link{motifKernel})}

\item{\code{annSpec}}{when set the kernel evaluates annotation information}

\item{\code{distWeight}}{distance weighting function or vector}

\item{\code{normalized}}{data generated with this kernel object is normalized}

\item{\code{exact}}{use exact character set for evaluation}

\item{\code{ignoreLower}}{ignore lower case characters in the sequence}

\item{\code{presence}}{consider only the presence of motifs not their counts}

\item{\code{revComplement}}{consider a kmer and its reverse complement
      as the same feature}
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
