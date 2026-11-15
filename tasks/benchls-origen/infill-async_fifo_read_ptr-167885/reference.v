module origen_167885 #(
    parameter FIFO_DEPTH = 8
) (
    // Inputs
    input       rd_en,
    input       rd_clk,
    input       rd_rst_n,
    input [FIFO_DEPTH-1:0] wr_addr_glay,
    
    // Outputs
    output reg [FIFO_DEPTH-1:0] rd_addr_bin,
    output reg [FIFO_DEPTH-1:0] rd_addr_glay,
    output reg rd_empty
);

    // Binary-coded read address pointer
    always @(posedge rd_clk or negedge rd_rst_n) begin
        if (~rd_rst_n) begin
            rd_addr_bin <= 0;
        end else if (rd_en) begin
            rd_addr_bin <= rd_addr_bin + 1'b1;
        end
    end

    // Gray-coded read address pointer
    always @(posedge rd_clk or negedge rd_rst_n) begin
        if (~rd_rst_n) begin
            rd_addr_glay <= 0;
        end else begin
            rd_addr_glay <= (rd_addr_bin >> 1) ^ rd_addr_bin;
        end
    end

    // Synchronized write address pointer
    reg [FIFO_DEPTH-1:0] wr_addr_glay_r1, wr_addr_glay_r2;
    always @(posedge rd_clk or negedge rd_rst_n) begin
        if (~rd_rst_n) begin
            wr_addr_glay_r1 <= 0;
            wr_addr_glay_r2 <= 0;
        end else begin
            wr_addr_glay_r1 <= wr_addr_glay;
            wr_addr_glay_r2 <= wr_addr_glay_r1;
        end
    end

    // FIFO empty flag
    always @(posedge rd_clk or negedge rd_rst_n) begin
        if (~rd_rst_n) begin
            rd_empty <= 1'b1;
        end else begin
            rd_empty <= (rd_addr_glay == wr_addr_glay_r2);
        end
    end

endmodule