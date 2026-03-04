## predicción:
  se suma 5 a cada valor en a,b,c

## resultado:
  el valor de a quedo igual y solo se sumo con 5 cuando se llamo la suma
  los valores de b y c quedaron con la suma de 5

  esta diferencia ocurre por que el valor de a se pasa por valor


paso por valor: se copia la variable tal cual es y sin importar cuantas veces se sume con algun otro valor no cambiará

paso por referencia: si se cambia el valor de la referencia original despues de ser llamada 

paso por puntero: cambia la direccion de la original despues de ser llamada


#include <iostream>
using namespace std;

// Paso por valor (no afecta las variables originales)
void swapPorValor(int a, int b) {
    int temp = a;
    a = b;
    b = temp;
    cout << "Dentro de swapPorValor: a=" << a << ", b=" << b << endl;
}

// Paso por referencia (sí afecta las variables originales)
void swapPorReferencia(int& a, int& b) {
    int temp = a;
    a = b;
    b = temp;
}

// Paso por puntero (sí afecta las variables originales)
void swapPorPuntero(int* a, int* b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

int main() {
    int x = 10, y = 20;

    cout << "Valores iniciales: x=" << x << ", y=" << y << endl;

    // Paso por valor
    swapPorValor(x, y);
    cout << "Despues de swapPorValor: x=" << x << ", y=" << y << endl;

    // Paso por referencia
    swapPorReferencia(x, y);
    cout << "Despues de swapPorReferencia: x=" << x << ", y=" << y << endl;

    // Paso por puntero
    swapPorPuntero(&x, &y);
    cout << "Despues de swapPorPuntero: x=" << x << ", y=" << y << endl;

    return 0;
}
