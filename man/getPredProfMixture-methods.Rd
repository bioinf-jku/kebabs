% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/predictionProfile.R
\docType{methods}
\name{getPredProfMixture,BioVector-method}
\alias{getPredProfMixture}
\alias{getPredProfMixture,BioVector-method}
\alias{getPredProfMixture,XString-method}
\alias{getPredProfMixture,XStringSet-method}
\title{Calculation Of Predicition Profiles for Mixture Kernels}
\usage{
\S4method{getPredProfMixture}{BioVector}(object, trainseqs, mixModel, kernels,
  mixCoef, svmIndex = 1, sel = 1:length(object),
  weightLimit = .Machine$double.eps)

\S4method{getPredProfMixture}{XStringSet}(object, trainseqs, mixModel, kernels,
  mixCoef, svmIndex = 1, sel = 1:length(object),
  weightLimit = .Machine$double.eps)

\S4method{getPredProfMixture}{XString}(object, trainseqs, mixModel, kernels,
  mixCoef, svmIndex = 1, sel = 1, weightLimit = .Machine$double.eps)
}
\arguments{
\item{object}{a single biological sequence in the form of an
\code{\linkS4class{DNAString}}, \code{\linkS4class{RNAString}} or
\code{\linkS4class{AAString}} or multiple biological sequences as
\code{\linkS4class{DNAStringSet}}, \code{\linkS4class{RNAStringSet}},
\code{\linkS4class{AAStringSet}} (or as \code{\linkS4class{BioVector}}).}

\item{trainseqs}{training sequences on which the mixture model was
trained as
\code{\linkS4class{DNAStringSet}}, \code{\linkS4class{RNAStringSet}},
\code{\linkS4class{AAStringSet}} (or as \code{\linkS4class{BioVector}}).}

\item{mixModel}{model object of class \code{\linkS4class{KBModel}}
trained with kernel mixture.}

\item{kernels}{a list of sequence kernel objects of class
\code{\linkS4class{SequenceKernel}}. The same kernels must be used as in
training.}

\item{mixCoef}{mixing coefficients for the kernel mixture. The same mixing
coefficient values must be used as in training.}

\item{svmIndex}{integer value selecting one of the pairwise SVMs in case of
pairwise multiclass classification. Default=1}

\item{sel}{subset of indices into \code{x} as integer vector. When this
parameter is present the prediction profiles are computed for the specified
subset of samples only. Default=\code{integer(0)}}

\item{weightLimit}{the feature weight limit is a single numeric value and
allows pruning of feature weights. All feature weights with an absolute
value below this limit are set to 0 and are not considered for the
prediction profile computation. This parameter is only relevant when
feature weights are calculated in KeBABS during training.
Default=.Machine$double.eps}
}
\value{
upon successful completion, the function returns a set
of prediction profiles for the sequences as class
\code{\linkS4class{PredictionProfile}}.
}
\description{
compute prediction profiles for a given set of biological
sequences from a model trained with mixture kernels
}
\details{
With this method prediction profiles can be generated explicitely for a
given set of sequences with a model trained on a precomputed kernel matrix
as mixture of multiple kernels.\cr\cr
}
\examples{
## set random generator seed to make the results of this example
## reproducable
set.seed(123)

## load coiled coil data
data(CCoil)
gappya1 <- gappyPairKernel(k=1,m=11, annSpec=TRUE)
gappya2 <- gappyPairKernel(k=2,m=9, annSpec=TRUE)
kernels <- list(gappya1, gappya2)
mixCoef <- c(0.7,0.3)

## precompute mixed kernel matrix
km <- as.KernelMatrix(mixCoef[1]*gappya1(ccseq) +
                      mixCoef[2]*gappya2(ccseq))
mixModel <- kbsvm(x=km, y=as.numeric(yCC),
               pkg="e1071", svm="C-svc", cost=15)

## define two new sequences to be predicted
GCN4 <- AAStringSet(c("MKQLEDKVEELLSKNYHLENEVARLKKLV",
                      "MKQLEDKVEELLSKYYHTENEVARLKKLV"))
names(GCN4) <- c("GCN4wt", "GCN_N16Y,L19T")
## assign annotation metadata
annCharset <- annotationCharset(ccseq)
annot <- c("abcdefgabcdefgabcdefgabcdefga",
           "abcdefgabcdefgabcdefgabcdefga")
annotationMetadata(GCN4, annCharset=annCharset) <- annot

## compute prediction profiles
predProf <- getPredProfMixture(GCN4, ccseq, mixModel,
                               kernels, mixCoef)

## show prediction profiles
predProf

## plot prediction profile of both aa sequences
plot(predProf, sel=c(1,2), ylim=c(-0.4, 0.2), heptads=TRUE, annotate=TRUE)
}
\author{
Johannes Palme
}
\references{
\url{https://github.com/UBod/kebabs}\cr\cr
C.C. Mahrenholz, I.G. Abfalter, U. Bodenhofer, R. Volkmer and
S. Hochreiter (2011) Complex networks govern coiled coil
oligomerization - predicting and profiling by means of a machine
learning approach. \emph{Mol. Cell. Proteomics}, 10(5):M110.004994.
DOI: \doi{10.1074/mcp.M110.004994}. \cr\cr
U. Bodenhofer, K. Schwarzbauer, M. Ionescu, and
S. Hochreiter (2009).
Modelling position specificity in sequence kernels by fuzzy
equivalence relations. \emph{Proc. Joint 13th IFSA World Congress and 6th
EUSFLAT Conference}, pp. 1376-1381, Lisbon.\cr\cr
J. Palme, S. Hochreiter, and U. Bodenhofer (2015) KeBABS: an R package
for kernel-based analysis of biological sequences.
\emph{Bioinformatics}, 31(15):2574-2576.
DOI: \doi{10.1093/bioinformatics/btv176}.
}
\seealso{
\code{\linkS4class{PredictionProfile}}, \code{\link{predict}},
\code{\link{plot}}, \code{\link{featureWeights}},
\code{\link{getPredictionProfile}}
}
\keyword{feature}
\keyword{methods}
\keyword{prediction}
\keyword{profile}
\keyword{weights}

