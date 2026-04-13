1. Explica con tus propias palabras el propósito del patrón Observer. ¿Qué problema resuelve?
avisa a la lista de observer cuando cambia de estado el sujeto, evita que el sujeto tenga que llamar muchos metodos y solo tenga que notificar a uno


2. Dibuja un diagrama que muestre la relación entre Subject, Observer, ofApp y Particle en el caso de estudio, indicando quién es el Sujeto y quiénes los Observadores.


3. Construye un diagrama de secuencia que muestre cómo funciona el patrón Observer al presionar una tecla.


4. ¿Qué ventajas crees que ofrece usar el patrón Observer en esta aplicación en comparación con, por ejemplo, que ofApp::update recorriera todas las partículas y les dijera directamente que cambien su comportamiento basado en una variable global? Piensa en términos de acoplamiento y extensibilidad.

solo necesita enviar un evento y no necesita ir a todas las funciones que tengan que ver con particulas y avisar los cambios, se pueden añadir los observvadores que sean y no se va a afectar, cada observador puede reaccionar de una manera diferente
