
# Cargar librerías necesarias ===============
library(ggplot2)
library(dplyr)

# Cargar datos
datos <- data.frame(
  Año = c(2010:2019),
  Producción = c(1000, 1200, 1100, 1300, 1050, 1250, 1150, 1400, 1080, 1280),
  Temperatura = c(18.5, 19.2, 18.8, 20.1, 18.2, 19.5, 18.9, 20.5, 18.4, 19.8),
  Precipitación = c(500, 550, 450, 600, 400, 525, 475, 650, 420, 575)
)

# Visualizar datos ===============
ggplot(datos, aes(x = Año, y = Producción)) + 
  geom_point() + 
  geom_line() + 
  labs(title = "Producción de frutas en California", x = "Año", y = "Producción (toneladas)")+
  theme_minimal()

# Modelar producción utilizando regresión lineal ===============
modelo <- lm(Producción ~ Temperatura + Precipitación, datos)

# Resumen del modelo ===============
summary(modelo)

# Predecir producción para el año 2020 ===============
nuevo_datos <- data.frame(
  Temperatura = 19.5,
  Precipitación = 525
)
predict(modelo, nuevo_datos)
