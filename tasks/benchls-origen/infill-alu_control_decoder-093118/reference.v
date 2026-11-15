module origen_093118(
    input [5:0] function_code,
    input [2:0] alu_operation,
    output reg [2:0] alu_control
);

always @(*) begin
    case(alu_operation)
        3'b010: begin
            case(function_code)
                6'h20: alu_control = 3'd0; // ADD
                6'h22: alu_control = 3'd1; // SUB
                6'h24: alu_control = 3'd2; // AND
                6'h25: alu_control = 3'd3; // OR
                6'h2A: alu_control = 3'd4; // SLT
                6'h00: alu_control = 3'd6; // SLL
                6'h02: alu_control = 3'd7; // SRL
                default: alu_control = 3'd0;
            endcase
        end
        3'b000: alu_control = 3'd0; // ADD
        3'b001: alu_control = 3'd1; // SUB
        3'b100: alu_control = 3'd0; // ADD
        3'b101: alu_control = 3'd2; // AND
        3'b111: alu_control = 3'd3; // OR
        default: alu_control = 3'd0;
    endcase
end

endmodule

