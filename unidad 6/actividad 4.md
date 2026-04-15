1. Explica con tus propias palabras el propósito del patrón State. ¿Cuándo es útil aplicarlo?


2. Dibuja un diagrama de estados simple para la clase Particle. Muestra los diferentes estados (Normal, Attract, Repel, Stop) como nodos y las transiciones entre ellos como flechas etiquetadas con el evento que las causa (p. ej., la tecla presionada: ‘n’, ‘a’, ‘r’, ‘s’).


3. Describe las ventajas de usar el patrón State en Particle en lugar de tener un miembro std::string estadoActual y usar un gran if/else if/else o switch dentro de Particle::update() para cambiar el comportamiento. Piensa en cohesión, extensibilidad (añadir nuevos estados) y el Principio Abierto/Cerrado (Open/Closed Principle).


4. ¿Qué responsabilidad tienen los métodos onEnter y onExit en el patrón State? Proporciona un ejemplo de por qué podrían ser útiles (incluso si no se usan mucho en todos los estados de este caso de estudio). Por ejemplo, ¿Qué podrías hacer en onEnter para AttractState o en onExit para StopState?

