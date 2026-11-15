module origen_140626 (
    input wire rst,
    input wire wr_clk,
    input wire rd_clk,
    input wire [31:0] din,
    input wire wr_en,
    input wire rd_en,
    output reg [31:0] dout,
    output wire full,
    output wire empty,
    output reg [8:0] rd_data_count,
    output reg [8:0] wr_data_count
);

    // Memory array
    reg [31:0] mem [0:255];
    
    // Pointers
    reg [7:0] wr_ptr, rd_ptr;
    reg [8:0] wr_count, rd_count;
    
    // Gray code pointers for synchronization
    reg [8:0] wr_ptr_gray, rd_ptr_gray;
    reg [8:0] wr_ptr_gray_sync, rd_ptr_gray_sync;
    
    // Synchronization registers
    reg [8:0] wr_ptr_gray_sync1, rd_ptr_gray_sync1;
    
    // Full and empty flags
    assign full = (wr_count == 9'd256);
    assign empty = (rd_count == 9'd0);
    
    // Write operation
    always @(posedge wr_clk or posedge rst) begin
        if (rst) begin
            wr_ptr <= 8'd0;
            wr_count <= 9'd0;
            wr_ptr_gray <= 9'd0;
        end else if (wr_en && !full) begin
            mem[wr_ptr] <= din;
            wr_ptr <= wr_ptr + 1'b1;
            wr_count <= wr_count + 1'b1;
            wr_ptr_gray <= (wr_ptr + 1'b1) ^ ((wr_ptr + 1'b1) >> 1);
        end
    end
    
    // Read operation
    always @(posedge rd_clk or posedge rst) begin
        if (rst) begin
            rd_ptr <= 8'd0;
            rd_count <= 9'd0;
            rd_ptr_gray <= 9'd0;
            dout <= 32'd0;
        end else if (rd_en && !empty) begin
            dout <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1'b1;
            rd_count <= rd_count - 1'b1;
            rd_ptr_gray <= (rd_ptr + 1'b1) ^ ((rd_ptr + 1'b1) >> 1);
        end
    end
    
    // Synchronization of gray code pointers
    always @(posedge wr_clk or posedge rst) begin
        if (rst) begin
            rd_ptr_gray_sync1 <= 9'd0;
            rd_ptr_gray_sync <= 9'd0;
        end else begin
            rd_ptr_gray_sync1 <= rd_ptr_gray;
            rd_ptr_gray_sync <= rd_ptr_gray_sync1;
        end
    end
    
    always @(posedge rd_clk or posedge rst) begin
        if (rst) begin
            wr_ptr_gray_sync1 <= 9'd0;
            wr_ptr_gray_sync <= 9'd0;
        end else begin
            wr_ptr_gray_sync1 <= wr_ptr_gray;
            wr_ptr_gray_sync <= wr_ptr_gray_sync1;
        end
    end
    
    // Data count calculation
    always @(posedge wr_clk or posedge rst) begin
        if (rst) begin
            wr_data_count <= 9'd0;
        end else begin
            wr_data_count <= wr_count;
        end
    end
    
    always @(posedge rd_clk or posedge rst) begin
        if (rst) begin
            rd_data_count <= 9'd0;
        end else begin
            rd_data_count <= rd_count;
        end
    end
    
    // Gray to binary conversion function
    function [8:0] gray2bin;
        input [8:0] gray;
        reg [8:0] bin;
        integer i;
        begin
            bin = gray;
            for (i = 7; i >= 0; i = i - 1) begin
                bin = bin ^ (bin >> 1);
            end
            gray2bin = bin;
        end
    endfunction
    
    // Update read and write counts
    always @(posedge wr_clk or posedge rst) begin
        if (rst) begin
            wr_count <= 9'd0;
        end else begin
            wr_count <= gray2bin(wr_ptr_gray) - gray2bin(rd_ptr_gray_sync);
        end
    end
    
    always @(posedge rd_clk or posedge rst) begin
        if (rst) begin
            rd_count <= 9'd0;
        end else begin
            rd_count <= gray2bin(wr_ptr_gray_sync) - gray2bin(rd_ptr_gray);
        end
    end

endmodule