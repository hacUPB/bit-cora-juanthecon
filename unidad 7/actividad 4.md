Luego de estudiar las unidades 1 y 2 de este curso y ver el video, escribe con tus propias palabras 
¿Cuál es la diferencia entre una CPU y una GPU?

CPU: pocos núcleos muy potentes, diseñados para tareas generales y secuenciales.
Es el “cerebro” que organiza y coordina todo.

GPU: miles de núcleos más simples, especializados en ejecutar operaciones en paralelo.
Es el “ejército” que procesa gráficos y cálculos masivos al mismo tiempo.


## aprender a aprender

1. Tres pasos claves del pipeline
Procesamiento de vértices (Vertex Processing): toma los datos de cada vértice (posición, color, normales) y los transforma en coordenadas de pantalla.

Rasterización: convierte las primitivas (triángulos, líneas, puntos) en fragmentos, es decir, posibles píxeles que ocuparán la pantalla.

Procesamiento de fragmentos (Fragment Processing): calcula el color final de cada fragmento, aplicando texturas, iluminación y efectos.

2. Pipeline programable
Pipeline fijo (Legacy): todo estaba predefinido, el programador solo configuraba parámetros (ej. glBegin/glEnd).

Pipeline programable (Moderno): el programador escribe pequeños programas llamados shaders (vertex y fragment shaders) que definen cómo se procesan los datos.

Ventajas: flexibilidad, potencia y personalización. Puedes crear efectos únicos, simular materiales, aplicar iluminación avanzada.

¿Qué programo?: al menos un vertex shader y un fragment shader; opcionalmente geometry, tessellation o compute shaders.

3. Rasterización
Es el proceso de convertir primitivas geométricas (como triángulos) en fragmentos que corresponden a posiciones de píxeles en la pantalla. Es el “puente” entre la geometría y la imagen final.

4. Fragmentos vs píxeles
Fragmento: contiene información potencial para un píxel (color, profundidad, coordenadas de textura).

Píxel: es el resultado final que se muestra en pantalla.
No son lo mismo: un fragmento puede ser descartado (por depth test, stencil, etc.) y nunca convertirse en píxel.

5. Z-buffer y depth test
Z-buffer: almacena la profundidad de cada fragmento.

Depth test: compara la profundidad de un nuevo fragmento con la ya almacenada para decidir si se dibuja o se descarta.
Esto evita que objetos lejanos sobrescriban a los cercanos.

6. Aliasing y anti-aliasing
Aliasing: bordes dentados por la discretización de la geometría en píxeles.

Anti-aliasing: técnicas para suavizar esos bordes (ej. multisampling), logrando transiciones más suaves.

7. Iluminación y fragment shader
El fragment shader puede calcular iluminación (Phong, Blinn-Phong, etc.).

No siempre es obligatorio: puedes hacer shaders sin iluminación (ej. colores planos, efectos artísticos).

Implicación: sin iluminación, la escena puede verse irreal o demasiado simple; con iluminación, se logra realismo y profundidad.

8. Múltiples fuentes de iluminación
Cada luz implica cálculos adicionales en el fragment shader (intensidad, dirección, sombras).
Para la GPU, esto significa más operaciones por fragmento → mayor carga computacional. En escenas complejas, puede impactar el rendimiento.

## digestion cognitiva

1. Dibujar un triángulo en OpenGL

Definir los vértices: las coordenadas del triángulo.

Crear un VBO (Vertex Buffer Object): subir esos vértices a la memoria de la GPU.

Configurar un VAO (Vertex Array Object): indicar cómo se leen los datos del VBO.

Usar un shader program: para transformar y colorear los vértices.

Llamar a glDrawArrays: decirle a OpenGL que dibuje los vértices como un triángulo.

2. Usar un shader en OpenGL

Escribir el código del shader: por ejemplo, un vertex shader y un fragment shader.

Compilar cada shader: convertir el código GLSL en algo que la GPU entienda.

Enlazar los shaders en un shader program: unirlos en un programa ejecutable.

Activar el shader program: decirle a OpenGL que lo use antes de dibujar.

Pasar variables (uniforms/attributes): enviar datos como colores, matrices de transformación, texturas.
