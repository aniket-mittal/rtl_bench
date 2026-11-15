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

    always @(instruction) begin
        case(opcode)
            IDLE: uAdr = 6'd34;
            NOP: uAdr = j_logic ? 6'd33 : 6'd3;
            JUMP: begin
                if (n_logic & z_logic)
                    uAdr = 6'd21;
                else if (n_logic)
                    uAdr = 6'd20;
                else if (z_logic)
                    uAdr = 6'd19;
                else
                    uAdr = 6'd18;
            end
            RSET: uAdr = 6'd4;
            MVAO: uAdr = 6'd5;
            INC: uAdr = 6'd6;
            SFTR: uAdr = 6'd7;
            SFTL: uAdr = 6'd8;
            LOAD: uAdr = j_logic ? 6'd10 : 6'd9;
            STOR: uAdr = j_logic ? 6'd12 : 6'd11;
            ADD: uAdr = j_logic ? 6'd14 : 6'd13;
            SUB: uAdr = j_logic ? 6'd16 : 6'd15;
            AND: uAdr = j_logic ? 6'd23 : 6'd22;
            OR: uAdr = j_logic ? 6'd25 : 6'd24;
            XOR: uAdr = j_logic ? 6'd27 : 6'd26;
            NOT: uAdr = j_logic ? 6'd29 : 6'd28;
            default: uAdr = 6'd0;
        endcase
    end

endmodule