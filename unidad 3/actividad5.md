## actividad 5
en C++ las copias de algun objeto son independientes (no importa cuanto cambie la original seguira igual), en c# las copias son dependientes a el original si la copia cambia el original con el.
una copia en c# es los mismo que su original y en c++ es un objeto diferente.


## actividad integradora

salida esperada:

Experimento con paso de parámetros

Valor inicial de val_A:20
Dentro de sumaPorValor, 'a' ahora es:30
"Valor final de val_A:30

Valor inicial de val_B:20
Dentro de sumaPorReferencia, 'a' ahora es:30
Valor final de val_B:30

Valor inicial de val_C:20
Dentro de sumaPorPuntero, '*a' ahora es:30
Valor final de val_C:30

Experimento con variables estáticas
Llamada a ejecutarContador. Valor de contador_estatico:1
Llamada a ejecutarContador. Valor de contador_estatico:2
Llamada a ejecutarContador. Valor de contador_estatico:3


| |
|--------------------------------------------| 
|              Segmento de codigo            | 
|                                        | 
|                 sumaPorValor                       | 
|                                  | 
|--------------------------------------------| 
|       Variables globales y estáticas       | 
|                                            | 
|               contador_global          | 
|                contador_estatico      | 
|                            | 
|--------------------------------------------| 
|                    Heap                    | 
|                                            | 
|--------------------------------------------| 
|                    Stack                   | 
|  |
|                     val_A                       | 
|                       val_B      | 
|  val_C     |
|--------------------------------------------| 



### Comparacion de la prediccion a la ejecución 

prediccion
Valor inicial de val_A:20
Dentro de sumaPorValor, 'a' ahora es:30
"Valor final de val_A:30

ajecucion
Valor inicial de val_A:20
Dentro de sumaPorValor, 'a' ahora es:30
"Valor final de val_A:20

Solo cambia adentro de su ejecucion luego vuelve a su valor original


### comportamiento de contador_estatico

puede guardar y acomular su valor ya que es una variable estatica
