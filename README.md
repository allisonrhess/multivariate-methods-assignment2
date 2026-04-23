# multivariate-methods-assignment2
Assignment 2

Q1:
The means of sepal length, sepal width, petal length, and petal width are highly similar across the training and testing sets. Specifically, the differences between corresponding variables are minimal (e.g., sepal length: 5.846 vs. 5.838; petal width: 1.193 vs. 1.213). This indicates that the data partition preserves the overall distribution of the original dataset. Minor differences are generally expected due to random sampling, but overall the two sets appear broadly similar and comparable.

 


Q2:
The highest hit rate is obtained using the manhattan distance metric combined with the complete linkage method, with a hit rate of approximately 0.895. This indicates that this combination provides the most correct clustering relative to the true/actual species classifications. Complete linkage tends to produce more compact and well-separated clusters, and when paired with the manhattan distance metric, it appears to better capture the structure of the iris dataset compared to the other combinations.
 

Q3:
 
 
3A
The results from the nbclust procedure suggest that the optimal number of clusters is three, as the majority of indices support this solution. This is consistent with the actual known structure of the iris dataset, which contains the three distinct species.

 

3B, 3C, 3D
After selecting the three clusters, k-means clustering was performed on the training dataset. The resulting cluster centers were then used to classify observations in the testing dataset.

The apparent error rate of the k-means clustering predictions is 0.111, indicating that approximately 11.1% of observations are misclassified. This suggests that the clustering model performs well in capturing the underlying structure of the data, despite being an unsupervised method

 

<img width="523" height="621" alt="image" src="https://github.com/user-attachments/assets/7d5dfd78-3620-4beb-9896-eda2c4cd279e" />
