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
    0;JMP     //bucle para terminar
