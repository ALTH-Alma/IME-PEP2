library(DescTools)
library(nlme)
# ANOVA DE UNA VÍA PARA MUESTRAS Correlacionadas
#Como t-student pero para k>=3 --> Realiza un analisis de varianza.

#Ejemplo:
#¿se diferencian las medias poblacionales?
#Hipotesis no especificas:
#H0: El tiempo de ejecución promedio es igual para los cuatro algoritmos.
#HA: El tiempo de ejecución promedio es diferente para al menos un algoritmo.

#Condiciones:
#1. La escala con que se mide la variable dependiente tiene las propiedades
#de una escala de intervalos iguales.
#2. Las mediciones son independientes al interior de cada grupo.
#3. Se puede suponer razonablemente que la(s) población(es) de origen sigue(n) una distribución normal.
#4. La matriz de varianzas-covarianzas es esférica. Como explica Horn (2008, p. 1), esta condición establece
#que las varianzas entre los diferentes niveles de las medidas repetidas deben ser iguales.
#--->  ezANOVA() incluye prueba de esfericidad de Mauchly.

#Gráfico del tamaño del efecto .
g2 <- ezPlot( data = datos , dv = tiempo , wid = instancia , within = algoritmo ,
                  y_lab = " Tiempo promedio de ejecución [ms]", x = algoritmo)
print(g2)

#Funciones:
#Las mismas que para muestras independientes, pero:
#  ezANOVA() usa within no between.
#---> Si no hay espeficidad utilizar p-value p(GG) para evaluar prueba

# PROCEDIMIENTOS POST-HOC:
#Turkey:
#--> primero crear modelo mixto:
#funcion lme(formula, data, random) del paquete nlme, donde:
  #formula: tiene la forma <variable dependiente>???<variable categórica>.
  #data: matriz de datos en formato largo.
  #random: fórmula de la forma ???1|<identificador del sujeto>.
#--> Luego estimar media de variable dependiente:
# función emmeans(object, specs) del paquete homónimo, donde:
  #object: modelo mixto construido en el paso previo.
  #specs: nombre del factor en estudio, delimitado por comillas.
#Apply turkey:
# función pairs(x, adjust), donde:
  #x: diferencias obtenidas en el párrafo precedente.
  #adjust: método para ajustar los valores p. "tukey" para el método HSD de Tukey, "scheffe" para el
  #método de Scheffé.
