module origen_042588(
    input wire Zero,
    input wire clk,
    input wire [3:0] pc_control,
    input wire [3:0] alu_control,
    input wire [5:0] opcode,
    output reg [1:0] JumpOP
);

    // Local parameters for instruction types
    localparam BRANCH_ON_EQUAL         = 6'b000100;
    localparam BRANCH_ON_NOT_EQUAL     = 6'b000101;
    localparam JUMP                    = 6'b000010;
    localparam JUMP_AND_LINK           = 6'b000011;
    localparam JUMP_REGISTER           = 6'b000000;
    localparam JUMP_AND_LINK_REGISTER  = 6'b000000;
    localparam LOAD_WORD               = 6'b100011;
    localparam STORE_WORD              = 6'b101011;

    always @(*) begin
        if (alu_control != 4'b1111) begin
            JumpOP = 2'b00;  // No jump
        end
        else begin
            case (pc_control)
                4'b0100: begin  // Branch on Equal
                    JumpOP = (Zero) ? 2'b01 : 2'b00;
                end
                4'b0101: begin  // Branch on Not Equal
                    JumpOP = (!Zero) ? 2'b01 : 2'b00;
                end
                4'b1000: begin  // Jump Register
                    JumpOP = 2'b10;
                end
                4'b1001: begin  // Jump and Link Register
                    JumpOP = 2'b10;
                end
                4'b0010: begin  // Jump
                    JumpOP = 2'b11;
                end
                4'b0011: begin  // Jump and Link
                    JumpOP = 2'b11;
                end
                default: begin
                    JumpOP = 2'b00;  // No jump
                end
            endcase
        end
    end

endmodule