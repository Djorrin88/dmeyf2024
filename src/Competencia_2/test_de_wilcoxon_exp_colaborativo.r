



ganancia_base <- c(103796829.085457,106058444.777611,104352788.605697 ,101662731.634183 ,102678098.950525 ,104395561.71914 , , , , )
ganancia_exp1 <- c(, , , , , , , , , )
ganancia_exp2 <- c(, , , , , , , , , )
ganancia_exp3 <- c(, , , , , , , , , )
ganancia_exp4 <- c(, , , , , , , , , )

test_exp1 <- wilcox.test(ganancia_base, ganancia_exp1, paired = TRUE)
test_exp2 <- wilcox.test(ganancia_base, ganancia_exp2, paired = TRUE)
test_exp3 <- wilcox.test(ganancia_base, ganancia_exp3, paired = TRUE)
test_exp4 <- wilcox.test(ganancia_base, ganancia_exp4, paired = TRUE)

print(test_exp1)
print(test_exp2)
print(test_exp3)
print(test_exp4)



# 12 ganancias
wilcox.test( 
  c(112723333, 140046667, 125393333, 125300000, 111626667, 125976667, 128473333, 110903333,  96413333, 108990000, 112373333, 111766667),
  c(107403333, 117133333, 125650000, 112630000, 108243333, 118790000, 122266667, 105863333, 109970000, 110016667,  95760000,  95176667),
  paired = TRUE
)

