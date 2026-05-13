## codigo triangulo interactivo
``` cpp
#include <iostream>
#include <glad/glad.h>
#include <GLFW/glfw3.h>


// Callback: ajusta el viewport cuando cambie el tamaño de la ventana
void framebuffer_size_callback(GLFWwindow* window, int width, int height) {
	glViewport(0, 0, width, height);
}

// Procesa entrada simple: cierra con ESC
void processInput(GLFWwindow* window) {
	if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
		glfwSetWindowShouldClose(window, true);
}

// Tamaño de la ventana
const unsigned int SCR_WIDTH = 400;
const unsigned int SCR_HEIGHT = 400;

// Shaders interactivos (vertex + fragment con uniforms)
const char* vertexShaderSrc = R"glsl(
    #version 460 core
    layout(location = 0) in vec3 aPos;
    uniform vec2 offset;
    void main() {
        vec3 newPos = aPos;
        newPos.x += offset.x;
        newPos.y += offset.y;
        gl_Position = vec4(newPos, 1.0);
    }
)glsl";

const char* fragmentShaderSrc = R"glsl(
    #version 460 core
    out vec4 FragColor;
    uniform vec4 ourColor;
    void main() {
        FragColor = ourColor;
    }
)glsl";

// IDs globales
unsigned int VAO, VBO;
unsigned int shaderProg = 0;

// Compila y linkea un programa de shaders con un vertex shader específico, retorna su ID
unsigned int buildShaderProgram(const char* vertexSrc) {
	int success;
	char log[512];

	unsigned int vs = glCreateShader(GL_VERTEX_SHADER);
	glShaderSource(vs, 1, &vertexSrc, nullptr);
	glCompileShader(vs);
	glGetShaderiv(vs, GL_COMPILE_STATUS, &success);
	if (!success) {
		glGetShaderInfoLog(vs, 512, nullptr, log);
		std::cerr << "ERROR VERTEX SHADER:\n" << log << "\n";
	}

	unsigned int fs = glCreateShader(GL_FRAGMENT_SHADER);
	glShaderSource(fs, 1, &fragmentShaderSrc, nullptr);
	glCompileShader(fs);
	glGetShaderiv(fs, GL_COMPILE_STATUS, &success);
	if (!success) {
		glGetShaderInfoLog(fs, 512, nullptr, log);
		std::cerr << "ERROR FRAGMENT SHADER:\n" << log << "\n";
	}

	unsigned int prog = glCreateProgram();
	glAttachShader(prog, vs);
	glAttachShader(prog, fs);
	glLinkProgram(prog);
	glGetProgramiv(prog, GL_LINK_STATUS, &success);
	if (!success) {
		glGetProgramInfoLog(prog, 512, nullptr, log);
		std::cerr << "ERROR LINKING PROGRAM:\n" << log << "\n";
	}

	glDeleteShader(vs);
	glDeleteShader(fs);
	return prog;
}

// Crea un VAO/VBO con los datos de vértices incluyendo posición, color y offset
void setupTriangle() {
	float vertices[] = {
		// pos               color               offset
		-1.0f, -1.0f, 0.0f,   0.0f, 0.0f, 0.0f,   0.1f, 0.5f,
		 0.0f, -1.0f, 0.0f,   1.0f, 0.0f, 0.0f,   0.2f, 0.5f,
		-0.5f, -0.5f, 0.0f,   0.5f, 0.5f, 0.0f,   0.15f, 0.75f
	};

	glGenVertexArrays(1, &VAO);
	glGenBuffers(1, &VBO);

	glBindVertexArray(VAO);
	glBindBuffer(GL_ARRAY_BUFFER, VBO);
	glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

	// Atributo 0: posición (3 floats)
	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)0);
	glEnableVertexAttribArray(0);

	// Atributo 1: color (3 floats) - actualmente no usado por el shader, se mantiene en VBO
	glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)(3 * sizeof(float)));
	glEnableVertexAttribArray(1);

	// Atributo 2: offset (2 floats) - actualmente no usado como atributo por el shader
	glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)(6 * sizeof(float)));
	glEnableVertexAttribArray(2);

	glBindVertexArray(0);
}

int main()
{
	// 1) Inicializar GLFW
	if (!glfwInit()) {
		std::cerr << "Fallo al inicializar GLFW\n";
		return -1;
	}
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 6);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

	// 2) Crear ventana
	GLFWwindow* mainWindow = glfwCreateWindow(SCR_WIDTH, SCR_HEIGHT, "Ventana", nullptr, nullptr);
	if (!mainWindow) {
		std::cerr << "Error creando ventana\n";
		glfwTerminate();
		return -1;
	}

	// 3) Lee el tamaño del framebuffer
	int bufferWidth, bufferHeight;
	glfwGetFramebufferSize(mainWindow, &bufferWidth, &bufferHeight);

	// 4) Callbacks 
	glfwSetFramebufferSizeCallback(mainWindow, framebuffer_size_callback);

	// 5) Cargar GLAD y recursos en contexto
	glfwMakeContextCurrent(mainWindow);

	if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)) {
		std::cerr << "Fallo al cargar GLAD\n";
		return -1;
	}

	// 6) Habilita el V-Sync
	glfwSwapInterval(1);

	// 7) Compila y linkea el programa interactivo
	shaderProg = buildShaderProgram(vertexShaderSrc);

	// 8) Genera el contenido a mostrar
	setupTriangle();

	// 9) Configura el viewport
	glViewport(0, 0, bufferWidth, bufferHeight);

	// Obtén las ubicaciones de los uniforms (una vez, antes del loop)
	glUseProgram(shaderProg);
	int offsetLocation = glGetUniformLocation(shaderProg, "offset");
	int colorLocation  = glGetUniformLocation(shaderProg, "ourColor");
	if (offsetLocation == -1)  std::cerr << "Advertencia: uniform 'offset' no encontrado\n";
	if (colorLocation == -1)   std::cerr << "Advertencia: uniform 'ourColor' no encontrado\n";

	// 10) Loop principal
	while (!glfwWindowShouldClose(mainWindow))
	{
		// 11) Manejo de eventos
		glfwPollEvents();

		// 12) Procesa la entrada
		processInput(mainWindow);

		// 13) Configura el color de fondo y limpia el framebuffer
		glClearColor(0.2f, 0.3f, 0.3f, 1.0f);
		glClear(GL_COLOR_BUFFER_BIT);

		// 14) Usa el shader interactivo
		glUseProgram(shaderProg);

		// Dibuja el triángulo y actualiza uniforms con la posición del ratón
		double xpos, ypos;
		glfwGetCursorPos(mainWindow, &xpos, &ypos);

		// Normaliza las coordenadas del ratón entre 0 y 1 (limita)
		float x = static_cast<float>(xpos) / static_cast<float>(SCR_WIDTH);
		if (x < 0.0f) x = 0.0f;
		if (x > 1.0f) x = 1.0f;
		float y = static_cast<float>(ypos) / static_cast<float>(SCR_HEIGHT);
		if (y < 0.0f) y = 0.0f;
		if (y > 1.0f) y = 1.0f;

		// Envío el color (usa x,y como componentes R,G)
		if (colorLocation != -1)
			glUniform4f(colorLocation, x, y, 0.0f, 1.0f);

		// Envío el offset del triángulo convertido a NDC [-1,1] con inversión en Y
		if (offsetLocation != -1)
			glUniform2f(offsetLocation, x * 2.0f - 1.0f, 1.0f - y * 2.0f);

		glBindVertexArray(VAO);
		glDrawArrays(GL_TRIANGLES, 0, 3);

		// 16) Intercambia buffers y muestra el contenido
		glfwSwapBuffers(mainWindow);
	}

	// 17) Limpieza
	glDeleteVertexArrays(1, &VAO);
	glDeleteBuffers(1, &VBO);
	glDeleteProgram(shaderProg);

	glfwDestroyWindow(mainWindow);
	glfwTerminate();
	return 0;
}
```

## captura triangulo
![alt text](<imagenees/triangulo maus1.jpeg>)![alt text](<imagenees/triangulo maus2.jpeg>)
## explicacion proceso de normalizacion
El mouse entrega coordenadas en pixeles de ventana: 
por ejemplo, si la ventana mide 400×400, el rango va de (0,0) en la esquina superior izquierda hasta (400,400) en la esquina inferior derecha.

Para que OpenGL pueda usarlas, primero las llevas a un rango 0–1 dividiendo por el ancho y alto de la ventana.

Luego las limitas para que no salgan de ese rango.

Normalización a NDC
OpenGL espera coordenadas en el sistema NDC, que va de -1 a 1 en ambos ejes.

Por eso transformas el rango 0–1 a -1–1:

Así, el punto (0,0) en la esquina superior izquierda se convierte en (-1,1) en NDC, y el centro de la ventana (200,200) se convierte en (0,0).

Relación con OpenGL
OpenGL dibuja todo en NDC: cualquier vértice fuera de [-1,1] no aparece en pantalla.

Al normalizar el mouse a NDC, puedes usarlo directamente como uniform en tus shaders para mover o colorear objetos, porque ya está en el mismo sistema de referencia que OpenGL utiliza para renderizar.
