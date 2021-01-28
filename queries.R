#Crea un repositorio en Github llamado Reto_Sesion_7
#Crea un Project llamado Reto_Sesion_07 dentro de RStudio utilizando tu cuenta 
#de RStudio, que esté ligado al repositorio recién creado
#Ahora crea un script llamado queries.R donde se conecte a la BDD shinydemo

install.packages("DBI")
install.packages("RMySQL")

library(DBI)
library(RMySQL)

DBShiny <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

class(DBShiny)
#Una vez hecha la conexión a la BDD, generar una busqueda con dplyr que
#devuelva el porcentaje de personas que hablan español en todos los países

install.packages("dplyr")
library(dplyr)

dbListFields(DBShiny, "CountryLanguage")

hispanohablantes <- dbGetQuery(DBShiny, 
           "select * from CountryLanguage where Language = 'Spanish'")

head(hispanohablantes)

#Realizar una gráfica con ggplot que represente este porcentaje de tal modo
#que en el eje de las Y aparezca el país y en X el porcentaje, y que
#diferencíe entre aquellos que es su lengua oficial y los que no con diferente
#color (puedes utilizar la geom_bin2d() y coord_flip())

install.packages("ggplot2")
library(ggplot2)

ggplot(hispanohablantes, aes(x = CountryCode, y = Percentage, fill = IsOfficial)) + 
  geom_bin2d() +
  coord_flip()

#Una vez hecho esto hacer el commit y push para mandar tu archivo al
#repositorio de Github Reto_Sesion_7


