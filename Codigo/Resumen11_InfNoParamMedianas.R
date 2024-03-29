#INFERENCIA NO PARAM�TRICA CON MEDIANAS
#Se usa cuando los datos no se ajustan a una distribucion conocida.
#Alternativas no parametrica para t-student y anova (1 y 2 medias)
#Pruebas simples ---llegar y aplicar.

# PRUEBAS PARA UNA O DOS MUESTRAS:
#Condiciones:
#Prueba t-student para 1 muestra o 2 muestras pareadas:
  #1. Las observaciones no son independientes entre s�.
  #2. Las observaciones provienen de una distribuci�n no cercana a la normal.
#Prueba t-student para 2 muestras independientes:
  #1. Cada muestra no cumple las condiciones para usar la distribuci�n t.
  #2. Las muestras no son independientes entre s�.
#Adem�s la medicion de las muestras debe ser de intervalos iguales.

#1.-  Prueba de suma de rangos de Wilcoxon: muestras independientes:-----------------
#Condiciones:
#1. Las observaciones de ambas muestras son independientes.
#2. La escala de medici�n empleada debe ser a lo menos ordinal,
#de modo que tenga sentido hablar de relaciones de orden 
#("igual que", "menor que", "mayor o igual que"). Escala likert

#Hipotesis:
#H0: no hay diferencia en la usabilidad de ambas interfaces (se distribuyen de igual forma).
#HA: s� hay diferencia en la usabilidad de ambas interfaces (distribuciones distintas).

#Funciones:
#la funci�n wilcox.test(x, y, paired = FALSE, alternative, mu, conf.level), donde:
  #x, y: vectores num�ricos con las observaciones. Para aplicar la prueba con una 
  #�nica muestra, y debe ser nulo (por defecto, lo es).
  #paired: booleano con valor falso para indicar que las muestras son independientes (se asume por defecto).
  #alternative: se�ala el tipo de hip�tesis alternativa: bilateral ("two.sided") o unilateral ("less" o "greater").
  #mu: valor nulo para la media (solo para la prueba con una muestra).
  #conf.level: nivel de confianza.

#2.- Prueba de rangos con signo de Wilcoxon: muestras pareadas -----------------
#Condiciones:
#1. Los pares de observaciones son independientes.
#2. La escala de medici�n empleada para las observaciones es intr�nsecamente continua.
#3. La escala de medici�n empleada para ambas muestras debe ser a lo menos ordinal.

#Hipoteses:
#H0: las mismas personas no perciben diferencia en la usabilidad de ambas interfaces.
#HA: las mismas personas consideran que la interfaz A tiene mejor usabilidad que la interfaz B.

#Funciones:
#Funcion wilcox.test(x, y, paired = TRUE, alternative, conf.level), donde:
  #x, y: vectores num�ricos con las observaciones.
  #paired: booleano con valor verdadero para indicar que las muestras son pareadas.
  # alternative: se�ala el tipo de hip�tesis alternativa: bilateral ("two.sided") o unilateral ("less" o "greater").
  #paired: indica si las muestras est�n o no pareadas.
  #conf.level: nivel de confianza

#PRUEBAS PARA M�S DE DOSo + MUESTRAS: 
#Los tama�os de las muestras son diferentes.
.
#1.-  Prueba de Kruskal-Wallis: muestras independiente -----------
#Condiciones:
#1. La variable independiente debe tener a lo menos dos niveles (aunque, para dos niveles, se suele usar la  prueba de Wilcoxon-Mann-Whitney).
#2. La escala de la variable dependiente debe ser, a lo menos, ordinal.
#3. Las observaciones son independientes entre s�.

#Hipotesis:
#H0: todos los algoritmos son igual de eficientes (o, de manera similar, ning�n algoritmo es menos ni m�s eficiente que los dem�s).
#HA: al menos uno de los algoritmos presenta una eficiencia diferente a al menos alg�n otro algoritmo.

#Funciones:
#Prueba de Kruskal-Wallis mediante la funci�n kruskal.test(formula, data), donde:
  #formula: tiene la forma <variable dependiente>??? <variable independiente (factor)>.
  #data: matriz de datos en formato largo.
#funci�n
# Post Hoc Funcion pairwise.wilcox.test(x, g, p.adjust.method, paired = FALSE), donde:
  #x: vector con la variable dependiente.
  #g: factor o agrupamiento.
  #p.adjust.method: puede ser "holm" o "bonferroni", entre otras alternativas.
  #paired: valor booleano que indica si la prueba es pareada (verdadero) o no. Para la prueba de KruskalWallis debe ser FALSE.

#1.-  Prueba de Friedman: muestras correlacionadas --------------
  #Condiciones:
  #1. La variable independiente debe ser categ�rica y tener a lo menos tres niveles.
  #2. La escala de la variable dependiente debe ser, a lo menos, ordinal.
  #3. Los sujetos son una muestra aleatoria e independiente de la poblaci�n.

#Hipotesis:
#H0: las interfaces tienen preferencias similares.
#HA: al menos una interfaz obtiene una preferencia distinta a las dem�s.

#Funciones:
#Funci�n friedman.test(formula, data), donde:
  #formula: tiene la forma <variable dependiente>??? <variable independiente>| <identificador de sujeto o bloque>.
  #data: matriz de datos en formato largo.
#Post-hoc pairwise.wilcox.test() paired=TRUE
