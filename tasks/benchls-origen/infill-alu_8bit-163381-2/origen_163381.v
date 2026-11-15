module origen_163381(
    input  [7:0] opd_1,
    input  [7:0] opd_2,
    input  [3:0] opcode,
    output [15:0] res,
    output c_flag,
    output z_flag
);

    parameter ADD   = 4'b0000;
    parameter ADDC  = 4'b0001;
    parameter SUB   = 4'b0010;
    parameter SUBB  = 4'b0011;
    parameter DEC   = 4'b0100;
    parameter INC   = 4'b0101;
    parameter TRAN  = 4'b0110;
    parameter AND   = 4'b0111;
    parameter OR    = 4'b1000;
    parameter XOR   = 4'b1001;
    parameter NOT   = 4'b1010;
    parameter SHL   = 4'b1011;
    parameter SHR   = 4'b1100;

    reg [15:0] result;
    reg c_flag_reg, z_flag_reg;

    [MASKED]

    assign res = result;
    assign c_flag = c_flag_reg;
    assign z_flag = z_flag_reg;

endmodule