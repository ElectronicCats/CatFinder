# TEXT_TRANSFORM_C v1.0

Esta herramienta creada en c# tiene la función de transformar código HTML, JS y CSS o cualquier otro a texto de C,
con el fin de poder minificar código, ahorrando tiempo y espacio en memoria

![](https://github.com/ElectronicCats/Cat_Finder/wiki/assets/transformC.PNG)

Esta herramienta se encuentra como un ejecutable en la carpeta de ```/tools``` de este repositorio

# Ejecutable
 
Esta herramienta es solamente compatible con el sistema operativo  ```windows```, instrucciones de ejecución: 

* Abrir el ejecutable que encontramos dentro del repo en la carpeta  ```/tools``` el archivo ```tool_transformC_text.exe```
![](https://github.com/ElectronicCats/Cat_Finder/wiki/assets/ejecutar_exe.PNG)

# Forma de uso

  * Iniciar la aplicación con doble click en el ejecutable, aparecerá lo siguiente
  * 
  ![](https://github.com/ElectronicCats/Cat_Finder/wiki/assets/inicio_exe.PNG)
  
  * Una vez iniciado el programa se puede crear la web en algún editor de texto y pasarlo a la aplicación con solo copiar y pegar en la consola tu codigo, como el ejemplo siguiente:

  
 ```
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>EJEMPLO DE USO</title>
</head>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    body{
        background-color: #f2f2f2;
    }
</style>
<body>
    <h1 class="title">Cat Finder</h1>
    <img src="https://electroniccats.com/wp-content/uploads/2018/01/logo-75.png" alt="Logo" />
    <p class="subtitle center">:3</p>
    <script>
        console.log('Son chidos los de Electronic Cats!');
    </script>
</body>
</html>
 ```
 Con esto se obtendra el codigo listo para C y quedara de la siguiente forma:
 
 ![](https://github.com/ElectronicCats/Cat_Finder/wiki/assets/copycode_exe.PNG)
 
 * Una vez listo para concluir solo es necesario presionar enter y escribir ```ok.``` después de haber hecho esto nos se obtendra la siguiente salida
 
 ```<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"UTF-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\"><title>EJEMPLO DE USO</title></head><style>*{margin: 0;padding: 0;}body{background-color: #f2f2f2;}</style><body><h1 class=\"title\">Cat Finder</h1><img src=\"https://electroniccats.com/wp-content/uploads/2018/01/logo-75.png\" alt=\"Logo\" /><p class=\"subtitle center\">:3</p><script>console.log('Son chidos los de Electronic Cats!')</script></body></html>```
 
 listo para pegar en una sola linea de codigo en C, como el siguiente ejemplo
 
```SendData = "<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"UTF-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\"><title>EJEMPLO DE USO</title></head><style>*{margin: 0;padding: 0;}body{background-color: #f2f2f2;}</style><body><h1 class=\"title\">Cat Finder</h1><img src=\"https://electroniccats.com/wp-content/uploads/2018/01/logo-75.png\" alt=\"Logo\" /><p class=\"subtitle center\">:3</p><script>console.log('Son chidos los de Electronic Cats!')</script></body></html>";```

# Recomendaciones

  * Es importante saber que cada línea de código escrita con js tendra que terminar con su ```;``` ya que al final de el proceso se entrega una sola linea de codigo y esto en js marcaria un error al momento de ejecutarlo en el navegador si no termina cada línea con su ```;```

  
