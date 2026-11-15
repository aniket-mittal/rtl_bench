module origen_041830 #(
    parameter WIDTH = 32
) (
    input wire alu_op_mul,
    input wire clk,
    input wire ex_freeze,
    input wire reset,
    input wire [WIDTH-1:0] a_in,
    input wire [WIDTH-1:0] b_in,
    output reg [2*WIDTH-1:0] mul_prod_r,
    output wire mul_stall
);

reg [5:0] serial_mul_cnt;
reg mul_free;
reg [WIDTH-1:0] x, y;
reg ex_freeze_r;

wire start_mul = alu_op_mul && mul_free && !ex_freeze;

assign mul_stall = (serial_mul_cnt != 6'd0) || (alu_op_mul && !ex_freeze);

[MASKED]

// Debug display
always @(posedge clk) begin
    if (alu_op_mul && !ex_freeze && !reset)
        ;
end

endmodule