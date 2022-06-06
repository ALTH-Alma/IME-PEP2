#Trabsformacion de datos.
#Se aplica la transformada de datos problematicos y luego se aplican
#pruebas ´para datos que cumplan con las condiciones de normalidad.

#TRANSFORMACIONES:  
#Los datos no cumplen con normalidad pero si con tamaño de la mustra.

#1.- Transformación lineal:
#yi = m · xi + n ---> ejemplo la transformacion de temperatura de C° a F°.

#2.-  Transformación logarítmica: para datos muy asimetricos 
#- con una distribucion muy alejada de la normal.
#Solo se debe aplicar log() a cada uno de los conjuntos
#con los que se quiere trabajar.

#3.-  Escalera de potencias de Tukey:
#Cambiar distribucion asimetrica para acercarla a la normal.

#Funciones:
#función transformTukey(x, start, end, int, plotit, verbose, quiet, statistic, returnLambda), donde:
  #x: vector de valores a transformar.
  #start: valor inicial de ?? a evaluar.
  #end: valor final de ?? a evaluar.
  #int: intervalo entre los valores de ?? a evaluar.
  #plotit: si toma valor TRUE, entrega los siguientes gráficos:
  # Estadístico de la prueba de normalidad versus ??.
  # Histograma de los valores transformados.
  # Gráfico Q-Q de los valores transformados.
  #verbose: si toma valor TRUE, muestra información adicionar sobre la prueba de normalidad con respecto a ??.
  #quiet: si toma valor TRUE, no muestra información alguna por pantalla.
  #statistic: si toma valor 1, usa la prueba de normalidad de Shapiro-Wilk. Con valor 2, usa la prueba de Anderson-Darling.
  #returnLambda: si toma valor TRUE, devuelve el valor de ??. Si toma valor FALSE, devuelve los datos transformados.

#4.-  Transformaciones Box-Cox:

#Misma aplicacion que tukey.
#Funciones: paquete DescTools.
#BoxCoxLambda(x, lower, upper): devuelve el valor óptimo de ?? para la transformación Box-Cox del vector x.
#BoxCox(x, lambda): devuelve un vector correspondiente a la transformación Box-Cox de x con parámetro lambda.
#BoxCoxInv(x, lambda): revierte la transformación Box-Cox del vector x con parámetro lambda.
#Donde:
  #x: vector numérico.
  #lower: limite inferior para los posibles valores de ??.
  #upper: limite superior para los posibles valores de ??.
  #lambda: parámetro de la transformación.

#_____METODOS ROBUSTOS________________________ (WRS2)
#Muestras pequeñas con distribuciones asimetricas y datos atipicos.
#Casos similares a bootstraping pero solucion menos costosa.

#1.-  Prueba de Yuen para dos muestras independientes: 
#(t-student para tamaños muestrales muy dispares y varianzas muy diferentes)
#Usa media truncada:  mean(x,trim = 0.2) porporcion a descartar lamnda

#Funciones:
#Pruebas bilaterales......
#yuen(formula, data, tr) del paquete WRS2, donde:
#formula: tiene la forma <variable dependiente>???<variable independiente>. Note que la variable independiente debe tener dos niveles, a fin de determinar a qué muestra pertenece cada observación de la variable dependiente.
#data: matriz de datos.
#tr: parámetro ?? de la poda

#Pruebas unilaterales....
#yuen(formula, data, tr, nboot); mboot cantidad de muestras a obtener con bootstraping R
# simlar es  pb2gen(formula, data, est, nboot)---> pero ademas el para metro est permite escoger entre mean o median entre otras. 


#2.-  Prueba de Yuen para dos muestras pareadas:
# yuend(x, y, tr); x conjunto de datos1, y conjunto de datos 2.
#Analisando la diferencia estimada (ds). si x,y --> ds negativa x es mas eficiente 
  

#3.-  Comparaciones de una vía para múltiples grupos independientes:
#Se usa cuando se quiere aplicara anova pero los tamaños muestrales son muy diferentes
#o no se cumple la condicion de homocedasticidad. 

#Funciones usando anova usando medias truncadas:
#t1way(formula, data, tr, alpha) --> prueba
# lincon(formula, data, tr, alpha) --> analisis post-hoc.

#Funciones usando bootstraping usand medias truncadas:
#t1waybt(formula, data, tr, nboot) --> prueba
#mcppb20(formula, data, tr, nboot) --> analisis post-hoc


#4.-  Comparaciones de una vía para múltiples grupos correlacionados:
#Se usa cuando se quiere usar anova pero no se cumpla la condicion de esfericidad.

#Funciones usando anova usando medias truncadas:
# rmanova(y, groups, blocks, tr) --> prueba
# rmmcp(y, groups, blocks, tr, alpha)  --> analisis post-hoc.

#Funciones usando bootstraping usand medias truncadas:
#rmanovab(y, groups, blocks, tr, nboot) --> prueba
# pairdepb(y, groups, blocks, tr, nboot) --> analisis post-hoc

#formula: de la forma <variable dependiente>???<variable independiente>.
#y: vector con la variable dependiente.
#groups: vector que indica los grupos.
#blocks: vector que identifica los sujetos o bloques.
#tr: parámetro ?? de la poda.
#alpha: nivel de significación.
#nboot: cantidad de muestras a generar mediante bootstrapping.

