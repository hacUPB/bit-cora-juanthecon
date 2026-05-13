1. Explica con tus propias palabras el propósito del patrón State. ¿Cuándo es útil aplicarlo?

Propósito del patrón State  
Permite que un objeto cambie su comportamiento dinámicamente según su estado interno, evitando condicionales extensos. Es útil cuando un objeto tiene varios modos de operación y las transiciones entre ellos deben ser claras y mantenibles.

2. Dibuja un diagrama de estados simple para la clase Particle. Muestra los diferentes estados (Normal, Attract, Repel, Stop) como nodos y las transiciones entre ellos como flechas etiquetadas con el evento que las causa (p. ej., la tecla presionada: ‘n’, ‘a’, ‘r’, ‘s’).

diagrama

    Normal --> Attract: tecla 'a'
    Normal --> Repel: tecla 'r'
    Normal --> Stop: tecla 's'

    Attract --> Normal: tecla 'n'
    Attract --> Repel: tecla 'r'
    Attract --> Stop: tecla 's'

    Repel --> Normal: tecla 'n'
    Repel --> Attract: tecla 'a'
    Repel --> Stop: tecla 's'

    Stop --> Normal: tecla 'n'


3. Describe las ventajas de usar el patrón State en Particle en lugar de tener un miembro std::string estadoActual y usar un gran if/else if/else o switch dentro de Particle::update() para cambiar el comportamiento. Piensa en cohesión, extensibilidad (añadir nuevos estados) y el Principio Abierto/Cerrado (Open/Closed Principle).


Cohesión: cada estado encapsula su propio comportamiento.

Extensibilidad: añadir un nuevo estado no requiere modificar un gran bloque condicional, solo crear una nueva clase.

Principio Abierto/Cerrado: el código existente no se toca, se amplía con nuevos estados.

Legibilidad: el flujo de lógica es más claro y modular.



4. ¿Qué responsabilidad tienen los métodos onEnter y onExit en el patrón State? Proporciona un ejemplo de por qué podrían ser útiles (incluso si no se usan mucho en todos los estados de este caso de estudio). Por ejemplo, ¿Qué podrías hacer en onEnter para AttractState o en onExit para StopState?

onEnter: inicializa recursos o configura condiciones al entrar en un estado. Ejemplo: en AttractState, activar una fuerza de atracción hacia un punto.

onExit: limpia o desactiva recursos al salir de un estado. Ejemplo: en StopState, al salir se podría reiniciar la velocidad de la partícula.
