    @0
    D=A
    @12
    M=D       // RAM[12] = 0 (acomulador)

    @1
    D=A
    @13
    M=D       // RAM[13] = 1 (contador)

    (LOOP)
    @13
    D=M       // D = contador
    @6
    D=D-A     // D = contador - 6
    @END
    D;JEQ     // Si contador == 6 (ya se conto hasta 5)

    @13
    D=M       // D = contador
    @12
    M=M+D     // RAM[12] += contador

    @13
    M=M+1     // contador++

    @LOOP
    0;JMP     // repetir

(END)
    @END
    0;JMP