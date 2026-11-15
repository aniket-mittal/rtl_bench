`timescale 1ns / 1ps

module origen_210271 #(
    parameter PTR_WIDTH = 3
)(
    input clk,
    input clear,
    input wr,
    input [7:0] data_in,
    input rd,
    output reg [7:0] data_out,
    output reg data_out_valid,
    output reg empty,
    output reg full
);

localparam FIFO_DEPTH = 2 ** PTR_WIDTH;

reg [7:0] data_mem [0:FIFO_DEPTH-1];
reg [PTR_WIDTH-1:0] nxt_wr;
reg [PTR_WIDTH-1:0] nxt_rd;
reg [PTR_WIDTH:0] data_counter;

always @(posedge clk or posedge clear) begin
    if (clear) begin
        nxt_wr <= 0;
        nxt_rd <= 0;
        data_counter <= 0;
        data_out_valid <= 0;
        data_out <= 0;
    end
    else begin
        if (wr && !full) begin
            data_mem[nxt_wr] <= data_in;
            nxt_wr <= nxt_wr + 1;
            data_counter <= data_counter + 1;
        end
        if (rd && !empty) begin
            data_out <= data_mem[nxt_rd];
            data_out_valid <= 1;
            nxt_rd <= nxt_rd + 1;
            data_counter <= data_counter - 1;
        end
        else begin
            data_out_valid <= 0;
        end
    end
end

always @* begin
    empty = (data_counter == 0);
    full = (data_counter == FIFO_DEPTH);
end

endmodule