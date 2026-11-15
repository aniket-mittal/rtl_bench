module origen_050630 #(
    parameter WIDTH = 32,
    parameter DEPTH_IN_BITS = 3,
    parameter MAX_ITEMS = 5
)(
    input wire clk,
    input wire reset,
    input wire req_r,
    input wire we,
    input wire [WIDTH-1:0] data_w,
    output reg [WIDTH-1:0] data_r,
    output reg valid_r,
    output wire full,
    output wire empty
);

    localparam DEPTH = 1 << DEPTH_IN_BITS;

    reg [WIDTH-1:0] buffer [0:DEPTH-1];
    reg [DEPTH_IN_BITS-1:0] addr_r, addr_w;
    reg [DEPTH_IN_BITS-1:0] addr_r_next, addr_w_next;
    reg [DEPTH_IN_BITS:0] item_count;

    wire [DEPTH_IN_BITS:0] item_count_next;
    
    assign empty = (addr_r == addr_w);
    assign full = (item_count >= MAX_ITEMS);
    
    assign item_count_next = addr_w - addr_r;

    [MASKED]

endmodule