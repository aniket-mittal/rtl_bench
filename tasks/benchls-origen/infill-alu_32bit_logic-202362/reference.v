module origen_202362(
    input wire [31:0] opA,
    input wire [31:0] opB,
    input wire [2:0] sel,
    input wire clk,
    output wire [31:0] res,
    output wire z,
    output wire c,
    output wire v
);

reg [31:0] result;
reg zero_flag, carry_flag, overflow_flag;

always @(posedge clk) begin
    case (sel)
        3'b010: begin
            // Bitwise AND
            result <= opA & opB;
            zero_flag <= (result == 32'b0);
            carry_flag <= 1'b0;
            overflow_flag <= 1'b0;
        end
        3'b011: begin
            // Bitwise OR
            result <= opA | opB;
            zero_flag <= (result == 32'b0);
            carry_flag <= 1'b0;
            overflow_flag <= 1'b0;
        end
        3'b100: begin
            // Bitwise NOT
            result <= ~opA;
            zero_flag <= (result == 32'b0);
            carry_flag <= 1'b0;
            overflow_flag <= 1'b0;
        end
        default: begin
            result <= 32'b0;
            zero_flag <= 1'b0;
            carry_flag <= 1'b0;
            overflow_flag <= 1'b0;
        end
    endcase
end

assign res = result;
assign z = zero_flag;
assign c = carry_flag;
assign v = overflow_flag;

endmodule