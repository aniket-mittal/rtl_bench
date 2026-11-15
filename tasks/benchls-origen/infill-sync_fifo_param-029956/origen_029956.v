module origen_029956 #(
    parameter WIDTH = 8,
    parameter DEPTH = 16
) (
    input wire CLK,
    input wire RSTN,
    input wire RD_ENB,
    input wire WR_ENB,
    input wire [WIDTH-1:0] DATA_IN,
    output reg [WIDTH-1:0] DATA_OUT,
    output wire EMPTY,
    output wire FULL
);

    function integer logb2;
        input integer depth;
        integer i;
        begin
            for (i = 0; depth > 0; i = i + 1)
                depth = depth >> 1;
            logb2 = i - 1;
        end
    endfunction

    localparam ADDR_WIDTH = logb2(DEPTH);

    reg [ADDR_WIDTH-1:0] rd_counter;
    reg [ADDR_WIDTH-1:0] wr_counter;
    reg [ADDR_WIDTH:0] ele_count;
    reg [WIDTH-1:0] memory [0:DEPTH-1];

    assign EMPTY = (ele_count == 0);
    assign FULL = (ele_count == DEPTH);

    [MASKED]

endmodule