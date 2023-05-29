# Practica 5
## Descripción 
El objetivo de la práctica es implementar un contador que aumente y disminuya depende de que botno sea presionado. siguiente codigo es implementar un contador binario en el µC Cortex M3 a traves del uso de leds y dos botones.Si los dos botones se oprimen al mismo tiempo el contador se reinicia. 
## main .s 
En el archivo main.s se configuran los pines de entrada y salida. Los pines A0 y A1 son los pines que corresponden a los botones, los leds están conectados del pin A2 al A11. 
A su vez, main.s utiliza funciones de otros archivos que ayudan a la ejecución del programa. 


## Ejecución del programa 
1. Clonar el repositorio desde github 
2. Desvincula la copia del repositorio remoto usando el comando ` make unlink `
3. Con el comando ` make clean ` elimina los archivos objeto 
4. Creal los archivos objeto y el archivo .bin con el comando ` make`
5. Para grabar el archivo .bin emplea el comando ` make write `

## Implementación  

![Captura desde 2023-05-29 12-59-41](https://github.com/monmejss/Practica-5/assets/122710250/deb86619-3540-4210-9902-588777199078)
