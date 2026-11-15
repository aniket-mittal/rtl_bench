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

    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            rd_ptr <= 0;
            wr_ptr <= 0;
            counter <= 0;
        end else begin
            if (wrreq && !full && rdreq && !empty) begin
                // Simultaneous read and write
                buffer[wr_ptr] <= data;
                q <= buffer[rd_ptr];
                rd_ptr <= rd_ptr + 1;
                wr_ptr <= wr_ptr + 1;
            end else if (wrreq && !full) begin
                // Write operation
                buffer[wr_ptr] <= data;
                wr_ptr <= wr_ptr + 1;
                counter <= counter + 1;
            end else if (rdreq && !empty) begin
                // Read operation
                q <= buffer[rd_ptr];
                rd_ptr <= rd_ptr + 1;
                counter <= counter - 1;
            end
        end
    end

    // Continuous read of current data
    always @(*) begin
        q = buffer[rd_ptr];
    end

endmodule