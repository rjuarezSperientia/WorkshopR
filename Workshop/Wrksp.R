# R es una de las herramientas más utilizadas para el análisis estadístico 
# y es utilizado para manipular información de manera virtual tanto en la 
#academia como en la industria.

# ¿Cómo funciona?
# 
# R lee la data (por ejemplo, desde un archivo de texto o una hoja de Excel) 
# y crea una imagen de esos datos que se almacena en la memoria temporal. Es 
# decir, R SIEMPRE manipula imágenes de la información NUNCA la información 
# original. Esto permite que se pueda editar, borrar, generar nueva información
# sin comprometer la información original --> Reduce pérdida de información.
# Esta nueva información (o los datos manipulados) pueden almacenarse en 
# archivos permanentes :) A esto se le conoce como "Edición no-destructiva" y 
# quienes han tenido el infortunio de manjear (y borrar) bases de datos o
# generar n-mil pestañas en Excel pueden apreciar las bondades de esto.

# Adicionalmente, R-Studio ofrece el uso de archivos llamados "srcipts" 
# (como este) para facilitar la programación y tener un histórico sobre toda la
# manipulación sobre los datos (muy útil para analizar o compartir el proceso).

# Lo que veremos en este workshop es una breve introducción a R-Studio, a las
# cheatsheets, instalación de paquetes, carga de librerías, estructuras de datos
# importación y manipulación de datos.

# =====================================================================
 #1.- La interfaz, wrap de código y guardar archivos
# =====================================================================

# Al abrir R-Studio por default se muestra, en el lado izquierdo de la pantalla
# la terminal y la consola donde se pueden escribir las funciones de manera 
# directa. Cuando abrimos un archivo (como este), la configuración cambia y la
# consola pasa a la parte inferior, mientras que el editor del archivo queda 
# en la parte superior. 
# 
# En la parte superior derecha, se encuentra la secciónde "Ambiente"
# ("Environment") que muestra los objetos, estructuras y variables que se 
# generan.
# 
# En la parte inferior derecha se encuentra un pánel muy importante pues 
# contiene los archivos, gráficas que se generan, paquetes instalados, la
# sección de ayuda y el visor de contenido web local o web-based graphics 
# (perdón por el spanglish pero no encontré una traducción apropiada).
# 
# Antes de empezar vamos a habilitar una función, llamada soft-wrap,
# que facilita la lectura. Para hacerlo, seleccionamos la opción de 
# "Tools"/"Herramientas" >> "Global Options"/"Opciones Globales" >> "Code"/
#Código">> "Soft-wrap R source files".
# Esto genera que las líneas de código se ajusten al tamaño de la ventana del
#editor de texto y que se generen saltos de línea automáticamente.

# Para generar, abrir y guardar archivos en la esquina superior izquierda se
# encuentran los accesos rápidos.

# =====================================================================
#2.- Nuestras primeras líneas de código: Instalando y cargando paquetes
# =====================================================================

# Casi toda la programación sobre R requiere de la instalación de ciertos 
# paquetes con funcionalidad muy particular. Los paquetes pueden verse como
# funcionalidad que alguien más ya programó y encapsuló para que todos los
# demás solo utilicemos. Por ejemplo, el paquete ggplot2 contiene diversas 
# funciones para generar y visualizar gráficas. Nosotros podríamos codificar
# las funciones necesarias para gráficar peeeero si alguien más ya lo hizo
# podemos ahorrarnos el esfuerzo y el tiempo y dedicarnos a otras cosas.
# 
# Para instalar los paquetes utilizaremos la función "install.packages()". 
# Instalaremos los paquetes:
  
  # · tidyr --> Organizar y limpiar datos
  # · dplyr --> Organizar y limpiar datos
  # · tibble --> Organizar y limpiar datos
  # · RColorBrewer --> Visualizar y manipular gráficas
  # · ggplot2  --> Visualizar y manipular gráficas
  # · lubridate --> Manejo de fechas

install.packages('tidyr')
#   
# Para correr el código puedes seleccionar la línea o las líneas que quieras
# ejecutar y teclear Command/Control + Enter. Podrás observar que en la
# ventana de "Consola" aparecen las líneas que seleccionaste y su mensaje de
# resultado. 
# 
# Para continuar, instalaremos los paquetes faltantes.

install.packages('tibble')
install.packages('RColorBrewer')
install.packages('ggplot2')
install.packages('lubridate')

