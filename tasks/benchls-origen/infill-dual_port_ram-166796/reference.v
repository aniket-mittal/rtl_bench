module origen_166796 #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 10,
    parameter RAM_TYPE = "BLOCK"
)(
    input clk,
    input reset,
    input s_read_req,
    input [ADDR_WIDTH-1:0] s_read_addr,
    input s_write_req,
    input [ADDR_WIDTH-1:0] s_write_addr,
    input [DATA_WIDTH-1:0] s_write_data,
    output reg [DATA_WIDTH-1:0] s_read_data
);

    reg [DATA_WIDTH-1:0] memory [2**ADDR_WIDTH-1:0];
    reg [ADDR_WIDTH-1:0] rd_addr;
    reg [ADDR_WIDTH-1:0] wr_addr;
    reg [DATA_WIDTH-1:0] wr_data;
    reg rd_addr_v, wr_addr_v;

    always @(posedge clk) begin
        if (reset) begin
            rd_addr_v <= 0;
            wr_addr_v <= 0;
            rd_addr <= 0;
            wr_addr <= 0;
            wr_data <= 0;
            s_read_data <= 0;
        end else begin
            if (s_read_req) begin
                rd_addr <= s_read_addr;
                rd_addr_v <= 1;
            end
            if (s_write_req) begin
                wr_addr <= s_write_addr;
                wr_data <= s_write_data;
                wr_addr_v <= 1;
            end
            if (rd_addr_v) begin
                s_read_data <= memory[rd_addr];
                rd_addr_v <= 0;
            end
            if (wr_addr_v) begin
                memory[wr_addr] <= wr_data;
                wr_addr_v <= 0;
            end
        end
    end

endmodule