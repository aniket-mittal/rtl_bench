module origen_104272 #(
    parameter WIDTH = 8,
    parameter LOG_DEPTH = 4
)(
    input wire clock,
    input wire reset_n,
    input wire wrreq,
    input wire [WIDTH-1:0] data,
    input wire rdreq,
    output reg [WIDTH-1:0] q,
    output wire empty,
    output wire full
);

    localparam DEPTH = 1 << LOG_DEPTH;

    reg [WIDTH-1:0] buffer [0:DEPTH-1];
    reg [LOG_DEPTH-1:0] rd_ptr, wr_ptr;
    reg [LOG_DEPTH:0] counter;

    assign empty = (counter == 0);
    assign full = (counter == DEPTH);

    [MASKED]

    // Continuous read of current data
    always @(*) begin
        q = buffer[rd_ptr];
    end

endmodule