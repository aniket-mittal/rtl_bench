module origen_131626 (
    input wire ram_full_i,
    input wire wr_clk,
    input wire rst_full_ff_i,
    input wire [7:0] RD_PNTR_WR,
    input wire wr_en,
    input wire \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ,
    input wire [31:0] din,
    input wire rd_clk,
    input wire rd_en,
    
    output reg full,
    output reg ram_full_fb_i_reg,
    output reg [31:0] Q,
    output wire [3:0] WEBWE,
    output wire [31:0] \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    output reg [7:0] \gic0.gc0.count_d2_reg[7] ,
    output reg [7:0] wr_data_count
);

    // Memory declaration
    reg [31:0] mem [0:31];
    
    // Read and write pointers
    reg [4:0] wr_ptr, rd_ptr;
    reg [4:0] wr_ptr_gray, rd_ptr_gray;
    
    // Full and empty flags
    reg empty;
    
    // Gray code conversion function
    function [4:0] bin2gray;
        input [4:0] bin;
        begin
            bin2gray = bin ^ (bin >> 1);
        end
    endfunction
    
    // Binary counter for write pointer
    always @(posedge wr_clk or posedge \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ) begin
        if (\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ) begin
            wr_ptr <= 5'b0;
            wr_ptr_gray <= 5'b0;
        end else if (wr_en && !full) begin
            wr_ptr <= wr_ptr + 1;
            wr_ptr_gray <= bin2gray(wr_ptr + 1);
        end
    end
    
    // Binary counter for read pointer
    always @(posedge rd_clk or posedge \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ) begin
        if (\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ) begin
            rd_ptr <= 5'b0;
            rd_ptr_gray <= 5'b0;
        end else if (rd_en && !empty) begin
            rd_ptr <= rd_ptr + 1;
            rd_ptr_gray <= bin2gray(rd_ptr + 1);
        end
    end
    
    // Write operation
    always @(posedge wr_clk) begin
        if (wr_en && !full) begin
            mem[wr_ptr] <= din;
        end
    end
    
    // Read operation
    always @(posedge rd_clk) begin
        if (rd_en && !empty) begin
            Q <= mem[rd_ptr];
        end
    end
    
    // Full and empty flags
    always @(posedge wr_clk or posedge rst_full_ff_i) begin
        if (rst_full_ff_i) begin
            full <= 1'b0;
            ram_full_fb_i_reg <= 1'b0;
        end else begin
            full <= (wr_ptr_gray == {~rd_ptr_gray[4:3], rd_ptr_gray[2:0]});
            ram_full_fb_i_reg <= full;
        end
    end
    
    always @(posedge rd_clk or posedge \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ) begin
        if (\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ) begin
            empty <= 1'b1;
        end else begin
            empty <= (rd_ptr_gray == wr_ptr_gray);
        end
    end
    
    // Write data count
    always @(posedge wr_clk or posedge \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ) begin
        if (\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] ) begin
            wr_data_count <= 8'b0;
        end else begin
            wr_data_count <= wr_ptr - rd_ptr;
        end
    end
    
    // Output assignments
    assign WEBWE = {4{wr_en & ~full}};
    assign \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram = mem[rd_ptr];
    
    always @(posedge wr_clk) begin
        \gic0.gc0.count_d2_reg[7] <= wr_ptr;
    end

endmodule