
library(data.table)

# Leer el archivo rápidamente
gan_base <- fread("/home/jorrin/Escritorio/Maestria DC/UBA_DMEyF_2024/dmeyf2024/src/Competencia_2/Ganancias/BASE_exp_col.txt")
gan_exp1 <- fread("/home/jorrin/Escritorio/Maestria DC/UBA_DMEyF_2024/dmeyf2024/src/Competencia_2/Ganancias/EXP1_exp_col.txt")
gan_exp2 <- fread("/home/jorrin/Escritorio/Maestria DC/UBA_DMEyF_2024/dmeyf2024/src/Competencia_2/Ganancias/EXP2_exp_col.txt")
gan_exp4 <- fread("/home/jorrin/Escritorio/Maestria DC/UBA_DMEyF_2024/dmeyf2024/src/Competencia_2/Ganancias/EXP4_exp_col.txt")
gan_exp5 <- fread("/home/jorrin/Escritorio/Maestria DC/UBA_DMEyF_2024/dmeyf2024/src/Competencia_2/Ganancias/EXP5_exp_col.txt")
gan_exp6 <- fread("/home/jorrin/Escritorio/Maestria DC/UBA_DMEyF_2024/dmeyf2024/src/Competencia_2/Ganancias/EXP6_exp_col.txt")
gan_exp7 <- fread("/home/jorrin/Escritorio/Maestria DC/UBA_DMEyF_2024/dmeyf2024/src/Competencia_2/Ganancias/EXP7_exp_col.txt")


# base
gan_base[, promedio_m_base := rowMeans(.SD, na.rm = TRUE), .SDcols = patterns("^m")]
resultado_base <- gan_base[promedio_m_base == max(promedio_m_base)]
ganancia_base <- unlist(gan_base[promedio_m_base == max(promedio_m_base), .SD, .SDcols = patterns("^m")], use.names = FALSE)
ganancia_base
# exp1
gan_exp1[, promedio_m_exp1 := rowMeans(.SD, na.rm = TRUE), .SDcols = patterns("^m")]
resultado_exp1 <- gan_exp1[promedio_m_exp1 == max(promedio_m_exp1)]
ganancia_exp1 <- unlist(gan_exp1[promedio_m_exp1 == max(promedio_m_exp1), .SD, .SDcols = patterns("^m")], use.names = FALSE)
# exp2
gan_exp2[, promedio_m_exp2 := rowMeans(.SD, na.rm = TRUE), .SDcols = patterns("^m")]
resultado_exp2 <- gan_exp2[promedio_m_exp2 == max(promedio_m_exp2)]
ganancia_exp2 <- unlist(gan_exp2[promedio_m_exp2 == max(promedio_m_exp2), .SD, .SDcols = patterns("^m")], use.names = FALSE)
# exp1
gan_exp4[, promedio_m_exp4 := rowMeans(.SD, na.rm = TRUE), .SDcols = patterns("^m")]
resultado_exp4 <- gan_exp4[promedio_m_exp4 == max(promedio_m_exp4)]
ganancia_exp4 <- unlist(gan_exp4[promedio_m_exp4 == max(promedio_m_exp4), .SD, .SDcols = patterns("^m")], use.names = FALSE)
# exp5
gan_exp5[, promedio_m_exp5 := rowMeans(.SD, na.rm = TRUE), .SDcols = patterns("^m")]
resultado_exp5 <- gan_exp5[promedio_m_exp5 == max(promedio_m_exp5)]
ganancia_exp5 <- unlist(gan_exp5[promedio_m_exp5 == max(promedio_m_exp5), .SD, .SDcols = patterns("^m")], use.names = FALSE)
# exp6
gan_exp6[, promedio_m_exp6 := rowMeans(.SD, na.rm = TRUE), .SDcols = patterns("^m")]
resultado_exp6 <- gan_exp6[promedio_m_exp6 == max(promedio_m_exp6)]
ganancia_exp6 <- unlist(gan_exp6[promedio_m_exp6 == max(promedio_m_exp6), .SD, .SDcols = patterns("^m")], use.names = FALSE)

# exp7
gan_exp7[, promedio_m_exp7 := rowMeans(.SD, na.rm = TRUE), .SDcols = patterns("^m")]
resultado_exp7 <- gan_exp7[promedio_m_exp7 == max(promedio_m_exp7)]
ganancia_exp7 <- unlist(gan_exp7[promedio_m_exp7 == max(promedio_m_exp7), .SD, .SDcols = patterns("^m")], use.names = FALSE)





# Crear 4 conjuntos de datos de ejemplo
set.seed(123)
data1 <- rnorm(50, mean = 5, sd = 2)  # Conjunto 1
data2 <- rnorm(50, mean = 6, sd = 1.5)  # Conjunto 2
data3 <- rnorm(50, mean = 7, sd = 2.5)  # Conjunto 3
data4 <- rnorm(50, mean = 8, sd = 1)  # Conjunto 4

# Crear un boxplot para los 4 conjuntos
boxplot(ganancia_base, ganancia_exp1, ganancia_exp2, ganancia_exp4,ganancia_exp5,ganancia_exp6,ganancia_exp7, 
        names = c("Base", "Exp 1", "Exp 2", "Exp 3","Exp 4","Exp 5","Exp 6"),
        main = "Boxplots de las ganancias del modelos base y los experimentos",
        ylab = "Ganancia",
        col = c("skyblue", "orange", "lightgreen", "pink")
        )

#BASE con EXP1

resultados_base_exp1 <- lapply(1:10, function(n) {
  sub_base <- ganancia_base[1:n]
  sub_exp1 <- ganancia_exp1[1:n]
  test <- wilcox.test(sub_base, sub_exp1, paired = TRUE)
  list(
    n = n,
    p_value = test$p.value,
    statistic = test$statistic
  )
})
resultados_base_exp1


#BASE con EXP4

resultados_base_exp5 <- lapply(1:10, function(n) {
  sub_base <- ganancia_base[1:n]
  sub_exp5 <- ganancia_exp5[1:n]
  test <- wilcox.test(sub_base, sub_exp5, paired = TRUE)
  list(
    n = n,
    p_value = test$p.value,
    statistic = test$statistic
  )
})
resultados_base_exp5