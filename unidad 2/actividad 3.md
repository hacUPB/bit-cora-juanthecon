## comentarios
en el codigo 1 se dibuja la linea y se mueve hacia los lados correspondientes pero no se borra (solucion en el codigo 2)



## codigo 1
```asm
@pos
M=0        // posición inicial

(LOOP)
    @KBD
    D=M

    @100    // tecla 'd'
    D=D-A
    @RIGHT
    D;JEQ

    @KBD
    D=M
    @105    // tecla 'i'
    D=D-A
    @LEFT
    D;JEQ

    @DRAW
    0;JMP

(RIGHT)
    @pos
    M=M+1
    @DRAW
    0;JMP

(LEFT)
    @pos
    M=M-1
    @DRAW
    0;JMP

(DRAW)
    @SCREEN
    D=A
    @addr
    M=0
    M=D

    @pos
    D=M
    @addr
    M=D+M

    @addr
    A=M
    M=-1   // dibuja línea horizontal

    @LOOP
    0;JMP

```

## codigo 2
```asm
@pos
M=0        // posición actual
@oldpos
M=0        // posición anterior

(LOOP)
    @KBD
    D=M

    // tecla 'd'
    @100
    D=D-A
    @RIGHT
    D;JEQ

    // tecla 'i'
    @KBD
    D=M
    @105
    D=D-A
    @LEFT
    D;JEQ

    @DRAW
    0;JMP

(RIGHT)
    @pos
    M=M+1
    @DRAW
    0;JMP

(LEFT)
    @pos
    M=M-1
    @DRAW
    0;JMP

(DRAW)
    // borrar línea anterior
    @20480   // fila central
    D=A
    @oldpos
    D=D+M
    A=D
    M=0

    // dibujar nueva línea
    @20480   // fila central
    D=A
    @pos
    D=D+M
    A=D
    M=-1

    // actualizar oldpos
    @pos
    D=M
    @oldpos
    M=D

    @LOOP
    0;JMP

```
