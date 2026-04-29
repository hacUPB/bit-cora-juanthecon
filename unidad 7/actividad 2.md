## GLFW

Rol: Biblioteca para manejar ventanas, contexto de OpenGL y entrada (teclado, ratón, joystick).

Función: No dibuja nada por sí misma; se encarga de crear la ventana y el contexto gráfico donde OpenGL puede trabajar.

Relación: Es el punto de entrada: sin GLFW (u otra librería similar), no tendrías un espacio donde ejecutar tus llamadas a OpenGL.

## opengl32.lib
Rol: Librería de enlace estático incluida en Windows.

Función: Actúa como intermediario entre tu programa y los drivers de la GPU. Contiene las funciones básicas de OpenGL y delega las extensiones modernas a los drivers.

Relación: Es lo que tu compilador enlaza para que las llamadas a OpenGL lleguen al sistema operativo y, finalmente, al driver de la tarjeta gráfica.

## GLAD
Rol: Loader de funciones de OpenGL.

Función: Dado que OpenGL moderno se organiza en extensiones, GLAD se encarga de cargar dinámicamente las direcciones de memoria de esas funciones en tiempo de ejecución.

Relación: Complementa a opengl32.lib. Sin GLAD, no podrías usar funciones modernas de OpenGL (como shaders, buffers, etc.), porque Windows solo expone las más antiguas directamente.

## GLM
Rol: Biblioteca matemática inspirada en GLSL.

Función: Proporciona vectores, matrices y operaciones matemáticas necesarias para gráficos 3D (transformaciones, proyecciones, etc.).

Relación: No interactúa directamente con la GPU. Es una herramienta para preparar los datos que luego enviarás a OpenGL mediante GLAD y opengl32.lib.

## Drivers de la GPU
Rol: Software del fabricante (NVIDIA, AMD, Intel).

Función: Implementa realmente las funciones de OpenGL y traduce tus llamadas en instrucciones que la GPU entiende.

Relación: Son el último eslabón. GLFW crea el contexto, opengl32.lib conecta con el sistema, GLAD carga las funciones modernas, GLM prepara los datos, y los drivers ejecutan todo en el hardware.

## Resumen
Relación general (flujo simplificado)
GLFW → crea ventana y contexto.

opengl32.lib → enlaza funciones básicas de OpenGL.

GLAD → carga funciones modernas de OpenGL desde los drivers.

GLM → prepara matemáticamente los datos (matrices, vectores).

Drivers GPU → ejecutan las instrucciones en el hardware gráfico.

En otras palabras:
GLFW te da el espacio, opengl32.lib conecta con el sistema, GLAD abre la puerta a las funciones modernas, GLM te da las herramientas matemáticas, y los drivers de la GPU hacen el trabajo pesado.
