# Actividad
se realizaron los ejercicios de Fetch-Decode-Execute

[Link a youtube](www.youtube.com)

- uno
- dos
- tres



## Actividad 3

- Identifica una instrucción que use la ALU y explica qué hace.
- ¿Para qué sirve el registro PC?
- ¿Cuál es la diferencia entre @i y @READKEYBOARD?   @i es una variable y @READKEYBOARD es para leer el teclado
- Describe qué se necesita para leer el teclado y mostrar información en la pantalla.
- Identifica un bucle en el programa y explica su funcionamiento.
- Identifica una condición en el programa y explica su funcionamiento.


## Actividad 4

Escribe un programa que compare el valor almacenado en la dirección de memoria 5 con el valor 10. Si el valor es menor que 10, guarda el valor 1 en la dirección 7. Si el valor es mayor o igual a 10, guarda el valor 0 en la dirección 7

```asm
    @5        // A = 5
    D=M       // D = RAM[5]

    @10       // A = 10
    D=D-A     // D = RAM[5] - 10

    @MENOR
    D;JLT     // Si D < 0 (RAM[5] < 10), saltar a MENOR

    @MAYORIGUAL
    0;JMP     // Si no, saltar a MAYORIGUAL

(MENOR)
    @1
    D=A       // D = 1
    @7
    M=D       // RAM[7] = 1
    @FIN
    0;JMP

(MAYORIGUAL)
    @0
    D=A       // D = 0
    @7
    M=D       // RAM[7] = 0
    @FIN
    0;JMP

(FIN)
    @FIN
    0;JMP     //bucle para terminar (IA)
```

## Actividad 5

Crea un programa que use un ciclo para sumar los números del 1 al 5 y guarde el resultado en la dirección de memoria 12

```asm

```

