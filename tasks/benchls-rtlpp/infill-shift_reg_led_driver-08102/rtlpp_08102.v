module rtlpp_08102 (
    input clk,
    input rst_n,
    input [7:0] seg,
    input [5:0] sel,
    output reg shcp,
    output reg stcp,
    output reg ds,
    output oe
);

    reg [1:0] cnt;
    reg [3:0] cnt_bit;
    
    wire [13:0] data;

    assign data = {seg[7:0], sel[5:0]};

    [MASKED]

    assign oe = 1'b0;

endmodule