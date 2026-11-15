`timescale 1ns / 1ps

module origen_216378 #(
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 8
)
(
    input  wire                  i_clk,
    input  wire                  i_rts_n,
    input  wire [DATA_WIDTH-1:0] i_data,
    input  wire                  i_push,
    input  wire                  i_pop,
    output wire [DATA_WIDTH-1:0] o_data,
    output wire                  o_empty,
    output wire                  o_full
);

localparam FIFO_WIDTH = clogb2(FIFO_DEPTH-1);

reg [FIFO_WIDTH-1:0] head;
reg [FIFO_WIDTH-1:0] tail;
reg [FIFO_WIDTH:0]   counter;

reg [DATA_WIDTH-1:0] data [FIFO_DEPTH-1:0];

assign o_data = data[tail];
assign o_empty = (counter == 0);
assign o_full = (counter == FIFO_DEPTH);

always @(posedge i_clk or negedge i_rts_n) begin
    if (!i_rts_n) begin
        head <= 0;
        tail <= 0;
        counter <= 0;
    end
    else begin
        if (i_push & !o_full) begin
            data[head] <= i_data;
            head <= (head == FIFO_DEPTH-1) ? 0 : head + 1;
            counter <= counter + 1;
        end
        if (i_pop & !o_empty) begin
            tail <= (tail == FIFO_DEPTH-1) ? 0 : tail + 1;
            counter <= counter - 1;
        end
    end
end

function integer clogb2;
    input [31:0] value;
    begin
        value = value - 1;
        for (clogb2 = 0; value > 0; clogb2 = clogb2 + 1)
            value = value >> 1;
    end
endfunction

endmodule