# Una vez instalados podemos verlos en la pestaña de "Packages"/"Paquetes". Para
# usarlos es necesario cargarlos en la sesión. Para eso utilizamos el comando
# "library()".

library('tidyr')


# Carguemos el resto de los paquetes.

 library('tidyr')
 library('dplyr')
 library('RColorBrewer')
 library('ggplot2')
 library('lubridate')

# =====================================================================
# 3.- Encontrando ayuda
# =====================================================================

# La forma más rápida de encontrar ayida en R es seleccionar la pestaña de 
# "Ayuda" en la ventana inferior derecha y usar el buscador que ahí aparece. 
# Sin embargo, la documentación de algunos paquetes es pobre por lo que 
# se debe recurrir a internet :( Exiten varios cheatsheets que ayudan a usar R
# entre los que destacan:

# data import: 
# https://evoldyn.gitlab.io/evomics-2018/ref-sheets/R_data-import.pdf
# data transformation: 
# https://4.files.edl.io/b9e2/07/12/19/142839-a23788fb-1d3a-4665-9dc4-33bfd442c296.pdf
# data visualization with ggplot2: 
# https://rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf
  
  # =====================================================================
# 4.- Importar datos
# =====================================================================

# ---------------------------------------------------------------------
# El directorio de trabajo
# ---------------------------------------------------------------------

# Definir un directorio de trabajo facilita importar datos existentes pues 
# centraliza la administración de archivos. Cuando se solicita a R que importe
# (lea) o exporte (escriba) un archivo este, automáticamnte, busca el directorio
# para que sea necesario escribir en dónde queremos ubicar el archivo.
# 
# Para obtener el directorio que se está utilizando se usa el comando "getwd()"
# 
 getwd()
# 
# La forma más fácil de cambiar el directorio es navegar hace el directorio
# deseado, usando la pestaña de "Archivos" desde la ventana inferior derecha y,
# una vez posicionados dentro del archivo, seleccionar el engrane con el texto
# "More" y seleccionar la opción "Set as working directory".
# 
# NOTA: También se puede usar el comando "setwd()" escribiendo el path completo
# o utilizando el caracter "~" para apuntar al directorio actual. 

# El siguiente paso es establecer el directorio de trabajo

# ---------------------------------------------------------------------
# Importar datos
# ---------------------------------------------------------------------
# 
# Para trabajar en R es necesario importar datos, ya sean propios o datos 
# públicos que pueden descargarse de Internet. Para la sesión probaremos los 
# dos métodos. 
# 
# Primero cargaremos datos poblacionales desde una hoja de Excel (guardada) en
# un archivo CSV (Valores Separados por Comas), después cargaremos información 
# desde el Departamento de Salud Pública de California acerca de la vacunación 
# COVID-19 y, por último, descargaremos información sobre vacunación de 
# sarampión de un repositorio llamada Tidy Tuesday.

# ---------------------------------------------------------------------
# Importar datos desde un repositorio local
# ---------------------------------------------------------------------
# 
#Primero, copiamos el archivo "CountyData.csv" a la carpeta de trabajo (puedes
#utilizar ésta carpeta). 

setwd("~/Downloads/WorkshopR") #Este es un ejemplo. Debes ubicar dónde se 
#descargó la carpeta y escribirlo.

# Para importar la información podemos utilizar un par de comandos read.csv() o 
# read.table(). Cada uno tiene parámetros específicos (para tener más info. 
# usar la documentación de los métodos).
# 
# Adicionalmente, la información deberá almacenarse en alguna variable u objeto.
# Para almacenar info en un objeto se utiliza el operador "<-" (como una flecha).

# variable <- función
# Esto se puede leer como "En el objeto variable almacena el resultado de la
# función

CountyPop <- read.csv("CountyData.csv", header = TRUE, sep = ",")

# Para observar el resultado de la asignación, es decir, el contenido del objeto
# CountyPop utilizamos el comando "View()"

View(CountyPop)

# TIP: El nombre de los objetos debe ser corto pero significativo.

# NOTA: Las variables en R distinguen entre mayúsculas y minúsculas por lo que
# la variable "EJEMPLO" es diferente a la variable "ejemplo". Es necesario
# tener mucho cuidado ya que muchos errores se debe a typos.

# Probemos cargar el archivo "cdph-vaccination-county-totals.csv" con el otro 
# método

