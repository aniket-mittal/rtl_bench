module origen_152307 (
    input clock,
    input reset,
    input Aeq0,
    input Apos,
    input enter,
    input [2:0] ir,
    output reg IRload,
    output reg JMPmux,
    output reg PCload,
    output reg Meminst,
    output reg MemWr,
    output reg [1:0] Asel,
    output reg Aload,
    output reg Sub,
    output reg Halt,
    output reg [3:0] showstate
);

    parameter s0 = 4'b0000, s1 = 4'b0001, s2 = 4'b0010, s3 = 4'b0011, s4 = 4'b0100;
    parameter s5 = 4'b0101, s6 = 4'b0110, s7 = 4'b0111, s8 = 4'b1000, s9 = 4'b1001;
    parameter s10 = 4'b1010;

    reg [3:0] state;
    wire light;

    [MASKED]

    assign showstate = state;
endmodule