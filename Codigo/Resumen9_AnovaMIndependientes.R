library(dplyr)
library(tidyverse)

# ANOVA DE UNA V�A PARA MUESTRAS INDEPENDIENTES
#Como t-student pero para k>=3 --> Realiza un analisis de varianza.

#Ejemplo:
#�se diferencian los tiempos medios que requieren los
#algoritmos para resolver todas las posibles instancias del problema de tama�o E?

#Hipotesis no especificas:
#H0 : el tiempo de ejecuci�n promedio para instancias de tama�o E es igual para los tres algoritmos.
#HA : el tiempo de ejecuci�n promedio para instancias de tama�o E es diferente para al menos un algoritmo.

# nivel de significaci�n alfa
#Condiciones:
#1. La escala con que se mide la variable dependiente tiene las propiedades 
#de una escala de intervalos iguales.
#2. Las k muestras son obtenidas de manera aleatoria e independiente desde
#la(s) poblaci�n(es) de origen.
#3. Se puede suponer razonablemente que la(s) poblaci�n(es) de origen sigue(n)
#una distribuci�n normal.
#4. Las k muestras tienen varianzas aproximadamente iguales. 
#-->homogeneidad de las varianzas u homocedasticidad.
#--> (raz�n entre la m�xima y la m�nima varianza muestral de los grupos no sea superior a 1,5.)
#--->  ezANOVA() incluye prueba de homocedasticidad.

#Conclusion completa y correcta ejemplo:
#alfa = 0,025 y p < alfa, por lo que rechazamos la hip�tesis nula en favor de la hip�tesis alternativa.
#En consecuencia, podemos concluir con 97,5 % de confianza que el tiempo de ejecuci�n promedio es diferente
#para al menos uno de los algoritmos comparados.


#FUNCIONES:

#funci�n aov(formula, data), donde:
  #formula: se escribe de la forma variable_dependiente ~ variable_independiente.
  #data: data frame que contiene las variables especificadas en la f�rmula.

# funci�n ezANOVA(data, dv, wid, between, return_aov) del paquete ez, donde:
#data: data frame con los datos.
#dv: variable dependiente (num�rica con escala de igual intervalo).
#wid: variable (factor) con el identificador de cada instancia.
#between: variable independiente (factor).
#return_aov: si es verdadero, devuelve un objeto de tipo aov para uso posterior.
#--->Esta funcion realiza en su interior la prueba de homocedastisidad.
#------>H0:varianza de K muestras =

# AN�LISIS POST-HOC:
# 1.- Correcciones de Bonferroni y Holm:------------------
#funci�n pairwise.t.test(x, g, p.adjust.method, pool.sd, paired, alternative), donde:
  #x: vector con la variable dependiente.
  #g: factor o vector de agrupamiento.
  #p.adjust.method: (holm-bomferrini)se�ala qu� m�todo emplear para ajustar los valores p resultantes.
  #pool.sd: valor booleano que indica si se usa o no varianza combinada.
  #paired: valor booleano que indica si las pruebas t son pareadas (verdadero) o no.
  #alternative: indica si la prueba es bilateral ("two.sided") o unilateral ("greater" o "less").
#Evalua p-value tabla.
#Conclusion bien formada:
#los algoritmos B y C presentan una diferencia significativa al comparar el valor p ajustado que entrega R con el
#nivel de significaci�n (?? = 0, 025). Si miramos el gr�fico del tama�o del efecto obtenido para el procedimiento
#ANOVA (figura 9.2), podemos concluir entonces con 97,5 % de confianza que el algoritmo C es m�s r�pido
#que el algoritmo B.

# 2.- Prueba HSD de Tukey:--------------------------
#TukeyHSD(x, which, ordered, conf.level), donde:
  #x: un modelo ANOVA (objeto de tipo aov).
  #which: string con el nombre de la variable para la que se calculan las diferencias.
  #ordered: valor l�gico que, cuando es verdadero, hace que los grupos se ordenen de acuerdo a sus medias
  #a fin de obtener diferencias positivas.
  #conf.level: nivel de confianza.
#Evalua padj (p-valued) y diff(muestra diferencia de las medias)
