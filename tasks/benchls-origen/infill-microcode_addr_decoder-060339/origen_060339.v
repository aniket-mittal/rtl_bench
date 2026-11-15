module origen_060339(
    input [31:0] instruction,
    output reg [5:0] uAdr
);

    // Operation codes
    parameter IDLE = 4'b0000, NOP = 4'b0001, JUMP = 4'b0010, RSET = 4'b0011,
              MVAO = 4'b0100, INC = 4'b0101, SFTR = 4'b0110, SFTL = 4'b0111,
              LOAD = 4'b1000, STOR = 4'b1001, ADD = 4'b1010, SUB = 4'b1011,
              AND = 4'b1100, OR = 4'b1101, XOR = 4'b1110, NOT = 4'b1111;

    wire [3:0] opcode;
    wire j_bit, n_bit, z_bit;
    wire j_logic, n_logic, z_logic;

    assign opcode = instruction[31:28];
    assign j_bit = instruction[27];
    assign n_bit = instruction[18];
    assign z_bit = instruction[17];

    assign j_logic = j_bit & 1'b1;
    assign n_logic = n_bit & 1'b1;
    assign z_logic = z_bit & 1'b1;

    [MASKED]

endmodule