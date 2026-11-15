module MyAND2b4_MUSER_ALUb4(A, B, C);
    input [3:0] A;
    input [3:0] B;
    output [3:0] C;
    
    assign C = A & B;
endmodule