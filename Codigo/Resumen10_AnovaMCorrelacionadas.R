library(DescTools)
library(nlme)
# ANOVA DE UNA V�A PARA MUESTRAS Correlacionadas
#Como t-student pero para k>=3 --> Realiza un analisis de varianza.

#Ejemplo:
#�se diferencian las medias poblacionales?
#Hipotesis no especificas:
#H0: El tiempo de ejecuci�n promedio es igual para los cuatro algoritmos.
#HA: El tiempo de ejecuci�n promedio es diferente para al menos un algoritmo.

#Condiciones:
#1. La escala con que se mide la variable dependiente tiene las propiedades
#de una escala de intervalos iguales.
#2. Las mediciones son independientes al interior de cada grupo.
#3. Se puede suponer razonablemente que la(s) poblaci�n(es) de origen sigue(n) una distribuci�n normal.
#4. La matriz de varianzas-covarianzas es esf�rica. Como explica Horn (2008, p. 1), esta condici�n establece
#que las varianzas entre los diferentes niveles de las medidas repetidas deben ser iguales.
#--->  ezANOVA() incluye prueba de esfericidad de Mauchly.

#Gr�fico del tama�o del efecto .
g2 <- ezPlot( data = datos , dv = tiempo , wid = instancia , within = algoritmo ,
                  y_lab = " Tiempo promedio de ejecuci�n [ms]", x = algoritmo)
print(g2)

#Funciones:
#Las mismas que para muestras independientes, pero:
#  ezANOVA() usa within no between.
#---> Si no hay espeficidad utilizar p-value p(GG) para evaluar prueba

# PROCEDIMIENTOS POST-HOC:
#Turkey:
#--> primero crear modelo mixto:
#funcion lme(formula, data, random) del paquete nlme, donde:
  #formula: tiene la forma <variable dependiente>???<variable categ�rica>.
  #data: matriz de datos en formato largo.
  #random: f�rmula de la forma ???1|<identificador del sujeto>.
#--> Luego estimar media de variable dependiente:
# funci�n emmeans(object, specs) del paquete hom�nimo, donde:
  #object: modelo mixto construido en el paso previo.
  #specs: nombre del factor en estudio, delimitado por comillas.
#Apply turkey:
# funci�n pairs(x, adjust), donde:
  #x: diferencias obtenidas en el p�rrafo precedente.
  #adjust: m�todo para ajustar los valores p. "tukey" para el m�todo HSD de Tukey, "scheffe" para el
  #m�todo de Scheff�.
