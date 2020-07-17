# -*- coding: utf-8 -*-

name = "Hexa"
pixel_per_block = 65536

#Abre el archivo "0.txt" que tiene la información de la imagen 
archivo0 = open ("0.txt", "r")

#Leemos las líneas del txt para extraer la info necesaria
line1_info = archivo0.readline()

line2_name = archivo0.readline()
line3_type = archivo0.readline()
line4_rows = archivo0.readline()
line5_columns = archivo0.readline()
line6_pixel_val = archivo0.readline()

#separamos los valores de los pixeles en una lista
listaPixelString = line6_pixel_val.split()
#Creamos la lista que va a contener los números de los pixeles
listaPixelInt = []

archivo0.close()

#Cconvertimos los valores de la lista de pixeles de string a int
for x in listaPixelString:
    n = int(x)
    listaPixelInt.append(n)

size_image = len(listaPixelInt)
cont = 0
i = 0
while i < size_image:
    #Crea y abre el archivo "Hexa[índice].txt" donde vamos a guardar los valores con el 
    #formato necesario para usarlo en nuestro programa
    archivoNew = open (name + str(cont) + ".txt", "w")
    pixels = listaPixelInt[i:i+pixel_per_block]
    #Mantiene el tamaño de la página rellenando con ceros
    pixels = pixels + [0]*(pixel_per_block-len(pixels))
    #Escribimos en un nuevo archivo los valores en hexa de cada uno de los   
    #pixeles con el formato para poderse guardar en memoria
    archivoNew.write('\n'.join([hex(pixel)[2:] for pixel in pixels]))
    archivoNew.close()
    cont = cont + 1
    i = i + pixel_per_block
