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
