#LDA 
install.packages(c("RTextTools","topicmodels"))
library(RTextTools)
library(topicmodels)
library(tm)

#example data from NYtimes
#http://www.rtexttools.com/blog/getting-started-with-latent-dirichlet-allocation-using-rtexttools-topicmodels
data("NYTimes")
data <- NYTimes[sample(1:3100, size = 1000, replace = FALSE),]
#create a DocumentTermMatrix
##removing numbers, stemming words, and weighting the DocumentTermMatrix by term frequency
matrix <- create_matrix(cbind(as.vector(data$Title), as.vector(data$Subject)), language = "english",
                        removeNumbers = TRUE, stemWords = TRUE, weighting = weightTf)
#perform LDA
##determine the number of topics of our data
k <- length(unique(data$Topic.Code))
lda <- LDA(matrix,k)

#view the results
terms(lda)
topics(lda)