CountyVaxDataCA <- read.table("cdph-vaccination-county-totals.csv", 
                            header = TRUE, sep = ",")

# ---------------------------------------------------------------------
# Importar datos desde un repositorio web
# ---------------------------------------------------------------------
 
# Para descargar datos de un repositorio web se utilizan los mismos comandos
#cambiando los parámetros.

MMRVaccineRate <- read.csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-25/measles.csv', header = TRUE, sep = ",")

View(MMRVaccineRate)

# =====================================================================
# 5.- Estructuras, tipos y resúmenes
# =====================================================================

# R trabaja más eficientemente con datos en forma de vectores, podemos 
#verlas como listas de información que caen bajo una clase particular. Cuando
# múltiples vectores de la misma longitud se juntan crean
# un marco de datos (data frame), que puede ser similar a una tabla que
#veríamos en Excel. Un concepto simiar a un dataframe son las matrices, la 
# diferencia es que una matriz solo puede contener una sola clase de datos
# mientras que los frames pueden tener varios tipos. 

# Existen varios tipos de datos en R como textos, números enteros, números 
# decimales o lógicos (TRUE o FALSE)

# Conocer los tipos de los datos es importante porque existen comandos o funciones
# que trabajan únicamente para cierto tipo de datos.
# 
# Para conocer el tipo de los elementos que se visualizan en el
# "Global Environment" utilizamos el comando "class()"

class(CountyVaxData)

#Para la clase de una columna en específico se puede utilizar el símbolo $
class(CountyVaxData$date)
class(CountyVaxData$new_jj_doses)

# Para obtener la clase de todos los elemnetos del data frame se usa el comando
# STR

str(CountyVaxData)

# Como se mencionó hay funciones que sólo aplican a cierto tipo de dato, 
# R permite cambiar los tipos según el análisis lo requiera. Para realizar este
# cambio se utiliza el comando "as. + el tipo de dato"

# as.character() - cambia el tipo del objeto a caracter de texto
# as.integer() - cambia el tipo del objeto a número entero
# as.numeric() - cambia el tipo del objeto a número decimal
# as.logical() -cambia el tipo del objeto a lógico (TRUE o FALSE)

# Por ejemplo,e n el objeto CountyPop la columna County es una cadena de texto, 
# sin embargo podemos cambiarla a tipo factor.

class(CountyPop$County) #Aquí sigue siendo texto
tstCounty <- as.factor(CountyPop$County)
class (tstCounty) #Aquí ya es tipo factor

# Además del tipo, muchas veces es necesario conocer el nombre de las columnas
# o filas que forman una tabla. Para eso podemos usar los comandos "colnames" y 
# "rownames"

colnames(CountyVaxData)
rownames(CountyPop)

# Adicional a los nombres, otro elemento que es muy útil (sobre todo cuando son
# tablas con muchos datos) es tener "un vistazo" de la información, por ejemplo,
# imaginemos que tenemos una tabla con 5 columnas y 1 millón de filas. Darle un 
# vistazo a esa tabla sería abrumador (tanto para el equipo como para la
# persona), en ese caso bastaría con ver 10 renglones para tener una idea de los
# datos. Para eso podemos usar los comandos "head" y "tail" para ver 6 renglones.

head(CountyPop)
head(CountyVaxData)

tail(CountyPop)
tail(CountyVaxData)


# =====================================================================
# 6.- Estadística descriptiva
# =====================================================================

# R cuenta con una amplia variedad de funciones de estadística descriptiva, 
# por ejemplo:
#   
#   · Tendencia central: mean(), median()
#   · Dispersión: sd(), IQR()
#   · Rangos: min(), max(), quantile()
#   · Posición: first(), last(), nth(), which()
#   · Conteo: n(), n_distant()
#   · Resumen: summarize(), str()

# Utilicemos un par de de estas funciones;

media <- mean(CountyPop$Per10K)
medianaJJdoses <- median(CountyVaxData$jj_doses)

# =====================================================================
# 7.- Limpiar y filtrar datos
# =====================================================================

# La manera más fácil para filtrar y limpiar los datos ess utilizando los 
# paquetes "dplyr" y "tidyr". Estos paquetes ofrecen una gran variedad de
# comandos oara hacer los sets de datos más manejables.
# 
# Podemos usar el comando "select" para filtrar columnas, es decir, seleccionar
# columnas en específico:
  
CountyPopFilter <- select(CountyPop, County, Per10K)

