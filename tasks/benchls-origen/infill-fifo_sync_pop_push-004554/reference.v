module origen_004554 #(
    parameter DEPTH = 4,
    parameter WIDTH = $clog2(DEPTH)
) (
    input wire i_clk,
    input wire i_reset,
    input wire [7:0] i_dat,
    input wire i_push,
    input wire i_pop,
    output reg [7:0] o_dat,
    output wire o_empty,
    output wire o_full
);

reg [7:0] buffer [0:DEPTH-1];
reg [WIDTH-1:0] rd_idx, wr_idx;
reg empty_n;

wire [WIDTH-1:0] next_wr_idx = (wr_idx == DEPTH-1) ? 0 : wr_idx + 1;
wire push_en = i_push && !o_full;
wire pop_en = i_pop && !o_empty;

reg i_push_d, i_pop_d;
wire i_push_edge = i_push && !i_push_d;
wire i_pop_edge = i_pop && !i_pop_d;

assign o_empty = !empty_n;
assign o_full = (rd_idx == wr_idx) && empty_n;

always @(posedge i_clk or posedge i_reset) begin
    if (i_reset) begin
        rd_idx <= 0;
        wr_idx <= 0;
        empty_n <= 0;
        i_push_d <= 0;
        i_pop_d <= 0;
    end else begin
        i_push_d <= i_push;
        i_pop_d <= i_pop;

        if (i_push_edge && push_en) begin
            buffer[wr_idx] <= i_dat;
            wr_idx <= next_wr_idx;
            empty_n <= 1;
        end

        if (i_pop_edge && pop_en) begin
            rd_idx <= (rd_idx == DEPTH-1) ? 0 : rd_idx + 1;
            empty_n <= (rd_idx != wr_idx) || i_push_edge;
        end
    end
end

always @(posedge i_clk) begin
    o_dat <= buffer[rd_idx];
end

endmodule