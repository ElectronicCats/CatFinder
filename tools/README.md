# TEXT_TRANSFORM_C v1.0
Esta herramienta creada en c# tiene la función de transformar código como de HTML, JS y CSS o cualquier otro a texto de C,
con el fin de poder minificar código, ahorrando tiempo y espacio en memoria

![](https://github.com/ElectronicCats/Cat_Finder/wiki/assets/transformC.PNG)

Dicha herramienta se encuentra como un ejecutable en la carpeta de ```/tools```

# Ejecutable
 
Esta herramienta es solamente compatible con el sistema operativo de ```windows``` dejando en claro lo siguiente seria: 

* Abrir el ejecutable que encontramos dentro del repo en la carpeta  ```/tools``` el archivo ```tool_transformC_text.exe```
![](https://github.com/ElectronicCats/Cat_Finder/wiki/assets/ejecutar_exe.PNG)

# Forma de uso

  * Iniciamos la aplicación solo dando doble click en en archivo y nos aparecerá lo siguiente
  ![](https://github.com/ElectronicCats/Cat_Finder/wiki/assets/inicio_exe.PNG)
  
  * Una vez iniciado el programa podemos crear nuestra web en algún editor de texto y pasarlo dentro de la aplicación solo copiarlo y pegarlo en la consola de nuestra aplicación un ejemplo sería el siguiente 

  
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
 si tenemos esto solo copiarlo a la consola y quedaría de la siguiente forma 
 ![](https://github.com/ElectronicCats/Cat_Finder/wiki/assets/copycode_exe.PNG)
 
 * una vez listo nuestro archivo para concluir debemos de dar un enter y escribir ```ok.``` después de haber hecho esto nos daría el siguiente output
 
 ```<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"UTF-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\"><title>EJEMPLO DE USO</title></head><style>*{margin: 0;padding: 0;}body{background-color: #f2f2f2;}</style><body><h1 class=\"title\">Cat Finder</h1><img src=\"https://electroniccats.com/wp-content/uploads/2018/01/logo-75.png\" alt=\"Logo\" /><p class=\"subtitle center\">:3</p><script>console.log('Son chidos los de Electronic Cats!')</script></body></html>```
 
 listo para poder pegarlo en una sola linea de codigo en C, como el siguiente ejemplo
```SendData = "<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"UTF-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\"><title>EJEMPLO DE USO</title></head><style>*{margin: 0;padding: 0;}body{background-color: #f2f2f2;}</style><body><h1 class=\"title\">Cat Finder</h1><img src=\"https://electroniccats.com/wp-content/uploads/2018/01/logo-75.png\" alt=\"Logo\" /><p class=\"subtitle center\">:3</p><script>console.log('Son chidos los de Electronic Cats!')</script></body></html>";```

# Recomendaciones

  * Es importante de saber que cada línea de código escrita con js tendremos que terminar con su ```;``` ya que al final de el proceso nos entrega una sola linea de codigo y esto en js nos marcaria error al momento de correrlo en el navegador si no terminamos cada línea con su ```;```