# En el ejemplo podemos ver que de todas las columnas que forman el dataset de
# CountyPop, las únicas que se seleccionaron (y pasaron) para el objeto 
# CountyPopFilter fueron County y Per10K.

# El comando "filter" permite filtrar por renglones, es decir, obtener valores
# por características específicas.

VaccineCA <- filter(MMRVaccineRate, state == "California")
head(VaccineCA)
VaccineAZ <- filter(MMRVaccineRate,state == "Arizona")
tail(VaccineAZ)

VaccineNotCA <- filter(MMRVaccineRate, state != "California")
head(VaccineNotCA)

# En estos ejemplos, podemos ver que el número de columnas se mantuvo mientras
# que el número de renglones fue variando según el filtro.

# También se pueden borrar variables o datasets del ambiente global. Primero,
# para listar todos los elementos del ambiente globar se utiliza el comando
# "ls()". Segundo, para borrar elementos se utiliza el comando "rm()". 
# Finalmente, si se desea borrar todos los elementos seutiliza el comando
# "rm(list=ls())"

ls()
rm(tstCounty)
rm(medianaJJdoses)

rm(list = ls())

#Dado que acabamos de borrar todos los elementos es necesario volver a 
#cargarlos.

CountyPop <- read.csv("CountyData.csv", header = TRUE, sep = ",")
CountyVaxData <- read.table("cdph-vaccination-county-totals.csv", 
                            header = TRUE, sep = ",")
MMRVaccineRate <- read.csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-25/measles.csv', header = TRUE, sep = ",")

CountyPopFilter <- select(CountyPop, County, Per10K)

#Otra función muy útil es la de combinar tablas. Muchas veces, la información
# que necesitamos no se encuentra en una sola tabla sino que está esparcida. 
# R, al igual que lenguajes com SQL, permite manipular las tablas para
# combinarlas de la manera más ventajosa para el análisis.
# 
# NOTA: https://es.r4ds.hadley.nz/datos-relacionales.html para documentación
#de otro tipo de joins

# En el ejemplo, vamos a ligar las tablas según la información por estado.
# Podemos usar la función "full_join()" del paquete "dplyr" para unirlas
# especificando con el parámtetro "by=" cuáles son las columnas que 
# utilizaremos como punto de unión.

VaxDataMerged <- full_join(CountyPopFilter, CountyVaxData, 
                           by = c("County"="county"))

# ---------------------------------------------------------------------
# Uso de pipes en dplyr
# ---------------------------------------------------------------------

# Los pipes son operadores que permiten concatenar comandos en dplyr, su 
# notación es con los símbolos "%>%". Esto permite unir varias operaciones
# en un solo paso. Por ejemplo:

NewDataFrame <- OldDataFrame %>%
  select(col1, col2, col3) %>% #selecciona las columnas col1, col2 y col3 del old frame
  group_by(col3) %>% # después, agrupa los datos según la col3
  mutate(col4 = col2 * 2) %>% # crea una nueva columna (col4) multiplicando los valores de col2 *2
  Filter(col1 != "NA") #muestra únicamente los elementos cuyo valor en col1 sean diferentes a nulo

# Para nuestro ejemplo, vamos a calcular el número de vacunas COVID dependiendo
# de la densidad poblacional de cada condado. Cuando unimos la tabla en el paso 
# anterior, la información de población por condado (por 10k) se alineó con el
# número de vacunas.

NormalizedVaxData <- VaxDataMerged %>%
  mutate(VaxDensity = fully_vaccinated/Per10K) %>% #creamos una nueva columna normalizando la info
  filter(VaxDensity > 50) #Mostramos únicamente aquellos condado que tienen una densidad mayor a 500k

# =====================================================================
# 8.- Gráficas con ggplot2
# =====================================================================

# El paquete "ggplot" se basa en la idea de que se puede construir casi
# cualquier gráfica con tres componentes: 1) un conjunto de datos, 
#   2) un sistema de coordenadas, y 3) "geoms" que son marcas visuales que
# representan puntos de datos. A continuación haremos un par de gráficas
# utilizando esta paquetería. 
# 
# NOTA: Para más información de gráficas pueden utilizar como referencia el
# cheat sheet de "ggplot2" 
# https://rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

# Primero, vamos a obtner info de los pasos anterior. Vamos a filtrar a aquellos
# condados que tengan más de un millón de residentes y haremos una gráfica 
# usando ggplot2 que muestre el número total del números de casos positivos 
# empezando por el primer día registrado de vacunas.

