// 9) Configura el viewportglViewport(0, 0, bufferWidth, bufferHeight);¿Qué pasa si?
con esta linea de codigo el triangulo tiene un tamaño "igual" a el de la ventana que lo proyecta

glViewport(0, bufferHeight/2, bufferWidth/2, bufferHeight/2);
Cambia los valores de bufferWidth y bufferHeight: divide por 2, por 4, multiplica por 2, por 4, etc. ¿Qué pasa? ¿Qué observas? ¿Qué crees que está pasando?

con esta linea el triangulo se ve reducido a la mitad de el tamaño que tenia antes, sin que se reduzca tambien la ventana que lo proyecta

Entonces hagamos “digestión”: en tu bitácora, escribe un resumen de lo que has aprendido hasta ahora y piensa en un experimento del tipo ¿Qué pasaría si?

GLFW: crea ventanas y gestiona eventos (teclado, ratón).

Contexto OpenGL: es el “estudio” donde la GPU dibuja; sin él no hay gráficos.

Framebuffer: la memoria donde la GPU pinta antes de mostrar en pantalla.

Viewport: define qué parte del framebuffer se ve en la ventana.

GLAD: carga funciones modernas de OpenGL desde los drivers de la GPU.

Shaders (GLSL): pequeños programas que transforman vértices y fragmentos, esenciales en el pipeline programable.

GPU vs CPU: la CPU maneja tareas generales secuenciales, la GPU ejecuta miles de operaciones gráficas en paralelo.

experimento: ¿que pasaria si el fragment shader decide el color de cada pixel?: Cambia la salida de gl_FragColor a un color fijo, por ejemplo rojo.


¿Qué pasa si cambias el primer parámetro de glDrawArrays a GL_LINES? ¿Qué pasa si lo cambias a GL_POINTS? ¿Qué pasa si cambias el tercer parámetro a 2? ¿Qué pasa si lo cambias a 4?


Primer parámetro (modo de dibujo)
GL_LINES: cada par de vértices se conecta formando una línea independiente. Si tienes 4 vértices, se dibujan 2 líneas separadas.

GL_POINTS: cada vértice se dibuja como un punto aislado en la pantalla, sin conectarse con otros.

Tercer parámetro (count, número de vértices a usar)
2: solo se toman los dos primeros vértices del arreglo.

Si el modo es GL_TRIANGLES, no se dibuja nada porque un triángulo necesita 3 vértices.

Si es GL_LINES, se dibuja una sola línea con esos dos vértices.

Si es GL_POINTS, se dibujan dos puntos.

4: se toman los cuatro primeros vértices.

Con GL_TRIANGLES, se dibuja un triángulo con los primeros 3 vértices y el cuarto queda “colgado” (no se usa porque falta completar otro grupo de 3).

Con GL_LINES, se dibujan dos líneas (vértices 0–1 y 2–3).

Con GL_POINTS, se dibujan cuatro puntos.

## preguntas finales

Contexto OpenGL: es el “taller” donde la GPU puede dibujar. Sin contexto, OpenGL no sabe dónde ni cómo renderizar.

GLFW: crea ventanas y gestiona entradas (teclado, ratón). Ventaja: simplifica la interacción multiplataforma sin que tengas que lidiar con APIs específicas del sistema operativo.

Necesidad del contexto: como en un taller de arte, necesitas un espacio definido para trabajar. El contexto es ese espacio donde se colocan los lienzos (framebuffers) y herramientas.

Framebuffer: es la memoria donde la GPU pinta cada cuadro antes de mostrarlo. Recuerda a los buffers de las primeras unidades: estructuras temporales para almacenar datos antes de usarlos.

Viewport vs framebuffer: el framebuffer guarda toda la “pintura”, el viewport es la ventana por la que miras una parte de esa pintura.

Drivers y GPU: los drivers traducen las llamadas de OpenGL a instrucciones que la GPU entiende. La GPU ejecuta esas instrucciones en paralelo para producir gráficos.

VSync: sincroniza la tasa de refresco de la GPU con la del monitor.

Si no lo activas y la imagen es estática: no notarás diferencia.

Si es dinámica: puede aparecer “tearing” (la imagen se corta porque la GPU dibuja más rápido que el monitor refresca).

OpenGL Legacy vs Moderno:

Legacy: usaba funciones fijas (glBegin, glEnd, glVertex…), pipeline rígido.

Moderno: todo se hace con shaders y objetos (VAO, VBO), lo que da flexibilidad y rendimiento.

Shader program: conjunto de shaders compilados y enlazados. Es vital porque define cómo se procesan vértices y fragmentos en OpenGL moderno.

setupTriangle(): probablemente crea los datos de un triángulo y los sube a la GPU.

VAO (Vertex Array Object): guarda la configuración de cómo leer los datos.

VBO (Vertex Buffer Object): almacena los vértices en memoria de la GPU.

Game loop y uso de VAO/Shader: aunque podrías activarlos antes del loop, repetirlo en cada frame asegura que si cambias de VAO o shader, OpenGL sepa cuál usar. Es útil cuando alternas entre distintos objetos o efectos.

glfwSwapBuffers(mainWindow): intercambia el framebuffer oculto con el visible.

Si no lo llamas: verías una pantalla congelada, porque nunca se muestra el resultado del dibujo.

Explicación: OpenGL dibuja en un buffer “oculto” para evitar parpadeos; sin swap, ese buffer nunca se presenta en pantalla.
