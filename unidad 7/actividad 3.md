// 9) Configura el viewportglViewport(0, 0, bufferWidth, bufferHeight);¿Qué pasa si?
con esta linea de codigo el triangulo tiene un tamaño "igual" a el de la ventana que lo proyecta

glViewport(0, bufferHeight/2, bufferWidth/2, bufferHeight/2);
Cambia los valores de bufferWidth y bufferHeight: divide por 2, por 4, multiplica por 2, por 4, etc. ¿Qué pasa? ¿Qué observas? ¿Qué crees que está pasando?

con esta linea el triangulo se ve reducido a la mitad de el tamaño que tenia antes, sin que se reduzca tambien la ventana que lo proyecta

Entonces hagamos “digestión”: en tu bitácora, escribe un resumen de lo que has aprendido hasta ahora y piensa en un experimento del tipo ¿Qué pasaría si?