# ---------------------------------------------------------------------
# Creando una gráfica de línea
# ---------------------------------------------------------------------

#Esta es la sintaxis para generar una gráfica lineal. Como mencionamos, 
# solo requiere de tres elementos: los datos, el sistema de coordenadas y 
# el geom. 

ExamplePlot <- ggplot(DataFrame, aes(X, Y)) + 
  geom_smooth() # this geom creates a linear model


# A continuación se muestra un ejemplo de una gráfica generada. Revisando
# la sintaxis podemos ver que otro parámetro que nos permite facilitar
# la visualización. Est parámetro es una lista de características estéticas
# para la gráfica, como nombre de etiquetas, título de la gráfica y color.
# Para el caso de las gráficas, se utiliza el operador "+" para ligar los 
# argumentos ya que son capaz que se apilan una encima de la otra al crear una
# gráfica

# También, en el ejemplo se utiliza el comando "ymd()". Este comando, que 
# viene en el paquete lubridate. Este comando nos permite manjear fechas 
# (que usualmente R interpreta como cadenas de texto) como objetos de tipo Date

# ¿Qué hace esta operación?
VaccinationRate <- NormalizedVaxData %>%
  select(date, 
         County,
         VaxDensity,
         fully_vaccinated,
         Per10K,
         at_least_one_dose, 
         new_doses_administered) 

# ¿Qué hace esta operación?
VaccinationRate <- VaccinationRate %>%
  filter(Per10K >= 100)

plot <- ggplot(VaccinationRate, aes(x = ymd(date), y = fully_vaccinated, color = County)) + 
  geom_smooth(method = "auto") + 
  labs(x = "Date", 
       y = "Fully Vaccinated (Total)", 
       title = "Vaccinations in Large Counties")

plot

#Ahora generemos una gráfuca considerando la densidad en lugar de los datos 
#totales. ¿Qué variables deberían ir donde viene XXXXX
# Now try to create an identical plot looking at case density for the large
# instead of total cases. I've copied over the syntax of the code, now fill in 
# the variables where we see XXXX to get the code to work.

VaxDensityPlot <- ggplot(VaccinationRate, aes(ymd(date), XXXXX, color = County)) +
  geom_smooth(method = "auto")+ 
  labs(x = "Date", 
       y = "Full Vaccinations per 10k Residents", 
       title = "Vaccination Density in Large Counties")

VaxDensityPlot

# =====================================================================
# 9.- Estadística básica
# =====================================================================

#Para esta última sección realizaremos un ejemplo de prueba de hipótesis
# para saber si la diferencia entre dos condados (LA y San Diego) es 
# significativamente diferente o no. En este caso, primero haremos la
# comparación gráfica y después la prueba de hipótesis.
# 
# Utilizandoel comando de filtro separamos la info de dosis administradas
# por millón de habitantes en LA y San Diego después del 19 de septiembre

LastMonthVaccinations <- VaccinationRate %>%
  filter(ymd(date) >= ymd("2021-09-19"))

LAvax <- LastMonthVaccinations %>%
  filter(County == "Los Angeles")

SDvax <- LastMonthVaccinations %>%
  filter(County =="San Diego")

# Una vez separados aplicmos la fución "t.test()" para hacer la prueba sobre
# las columnas de "VaxDensity"


t.test(LAvax$VaxDensity, SDvax$VaxDensity)


#Usabdi el mismo enfoque, comparemos si las dosis de LA son diferentes
# significativamente a las de Orange County


OrangeVax <- LastMonthVaccinations %>%
  filter(County  =="Orange")

t.test(SDvax$VaxDensity, OrangeVax$VaxDensity)

# R  tiene herramientas poderosas para realizar pruebas estadísticas,
# con la prueba T es solo rasguñamos la superficie. Algunas de las pruebas
# más comunes son:
# R has a powerful suite of tools that can be used for statistical testing. 

   # · Pruebas pareadas: oneway.test(), pairwise.t.test()
   # · Distribución: aov_residuales()
   # · Chi-Squared: kruskal.test(), chisq.test()
   # · Regresiones lineales: lm()

# Con esto terminamos la breve introducción a R y R-Studio. Ojalá se animen 
# a probar la herramienta, juegen con datos, exploren todo lo que pueden hacer
# y aplíquenlo en sus proyectos :) 

