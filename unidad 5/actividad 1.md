# Parte 1

## Actividad diagnostica

Encapsulamiento: nivel de seguridad de una clase

Herencia: una clase que se puede repartir en todas las clases que se deseen

Polimorfismo: un método heredado que se ejecuta de manera diferente a pesar de ser el mismo código


# Parte 2

## Encapsulamiento

ejemplo claro de encapsulamiento    private string nombre;

private es el nivel de encapsulamiento de nombre por lo cual no se puede acceder desde otra clase

Nombre es public para que se pueda asignar un valor a nombre desde otra clase ya que nombre espera de retorno lo que tenga Nombre, esto evita errores con la asignacion de nombre



## Herencia

la herencia se evidencia en    public class Circulo : Figura{

tambien contiene el dato de nombre


## Polimorfismo

creo que si funcionaria bien por que dibujaria lo que hay en la lista, primero el circulo, luego el rectangulo y despues el circulo


# Parte 3

## Memoria y herencia

Rectangulo: Base, Altura y Nombre se guardan temporalmente mientras se llama su codigo y se asigna su valor donde este guardado el objeto rectangulo

## El mecanismo del polimorfismo

se decide dependiendo de el orden si en el ciclo esta primero el circulo se llamará primero

## La barrera del encapsulamiento

es algo que se revisa cuando se escribe el codigo, por que asi se ejecutara se encontraria con un error por que no se puede acceder a el codigo protegido
