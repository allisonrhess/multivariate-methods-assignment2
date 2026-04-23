library(caret)
install.packages("caret")
library(caret)

data("iris")
set.seed("02042026")
trainIndex = createDataPartition(iris$Species, p = .7, list = FALSE, times = 1)
trainset = iris[trainIndex,-5]
testset = iris[-trainIndex,-5]

#Q1#
# Training set means
colMeans(trainset)

# Testing set means
colMeans(testset)

# Rounding to 3 decinmals
round(colMeans(trainset), 3)
round(colMeans(testset), 3)

#Q2#
euclidean.train = dist(trainset,method = "euclidean")
manhattan.train = dist(trainset,method = "manhattan")

install.packages("dendextend")   
library(dendextend)

hclust_methods = c("ward.D", "single", "complete", "average")
euclidean_dendlist = dendlist()
manhattan_dendlist = dendlist()
for(i in seq_along(hclust_methods)) {
  # hierarchical clustering based on euclidean distance
  hc_euclidean = hclust(euclidean.train, method = hclust_methods[i])
  # chain the clustering results together
  euclidean_dendlist = dendlist(euclidean_dendlist, as.dendrogram(hc_euclidean))
  # hierarchical clustering based on manhattan distance
  hc_manhattan = hclust(manhattan.train, method = hclust_methods[i])
  # chain the clustering results together
  manhattan_dendlist = dendlist(manhattan_dendlist, as.dendrogram(hc_manhattan))
}

# Cut clusters
hc <- hclust(euclidean.train, method = "ward.D")
clusters <- cutree(hc, k = 3)

# Compareing
table(clusters, iris$Species[trainIndex])

# Computing hit rate
tab <- table(clusters, iris$Species[trainIndex])
correct <- sum(apply(tab, 1, max))
hit_rate <- correct / sum(tab)
hit_rate

# Looping
results <- data.frame()

for (dist_name in c("euclidean", "manhattan")) {
  d <- if (dist_name == "euclidean") euclidean.train else manhattan.train
  
  for (method in c("ward.D", "single", "complete", "average")) {
    hc <- hclust(d, method = method)
    clusters <- cutree(hc, k = 3)
    
    tab <- table(clusters, iris$Species[trainIndex])
    correct <- sum(apply(tab, 1, max))
    hit_rate <- correct / sum(tab)
    
    results <- rbind(results,
                     data.frame(distance = dist_name,
                                linkage = method,
                                hit_rate = hit_rate))
  }
}

results

#Q3#

#3A#
library(NbClust)

nb <- NbClust(trainset,
              distance = "euclidean",
              method = "ward.D")

#3B#
set.seed(123)
kmeans_train <- kmeans(trainset, centers = 3)

#3C#
kmeans_test <- kmeans(testset,
                      centers = kmeans_train$centers,
                      iter.max = 1)

#3D#
tab <- table(kmeans_test$cluster, iris$Species[-trainIndex])

correct <- sum(apply(tab, 1, max))
accuracy <- correct / sum(tab)

error_rate <- 1 - accuracy
error_rate

