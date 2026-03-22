## Actividad 2

La aplicacion genera particulas de colores aleatorios y explotan de fromas aleatorias

## Actividad 3 – Objetos y métodos virtuales
¿Qué esperas ver en memoria (hipótesis)?  

El depurador mostrará punteros y estructuras internas.

¿Qué puedes observar en memoria?  
El depurador muestra cómo se organiza el objeto en bloques.

¿Qué información te proporciona el depurador?  
Permite ver la jerarquía de clases, los punteros internos y la disposición de los datos en memoria.

¿Qué puedes concluir?  
Un objeto solo existe mientras la aplicación corre.

CircularExplosion en memoria

¿Qué puedes observar? Los campos de ExplosionParticle y Particle aparecen primero, seguidos de los de CircularExplosion.

¿Qué información te da el depurador? Que la herencia se refleja como bloques consecutivos en memoria.

¿Qué puedes concluir? La jerarquía de clases se traduce directamente en la estructura del objeto en memoria.

¿Qué es la _vtable?  
Es un puntero a una tabla de funciones virtuales. Contiene direcciones de los métodos que pueden ser sobreescritos.

¿Qué puedes observar en la vtable?  
Cada entrada apunta a la implementación correcta de los métodos virtuales según la clase real.

¿Qué puedes concluir?  
La vtable es la base del polimorfismo.

¿Para qué sirve la tabla de funciones virtuales?  
Sirve para implementar polimorfismo en tiempo de ejecución: que un mismo puntero pueda llamar métodos distintos según el objeto real.

## Actividad 4 – Encapsulamiento
¿Qué sucede al descomentar las líneas?  
El compilador marca error al intentar acceder a protectedVar y privateVar.

¿Por qué sucede esto?  
Porque los modificadores de acceso impiden el acceso directo desde fuera de la clase.

¿Qué puedes concluir?  
El encapsulamiento protege los datos internos y solo permite acceso controlado.

¿Qué pasa al compilar el programa con obj.secret1?  
Error de compilación: no se puede acceder a miembros privados.

¿Qué pasa al usar reinterpret_cast?  
El programa compila y ejecuta, mostrando los valores privados directamente desde memoria.

¿Qué puedes concluir?  
El encapsulamiento se garantiza en compilación, pero en ejecución puede romperse manipulando la memoria.

En tus palabras, ¿qué es el encapsulamiento y por qué es importante?  
Es ocultar los detalles internos de una clase y exponer solo lo necesario. Es importante porque protege la integridad del objeto y evita dependencias frágiles.

## Actividad 5 – Herencia
¿Qué puedes observar en memoria de CircularExplosion?  
Los campos de Particle, luego los de ExplosionParticle, y los de CircularExplosion.

¿Qué información te da el depurador?  
Que la herencia se implementa como bloques consecutivos en memoria.

¿Qué puedes concluir?  
La herencia se traduce en que los objetos incluyen los campos de sus clases padre.

¿Cómo se implementa la herencia en C++?  
Cada clase derivada contiene los miembros de sus bases. Los métodos virtuales se manejan con la vtable.

Herencia múltiple en C++  
Un objeto puede heredar de varias clases. (tiene diferentes padres)

## Actividad 6 – Polimorfismo
¿Qué puedes observar en el depurador al ejecutar update()?  
Cada objeto en particles ejecuta su propia versión de update, aunque todos son tratados como Particle*.

¿Qué información te da el depurador?  
Que la llamada se redirige a la función correcta según el tipo real del objeto.

¿Qué puedes concluir?  
El polimorfismo en tiempo de ejecución se logra gracias a los métodos virtuales y la vtable.

Dibujo del polimorfismo en tiempo de ejecución

Caja Particle con puntero _vtable.

La vtable apunta a funciones (update, draw).

Cada clase derivada tiene su propia vtable con direcciones distintas.

El puntero Particle* consulta la vtable y ejecuta el método correcto.

¿Qué relación existe entre métodos virtuales y polimorfismo?  
Los métodos virtuales permiten que un mismo puntero base invoque distintas implementaciones según el objeto real

