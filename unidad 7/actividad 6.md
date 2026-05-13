## 1. Cambios en el código C++

Obtención del tiempo: en el game loop se usa glfwGetTime() para obtener el tiempo transcurrido desde que se inició la aplicación.

Actualización del uniform: se obtiene la ubicación del uniform time con glGetUniformLocation y en cada iteración del loop se actualiza con glUniform1f(timeLocation, t).

Esto permite que el fragment shader reciba un valor de tiempo distinto en cada frame y genere el efecto dinámico.

## 2. Fragment shader modificado
glsl
#version 460 core
out vec4 FragColor;
uniform float time;
```cpp
void main() {
    // Tres osciladores con frecuencias/fases distintas para R,G,B
    float r = (sin(time * 2.0) + 1.0) * 0.5;
    float g = (sin(time * 0.7 + 2.0) + 1.0) * 0.5;
    float b = (sin(time * 1.3 + 4.0) + 1.0) * 0.5;
    FragColor = vec4(r, g, b, 1.0);
}
```
## 3. Uso de la función de tiempo
Se emplea la función sin() con distintas frecuencias y fases para cada canal de color (R, G, B).

sin() produce valores en el rango [-1, 1].

Al sumar 1 y multiplicar por 0.5, el rango se convierte en [0, 1], que es justo el rango válido para los colores en OpenGL.

Resultado: cada canal oscila suavemente entre 0 y 1, generando un cambio cíclico de color.

## 4. link video evidencia
https://youtu.be/JUQ8apweaDI

## 5. Reflexión: otros efectos con tiempo
Posición: usar sin(time) para mover el triángulo de izquierda a derecha.

Tamaño: aplicar sin(time) como factor de escala para que el triángulo “respire” (se expanda y contraiga).

Rotación: aunque no lo hemos visto formalmente, podrías usar cos(time) y sin(time) para construir una matriz de rotación y hacer que el triángulo gire lentamente.
