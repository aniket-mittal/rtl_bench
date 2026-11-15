module origen_067717 #(
    parameter CACHE_LINE_WIDTH = 6,
    parameter TAG_WIDTH = 20,
    parameter OFFSET_WIDTH = CACHE_LINE_WIDTH - 2
)(
    input wire nrst,
    input wire clk,

    // Read interface
    output reg [TAG_WIDTH-1:0] rd_tag,
    input wire [OFFSET_WIDTH-1:0] rd_off,
    output reg [31:0] rd_data,
    output reg rd_dirty,
    output reg rd_valid,

    // Write interface
    input wire wr_write,
    input wire [TAG_WIDTH-1:0] wr_tag,
    input wire [OFFSET_WIDTH-1:0] wr_off,
    input wire [31:0] wr_data,
    input wire [3:0] wr_byte_enable,
    input wire wr_dirty,
    input wire wr_valid
);

    reg [TAG_WIDTH-1:0] tag;
    reg dirty;
    reg valid;
    reg [31:0] data [0:(1<<OFFSET_WIDTH)-1];

    always @(posedge clk or negedge nrst) begin
        if (~nrst) begin
            tag <= 0;
            dirty <= 1'b0;
            valid <= 1'b0;
        end else if (wr_write) begin
            tag <= wr_tag;
            dirty <= wr_dirty;
            valid <= wr_valid;

            if (wr_byte_enable[0]) data[wr_off][7:0] <= wr_data[7:0];
            if (wr_byte_enable[1]) data[wr_off][15:8] <= wr_data[15:8];
            if (wr_byte_enable[2]) data[wr_off][23:16] <= wr_data[23:16];
            if (wr_byte_enable[3]) data[wr_off][31:24] <= wr_data[31:24];
        end
    end

    always @(*) begin
        rd_tag = tag;
        rd_dirty = dirty;
        rd_valid = valid;
        rd_data = valid ? data[rd_off] : 32'h0;
    end

endmodule