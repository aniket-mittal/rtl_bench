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

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            addr_r <= 0;
            addr_w <= 0;
            addr_r_next <= 1;
            addr_w_next <= 1;
            item_count <= 0;
            valid_r <= 0;
        end else begin
            if (we && !full) begin
                buffer[addr_w] <= data_w;
                addr_w <= addr_w_next;
                addr_w_next <= addr_w_next + 1;
            end

            if (req_r && !empty) begin
                data_r <= buffer[addr_r];
                valid_r <= 1;
                addr_r <= addr_r_next;
                addr_r_next <= addr_r_next + 1;
            end else begin
                valid_r <= 0;
            end

            item_count <= item_count_next;
        end
    end

endmodule