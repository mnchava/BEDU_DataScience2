#Ahora es momento de realizar la extracción de una tabla desde un html,
#realiza este reto desde tu RStudio Desktop.
#De la siguiente dirección donde se muestran los sueldos para Data Scientists

#(https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm),
#realiza las siguientes acciones:

install.packages("rvest")
install.packages("XML")
library(rvest)
library(XML)

#Extraer la tabla del HTML

theurl <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"

file<-read_html(theurl)

tables<-html_nodes(file, "table")
table1 <- html_table(tables[1], fill = TRUE)

#Quitar los caracteres no necesarios de la columna sueldos (todo lo que no sea
#número), para dejar solamente la cantidad mensual (Hint: la función gsub 
#podría ser de utilidad)

#Asignar ésta columna como tipo numérico para poder realizar operaciones
#con ella

table <- na.omit(as.data.frame(table1))
sueldo <- table$Sueldo
sueldo <- gsub("[,$/]", "", sueldo)
sueldo <- gsub("[a-zA-Z]", "", sueldo)
sueldo <- as.numeric(sueldo)
table$Sueldo <- sueldo
head(table)

#Ahora podrás responder esta pregunta ¿Cuál es la empresa que más paga y la que menos paga?

filter(table, Sueldo == max(table$Sueldo))

filter(table, Sueldo == min(table$Sueldo))

