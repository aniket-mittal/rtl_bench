module origen_163526(
    input ck,
    input p,
    input [3:0] w,
    output reg ce,
    output reg enter,
    output reg bs,
    output reg ss,
    output reg load,
    output reg updw,
    output reg reset
);

reg [3:0] state;
parameter CHEQUEAR_P = 4'b0000;
parameter VALOR_DE_W = 4'b0001;
parameter CARGAR_REG = 4'b0010;
parameter RST = 4'b0011;
parameter ENTRA_TECLA = 4'b0100;
parameter LD = 4'b0101;
parameter BACKS = 4'b0110;
parameter SOS = 4'b0111;
parameter UP_DW = 4'b1000;

[MASKED]

endmodule