require("rlang")
require("yaml")
require("data.table")



# Establezco el Working Directory

# Establezco el Working Directory
setwd('/home/maestria_uba_jorrin/buckets/b1/datasets/')

# leo el dataset
dataset <- read.csv(gzfile("competencia_02.csv.gz"))

# Sample dataset
set.seed(123)

data_08 <- dataset  # Using the first 4 columns of the iris dataset as an example
target <- iris$Species

# New vector to calculate proximity with
new_vector <- data.frame(Sepal.Length = 5.1, Sepal.Width = 3.5, Petal.Length = 1.4, Petal.Width = 0.2)

# Append the new vector to the original dataset
data_combined <- rbind(data, new_vector)

# Train the random forest model with proximity enabled
rf_model <- randomForest(data_combined, y = c(target, NA), proximity = TRUE)

# Extract the proximity matrix
proximity_matrix <- rf_model$proximity

# Retrieve proximities between the new vector and the rest of the dataset
new_vector_proximity <- proximity_matrix[nrow(proximity_matrix), -nrow(proximity_matrix)]
new_vector_proximity




fwrite( dataset,
        file =  "competencia_02.csv",
        sep = ","
)

write.csv(dataset, file=gzfile("competencia_02.csv.gz"))

