module origen_068992 (
    input wire clock,
    input wire reset,
    
    // Memory stage inputs
    input wire me_reg_write,
    input wire me_mem_to_reg,
    input wire [31:0] me_mem_read_data,
    input wire [31:0] me_alu_result,
    input wire [4:0] me_rt_rd,
    
    // WriteBack stage outputs
    output reg wb_reg_write,
    output reg wb_mem_to_reg,
    output reg [31:0] wb_data_memory,
    output reg [31:0] wb_alu_result,
    output reg [4:0] wb_rt_rd
);

    // Stall signals (hardwired to 0)
    wire me_stall = 1'b0;
    wire wb_stall = 1'b0;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            wb_reg_write <= 1'b0;
            wb_mem_to_reg <= 1'b0;
            wb_data_memory <= 32'b0;
            wb_alu_result <= 32'b0;
            wb_rt_rd <= 5'b0;
        end
        else begin
            if (wb_stall) begin
                // Maintain previous values
            end
            else if (me_stall) begin
                wb_reg_write <= 1'b0;
                wb_mem_to_reg <= me_mem_to_reg;
                wb_data_memory <= me_mem_read_data;
                wb_alu_result <= me_alu_result;
                wb_rt_rd <= me_rt_rd;
            end
            else begin
                wb_reg_write <= me_reg_write;
                wb_mem_to_reg <= me_mem_to_reg;
                wb_data_memory <= me_mem_read_data;
                wb_alu_result <= me_alu_result;
                wb_rt_rd <= me_rt_rd;
            end
        end
    end

endmodule