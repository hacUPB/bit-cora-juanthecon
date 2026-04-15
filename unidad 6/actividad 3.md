## 1. Explica con tus propias palabras el propósito del patrón Factory Method (o Simple Factory, en este caso). ¿Qué problema principal aborda en la creación de objetos?

Sirve para centralizar la creación de objetos, evitando que el código cliente tenga que conocer los detalles de construcción. El problema que aborda es la dependencia directa de clases concretas, ofreciendo una forma más flexible y organizada de instanciar objetos.


## 2. ¿Qué ventajas aporta el uso de ParticleFactory en ofApp::setup en comparación con instanciar y configurar las partículas directamente allí? Piensa en términos de organización del código (SRP - Single Responsibility Principle), legibilidad y facilidad para añadir nuevos tipos de partículas en el futuro.

SRP: separa la responsabilidad de crear partículas de la lógica principal de la aplicación.

Legibilidad: el código en setup queda más limpio y fácil de entender.

Extensibilidad: añadir nuevos tipos de partículas no requiere modificar setup, solo la fábrica.


## 3. Imagina que quieres añadir un nuevo tipo de partícula llamada "black_hole" que tiene tamaño grande, color negro y velocidad muy lenta. Describe los pasos que necesitarías seguir para implementar esto utilizando la ParticleFactory existente. ¿Tendrías que modificar ofApp::setup? ¿Por qué sí o por qué no?

Definir en ParticleFactory::createParticle un nuevo caso "black_hole" con tamaño grande, color negro y velocidad lenta.

No es necesario modificar ofApp::setup, porque este solo llama a la fábrica con el tipo de partícula deseado. La lógica de creación está encapsulada en la fábrica.


## 4. El método createParticle en el ejemplo es estático. ¿Qué implicaciones (ventajas/desventajas) tiene esto comparado con tener una instancia de ParticleFactory y un método de instancia createParticle()?.

Ventajas del estático: más simple de usar, no requiere crear objetos de la fábrica, útil si no hay estado interno.

Desventajas: menos flexible, difícil extender si la fábrica necesita mantener configuración o estado. Con una instancia, se podría personalizar la creación según parámetros guardados en la fábrica.
