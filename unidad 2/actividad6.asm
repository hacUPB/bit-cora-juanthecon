@sum   //sum = 0
M=0
@j   // j = 0
M=0

(loop)
    @j
    D=M
    @10
    D=D-A
    @END
    D;JGE  //si j >= 10

    // arr[j]
    
    @j
    D=M
    @100
    D=D+A
    A=D
    D=M

    @sum
    M=M+D

    @j
    M=M+1

    @loop
    0;JMP
        
(END)
    @END
    0;JMP