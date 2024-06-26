% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/plot-methods.R
\docType{methods}
\name{plot,PredictionProfile,missing-method}
\alias{plot}
\alias{plot,CrossValidationResult,missing-method}
\alias{plot,CrossValidationResult-method}
\alias{plot,ModelSelectionResult,missing-method}
\alias{plot,ModelSelectionResult-method}
\alias{plot,PredictionProfile,missing-method}
\alias{plot,PredictionProfile-method}
\alias{plot,ROCData,missing-method}
\alias{plot,ROCData-method}
\title{Plot Prediction Profiles, Cross Validation Result, Grid Search
Performance Parameters and Receiver Operating Characteristics}
\usage{
\S4method{plot}{PredictionProfile,missing}(x, sel = NULL, col = c("red",
  "blue"), standardize = TRUE, shades = NULL, legend = "default",
  legendPos = "topright", ylim = NULL, xlab = "", ylab = "weight",
  lwd.profile = 1, lwd.axis = 1, las = 1, heptads = FALSE,
  annotate = FALSE, markOffset = TRUE, windowSize = 1, ...)

\S4method{plot}{CrossValidationResult,missing}(x, col = "springgreen")

\S4method{plot}{ModelSelectionResult,missing}(x, sel = c("ACC", "BACC", "MCC",
  "AUC"))

\S4method{plot}{ROCData,missing}(x, lwd = 2, aucDigits = 3, cex = 0.8,
  side = 1, line = -3, adj = 0.9, ...)
}
\arguments{
\item{x}{for the first method above a prediction profile object of class
\code{\link{PredictionProfile}} containing the profiles to be plotted,
for the second method a cross validation result object usually taken
from the trained kebabs model object}

\item{sel}{an integer vector with one or two entries to select samples
of the prediction profile matrix for plotting, if this parameter is not
supplied by the user the frist one or two samples are selected.}

\item{col}{a character vector with one or two color names used for plotting
the samples. Default=c("red", "blue").}

\item{standardize}{logical. If \code{FALSE}, the profile values \code{s_i}
are displayed as they are with the value \eqn{y=-b/L} superimposed as
a light gray line. If \code{TRUE} (default), the whole profile is
shifted by \eqn{-b/L} and the light gray line is displayed at \code{y=0}.}

\item{shades}{vector of at least two color specifications; If not NULL,
the background area above and below the base line \code{y=-b/L} are shaded
in colors \code{shades[1]} and \code{shades[2]}, respectively. Default=NULL}

\item{legend}{a character vector with one or two character strings
containing the legend/description of the profile. If set to an empty vector
or to NULL, no legend is displayed.}

\item{legendPos}{position specification for the legend(if \code{legend} is
specified). Can either be a vector with coordinates or a single keyword like
\dQuote{topright} (see \code{\link[graphics:legend]{legend}}).}

\item{ylim}{argument that allows the user to preset the y-range of the
profile plot.}

\item{xlab}{label of horizontal axis, empty by default.}

\item{ylab}{label of vertical axis, defaults to "weight".}

\item{lwd.profile}{profile line width as described for parameter \code{lwd}
in \code{\link[graphics:par]{par}}}

\item{lwd.axis}{axis line width as described for parameter \code{lwd}
in \code{\link[graphics:par]{par}}}

\item{las}{see \code{\link[graphics:par]{par}}}

\item{heptads}{logical indicating whether for proteins with heptad
annotation (i.e. characters a to g, usually in periodic repetition) the
heptad structure should be indicated through vertical lightgray lines
each heptad. Default=FALSE}

\item{annotate}{logical indicating whether annotation information should
be shown in the center of the plot; Default=FALSE}

\item{markOffset}{logical indicating whether the start positions in the
sequences according to the assigned offset elmement metadata values should
be shown near the sequence characters; for the upper sequence the first
position is marked by \code{"^"} below the respective character, for the
lower sequence it is marked by \code{"v"} above the sequence. If no offset
element metadata is assigned to the sequences the marks are suppressed.
Default=TRUE}

\item{windowSize}{length of sliding window. When the parameter is set to
the default value 1 the contributions of each position are plotted
as step function. For kernels with multiple patterns at one position
(mismatch, gappy pair and motif kernel) the weight contributions of all
patterns at the position are summed up. Values larger than 1 define the
length of a sliding window. All contributions within the window are
averaged and the resulting value is displayed at the center position of
the window. For positions within half of the window size from the start
and end of the sequence the averaging cannot be performed over the full
window but just the remaining positions. This means that the variation
of the averaged weight contributions is higher in these border regions.
If an even value is specified for this parameter one is added to the
parameter value. When the parameter is set to \code{Inf} (infinite)
instead of averages cumulative values along the sequence are used, i.e.
at each position the sum of all contributions up to this position is
displayed. In this case the plot shows how the standardized or
unstandardized value (see parameter \code{standardize}) of the
discrimination function builds up along the sequence. Default=1}

\item{...}{all other arguments are passed to the standard
\code{\link[graphics:plot]{plot}} command that is called internally to
display the graphics window.}

\item{lwd}{see \code{\link[graphics:par]{par}}}

\item{aucDigits}{number of decimal places of AUC to be printed into
the ROC plot. If this parameter is set to 0 the AUC will not be added to
the plot. Default=3}

\item{cex}{see \code{\link[graphics:mtext]{mtext}}}

\item{side}{see \code{\link[graphics:mtext]{mtext}}}

\item{line}{see \code{\link[graphics:mtext]{mtext}}}

\item{adj}{see \code{\link[graphics:mtext]{mtext}}}
}
\value{
see details above
}
\description{
Functions for visualizing prediction profiles,
cross validation result, grid search performance parameters and
receiver operating characteristics
}
\details{
Plotting of Prediction Profiles\cr\cr
The first variant of the \code{plot} method mentioned in the usage section
displays one or two prediction profiles as a step
function with the steps connected by vertical lines. The parameter
\code{sel} allows to select the sample(s) if the prediction profile object
contains the profiles of more than two samples. The alignment of the
step functions is impacted by offset metadata assigned to the sequences.
When offset values are assigned one sequence if shifted horizontally to
align the start position 1 pointed to by the offset value for each sequence.
(see also parameter \code{markOffset}). If no offset metadata is available
for the sequences both step functions start at their first position on the
left side of the plot. The vertical plot range can be determined by the
\code{rng} argument. If the plot is generated for one profile, the sequence
is is visualized above the plot, for two sequences the first sequence is
shown above, the second sequence below the plot. Matching characters at a
position are shown in the same color (by default in \code{"black"}, the
non-matching characters in the sample-specific colors (see parameter
\code{col}). Annotation information can also be visualized along with the
step function. A call with two prediction profiles should facilitate the
comparison of profiles (e.g. wild type versus mutated sequence).

The baseline for the step function of a single sample represents the offset
b of the model distributed equally to all sequence positions according to
the following reformulation of the discriminant function


\deqn{f(\vec{x}) = b + \sum_{i=1}^L(s_i(\vec{x})) = \sum_{i=1}^L(s_i(\vec{x})
- \frac{-b}{L})}{f(x) = b + sum(si(x)) = sum(si(x) -(-b/L))
  for i = 1, ... L}


For standardized plots (see parameter \code{standardize} this baseline value
is subtracted from the weight contribution at each position. When sequences
of different length are plotted together only a standardized plot gives
compareable y ranges for both step functions. For sequences of equal length
the visualization can be done in non-standardized or standardized form
showing the lightgray horizontal baseline at positon \eqn{y=-b/L} or at
\eqn{y=0}. If the area between the step function and the baseline lying
above the baseline is larger than the area below the baseline the sample
is predicted as belonging to the class assciated with positive values
of the discrimination function, otherwise to the opposite class. (For
multiclass problems prediction profiles can only be generated from the
feature weights related to one of the classifiers in the pairwise or
one-against-rest approaches leaving only two classes for the profile
plot.)

When plotting to a pdf it is recommended to use a height to width ratio
of around 1:(max sequence length/25), e.g. for a maximum sequence length
of 500 bases or amino acids select height=10 and width=200 when opening the
pdf document for plotting.\cr\cr

Plotting of CrossValidation Result\cr\cr
The second variant of \code{plot} method shown in the usage section
displays the cross validation result as boxplot.

Plotting of Grid Performance Values\cr\cr
The third variant of \code{plot} method shown in the usage section
plots grid performance data as grid with the color of each rectange
corresponding to the preformance value of the grid point.

Plotting of Receiver Operating Characteristics (ROC)\cr\cr
The fourth variant of \code{plot} method shown in the usage section
plots the receiver operating characteristics for the given ROC data.
}
\examples{
## set seed for random generator, included here only to make results
## reproducable for this example
set.seed(456)
## load transcription factor binding site data
data(TFBS)
enhancerFB
## select 70\% of the samples for training and the rest for test
train <- sample(1:length(enhancerFB), length(enhancerFB) * 0.7)
test <- c(1:length(enhancerFB))[-train]
## create the kernel object for gappy pair kernel with normalization
gappy <- gappyPairKernel(k=1, m=3)
## show details of kernel object
gappy

## run training with explicit representation
model <- kbsvm(x=enhancerFB[train], y=yFB[train], kernel=gappy,
               pkg="LiblineaR", svm="C-svc", cost=80, explicit="yes",
               featureWeights="yes")

## compute and plot ROC for test sequences
preddec <- predict(model, enhancerFB[test], predictionType="decision")
rocdata <- computeROCandAUC(preddec, yFB[test], allLabels=unique(yFB))
plot(rocdata)

## generate prediction profile for the first three test sequences
predProf <- getPredictionProfile(enhancerFB, gappy, featureWeights(model),
                                 modelOffset(model), sel=test[1:3])

## show prediction profiles
predProf

## plot prediction profile to pdf
## As sequences are usually very long select a ratio of height to width
## for the pdf which takes care of the maximum sequence length which is
## plotted. Only single or pairs of prediction profiles can be plotted.
## Plot profile for window size 1 (default) and 50. Load package Biobase
## for openPDF
\dontrun{
library(Biobase)
pdf(file="PredictionProfile1_w1.pdf", height=10, width=200)
plot(predProf, sel=c(1,3))
dev.off()
openPDF("PredictionProfile1_w1.pdf")
pdf(file="PredictionProfile1_w50.pdf", height=10, width=200)
plot(predProf, sel=c(1,3), windowSize=50)
dev.off()
openPDF("PredictionProfile1_w50.pdf")
pdf(file="PredictionProfile2_w1.pdf", height=10, width=200)
plot(predProf, sel=c(2,3))
dev.off()
openPDF("PredictionProfile2_w1.pdf")
pdf(file="PredictionProfile2_w50.pdf", height=10, width=200)
plot(predProf, sel=c(2,3), windowSize=50)
dev.off()
openPDF("PredictionProfile2_w50.pdf")
}
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
\seealso{
\code{\link{getPredictionProfile}},
\code{\link{positionDependentKernel}}, \code{\link{mcols}},
\code{\link{spectrumKernel}}, \code{\link{mismatchKernel}},
\code{\link{gappyPairKernel}}, \code{\link{motifKernel}}
}
\keyword{methods}
\keyword{plot}
\keyword{prediction}
\keyword{profile}

