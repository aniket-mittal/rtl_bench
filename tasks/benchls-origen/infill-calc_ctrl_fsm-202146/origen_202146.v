module origen_202146(
    input [3:0] comandControler,
    output reg [3:0] tULAControler,
    output reg [2:0] tXControler,
    output reg [2:0] tYControler,
    output reg [2:0] tZControler
);

parameter CLR = 4'b0000;
parameter CLRLD = 4'b0001;
parameter LOADX = 4'b0010;
parameter ADD = 4'b0011;
parameter SUB = 4'b0100;
parameter MULT = 4'b0101;
parameter DIV = 4'b0110;
parameter MIN = 4'b0111;
parameter MAX = 4'b1000;
parameter DISP = 4'b1001;
parameter END = 4'b1010;

parameter uADD = 4'b0000;
parameter uSUB = 4'b0001;
parameter uCOMP = 4'b0010;
parameter uIGUAL = 4'b0011;
parameter uMAIOR = 4'b0100;
parameter uMENOR = 4'b0101;
parameter uAND = 4'b0110;
parameter uOR = 4'b0111;
parameter uMULT = 4'b1000;
parameter uDIV = 4'b1001;

parameter rHOLD = 3'b000;
parameter rRESET = 3'b001;
parameter rLOAD = 3'b010;
parameter rShiftLeft = 3'b011;
parameter rShiftRight = 3'b100;

[MASKED]

endmodule