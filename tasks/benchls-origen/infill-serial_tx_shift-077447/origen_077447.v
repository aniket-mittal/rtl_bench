module origen_077447 (
    input wire clk,
    input wire nRst,
    input wire [7:0] data,
    input wire send,
    input wire get,
    output reg tx
);

    // Parameters
    localparam LOAD = 1'b0;
    localparam SEND = 1'b1;

    // Internal registers
    reg [47:0] load;
    reg [8:0] count;
    reg state;

    // State machine and data transmission logic
    [MASKED]

endmodule