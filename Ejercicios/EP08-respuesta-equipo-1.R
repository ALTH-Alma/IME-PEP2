library(dplyr)
library(ggpubr)
library(tidyverse)
library(ez)

data <- read.csv2("C:\\Users\\Alma\\Documents\\EP08 Datos.csv")

facil <- data%>%filter(dificultad == "Baja")

#Se trabajará con un nivel significación igual 0.05
alfa <- 0.05

#Se trabajará con la prueba ANOVA para 3 o más muestras independientes

computacion <- facil%>%filter(area == "Computaci�n")
computacion <- computacion[["tiempo"]]
literatura <- facil%>%filter(area == "Literatura")
literatura <- literatura[["tiempo"]]
quimica <- facil%>%filter(area == "Qu�mica")
quimica <- quimica[["tiempo"]]

datos <- data.frame(computacion,literatura, quimica)
datos <- datos%>%pivot_longer(c("computacion", "literatura", "quimica"),
                              names_to = "Area",
                              values_to = "Tiempo")

datos[["Area"]] <- factor(datos[["Area"]])
datos[["instancia"]] <- factor(1:nrow(datos))

#La variable dependiente es el tiempo y cumple con las propiedades de una escala de intervalos iguales

#Los datos fueron obtenidos de manera aleatoria y son mutuamente excluyentes, por lo tanto son independientes

#Comprobación de normalidad, utilizando la prueba de Shapiro a cada muestra

shap_computacion <- shapiro.test(computacion)$p.value
#p-valor = 0.34

shap_literatura <- shapiro.test(literatura)$p.value
#p-valor = 0.51

shap_quimica <- shapiro.test(quimica)$p.value
#p-valor = 0.53

#Como los 3 p-valores son mayores a alfa, entonces se cumple con la normalidad

#Se definen las hipótesis nula y alternativa
#H0: El tiempo que tardan los usuarios en formular una consulta para un problema 
#    de dificultad fácil en las áreas de computación, literatura y química, es igual.
#HA: El tiempo que tardan los usuarios en formular una consulta para un problema 
#    de dificultad fácil en las áreas de computación, literatura y química, es diferente para al menos una.


prueba <- ezANOVA(
  data = datos,
  dv = Tiempo,
  between = Area,
  wid = instancia,
  return_aov = TRUE
)

print(prueba)
#p-valor = 8.23e-07

#Como p-valor < alfa, se rechaza la hipótesis nula en favor de la hipótesis 
#alternativa, por lo que, se hace necesario aplicar la prueba post hoc

post_hoc <- TukeyHSD(prueba$aov,
                     "Area",
                     ordered = TRUE,
                     conf.level = 1-alfa)

print(post_hoc)

#Gracias a la prueba post hoc HSD de Tukey, es posible determinar que las 
#diferencias más significativas están entre las áreas computación-química 
#(p-valor = 0.0004 < alfa) y las áreas literatura-química (p-valor = 0.0000010 < alfa)

#En conclusión, el tiempo que tardan los usuarios en formular una consulta para un problema 
#de dificultad fácil es diferente, específicamente entre las áreas computación-química
#y literatura-química