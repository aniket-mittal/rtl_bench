module rtlpp_06366 (
    clk,
    rst,
    in,
    o
);
input   clk;
input   rst;
input   [1:0] in;
output  o;

wire gnd = 1'b0;
wire vcc = 1'b1;
wire unknown = 1'bx;
wire devclrn = vcc;
wire devpor = vcc;
wire devoe = vcc;

wire clk_in, clk_out, rst_in, in0, in1, selector1, selector2, selector3, yB, yC, o_reg;

// Input and clock handling
assign clk_in = clk;
assign rst_in = rst;
assign in0 = in[0];
assign in1 = in[1];

// Selector 1 Combinational Logic
assign selector1 = (!in0 & !in1 & !yB & !yC);

// Flip-Flop for y.B
reg yB_reg;
always @(posedge clk_in or negedge rst_in) begin
    if (!rst_in) yB_reg <= gnd;
    else         yB_reg <= selector1;
end
assign yB = yB_reg;

// Selector 2 Combinational Logic
assign selector2 = (!in0 & !in1 & !yC & yB);

// Flip-Flop for y.C
reg yC_reg;
always @(posedge clk_in or negedge rst_in) begin
    if (!rst_in) yC_reg <= gnd;
    else         yC_reg <= selector2;
end
assign yC = yC_reg;

// Selector 3 Combinational Logic
assign selector3 = (!in0 & !in1 & !yC & !yB);

// Output Flip-Flop
reg o_reg0;
always @(posedge clk_in or negedge rst_in) begin
    if (!rst_in) o_reg0 <= gnd;
    else         o_reg0 <= selector3;
end
assign o_reg = o_reg0;
assign o = o_reg;

endmodule