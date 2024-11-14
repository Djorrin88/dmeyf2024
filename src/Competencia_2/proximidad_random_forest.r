require("rlang")
require("yaml")
require("data.table")
# Cargar la biblioteca necesaria
library(randomForest)



# Establezco el Working Directory

# Establezco el Working Directory
setwd('/home/maestria_uba_jorrin/buckets/b1/datasets/')

# leo el dataset
dataset <- read.csv(gzfile("competencia_02.csv.gz"))

# Sample dataset
set.seed(123)

data_08 <- dataset[dataset$foto_mes == "202108", ]  # Using the first 4 columns of the iris dataset as an example

data_07 <- dataset[dataset$foto_mes == "202107", ] 

data_08$clase_ternaria <- NULL 
data_08_fix <-na.roughfix(data_08)

data_07$clase_ternaria <- NULL 

# New vector to calculate proximity with
data_07[data_07$X ==4405000,]

# Entrenar el modelo Random Forest en modo no supervisado con proximidad activada
set.seed(123)
rf_model <- randomForest(data_08, proximity = TRUE, ntree = 500, na.action = na.roughfix)

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
