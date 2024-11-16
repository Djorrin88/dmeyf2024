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


# Vector a mapear

# Definir el "diccionario" como un vector nombrado
mapping <- c("a" = 1, "b" = 2, "c" = 3, "d" = 4)

# Aplicar el mapeo usando el vector nombrado
mapped_vec <- mapping[vec]
print(mapped_vec)




data_08 <- dataset[dataset$foto_mes == "202108", ]  # Using the first 4 columns of the iris dataset as an example

data_07 <- dataset[dataset$foto_mes == "202107", ] 

data_08$clase_ternaria <- NULL 
data_08_fix <-na.roughfix(data_08)

data_07$clase_ternaria <- NULL 
data_07_fix <-na.roughfix(data_07)

# New vector to calculate proximity with
registro_prueba <- data_07_fix [data_07_fix $X ==4405000,]

# Entrenar el modelo Random Forest en modo no supervisado con proximidad activada
set.seed(123)
rf_model <- randomForest(data_08_fix, proximity = TRUE, ntree = 500)

# Guardar el modelo en un archivo .RData
save(rf_model, file = "random_forest_model.RData")

# Obtener los nodos hoja para cada observación en el conjunto de datos
leaf_indices_data <- predict(rf_model, data, nodes = TRUE)


# Obtener los nodos hoja para el nuevo vector
leaf_indices_new_vector <- predict(rf_model, registro_prueba, nodes = TRUE)

# Calcular la proximidad (1 - distancia Hamming) entre el nuevo vector y cada observación en el conjunto de datos
proximities <- rowMeans(leaf_indices_data == leaf_indices_new_vector)

# Mostrar las proximidades y el promedio de proximidad
print("Proximidades al nuevo vector:")
print(proximities)
average_proximity <- mean(proximities)
print("Proximidad promedio:")
print(average_proximity)


