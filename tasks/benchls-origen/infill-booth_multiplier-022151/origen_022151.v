module origen_022151 #(parameter N = 25) (
    output reg [2*N-3:0] prod,
    output reg mult_done,
    input [N-1:0] mc, mp,
    input clk, reset, mult_term, start
);

reg [N-1:0] A, Q, M;
reg Q_1;
reg [4:0] count;
reg mult_act;

wire [N-1:0] TWOS_COMP_M;
assign TWOS_COMP_M = ~M + 1'b1;

[MASKED]

always @(A, Q) begin
    prod = {A[N-3:0], Q};
end

endmodule