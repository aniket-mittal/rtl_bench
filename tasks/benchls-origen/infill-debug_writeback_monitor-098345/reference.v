module origen_098345 (
    input wire clk_i,
    input wire rst_i,
    input wire [31:0] debug_pc_i,
    input wire debug_wena_i,
    input wire [4:0] debug_wd_i,
    input wire [31:0] debug_wdata_i,
    
    output reg [31:0] debug_wb_pc_o,
    output reg [3:0] debug_wb_rf_wen_o,
    output reg [4:0] debug_wb_rf_wnum_o,
    output reg [31:0] debug_wb_rf_wdata_o
);

reg pre_write;
reg [31:0] pre_pc;

always @(posedge clk_i) begin
    if (rst_i) begin
        debug_wb_pc_o <= 32'b0;
        debug_wb_rf_wen_o <= 4'b0000;
        debug_wb_rf_wnum_o <= 5'b0;
        debug_wb_rf_wdata_o <= 32'b0;
        pre_write <= 1'b0;
        pre_pc <= 32'b0;
    end else begin
        if (debug_pc_i != pre_pc) begin
            debug_wb_pc_o <= debug_pc_i;
            debug_wb_rf_wnum_o <= debug_wd_i;
            debug_wb_rf_wdata_o <= debug_wdata_i;
            
            if (debug_wena_i) begin
                debug_wb_rf_wen_o <= 4'b1111;
                pre_write <= 1'b1;
            end else begin
                debug_wb_rf_wen_o <= 4'b0000;
                pre_write <= 1'b0;
            end
        end else begin
            pre_write <= pre_write & debug_wena_i;
            debug_wb_pc_o <= debug_pc_i;
            debug_wb_rf_wnum_o <= debug_wd_i;
            debug_wb_rf_wdata_o <= debug_wdata_i;
            
            if (pre_write & debug_wena_i) begin
                debug_wb_rf_wen_o <= 4'b1111;
            end else begin
                debug_wb_rf_wen_o <= 4'b0000;
            end
        end
        
        pre_pc <= debug_pc_i;
    end
end

endmodule