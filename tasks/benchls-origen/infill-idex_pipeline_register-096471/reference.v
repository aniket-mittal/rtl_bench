module origen_096471 (
    input wire clk,
    input wire rst,
    
    // Control signals
    input wire mem_to_reg_in,
    input wire mem_write_in,
    input wire mem_read_in,
    input wire reg_write_in,
    input wire reg_dst_in,
    input wire alu_src_in,
    input wire [2:0] alu_op_in,
    input wire Rtype_in,
    input wire lw_in,
    input wire sw_in,
    input wire j_in,
    input wire beq_in,
    input wire bne_in,
    input wire nop_in,
    
    // Data signals
    input wire [31:0] pc_plus4_in,
    input wire [31:0] read_data1_in,
    input wire [31:0] read_data2_in,
    input wire [31:0] address_in,
    
    // Register addresses
    input wire [4:0] rs_in,
    input wire [4:0] rt_in,
    input wire [4:0] rd_in,
    
    // Output signals
    output reg mem_to_reg_out,
    output reg mem_write_out,
    output reg mem_read_out,
    output reg reg_write_out,
    output reg reg_dst_out,
    output reg alu_src_out,
    output reg [2:0] alu_op_out,
    output reg Rtype_out,
    output reg lw_out,
    output reg sw_out,
    output reg j_out,
    output reg beq_out,
    output reg bne_out,
    output reg nop_out,
    output reg [31:0] pc_plus4_out,
    output reg [31:0] read_data1_out,
    output reg [31:0] read_data2_out,
    output reg [31:0] address_out,
    output reg [4:0] rs_out,
    output reg [4:0] rt_out,
    output reg [4:0] rd_out
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all outputs to default values
            mem_to_reg_out <= 1'b0;
            mem_write_out <= 1'b0;
            mem_read_out <= 1'b0;
            reg_write_out <= 1'b0;
            reg_dst_out <= 1'b0;
            alu_src_out <= 1'b0;
            alu_op_out <= 3'b000;
            Rtype_out <= 1'b0;
            lw_out <= 1'b0;
            sw_out <= 1'b0;
            j_out <= 1'b0;
            beq_out <= 1'b0;
            bne_out <= 1'b0;
            nop_out <= 1'b1;
            pc_plus4_out <= 32'b0;
            read_data1_out <= 32'b0;
            read_data2_out <= 32'b0;
            address_out <= 32'b0;
            rs_out <= 5'b0;
            rt_out <= 5'b0;
            rd_out <= 5'b0;
        end
        else begin
            // Update all outputs with input values
            mem_to_reg_out <= mem_to_reg_in;
            mem_write_out <= mem_write_in;
            mem_read_out <= mem_read_in;
            reg_write_out <= reg_write_in;
            reg_dst_out <= reg_dst_in;
            alu_src_out <= alu_src_in;
            alu_op_out <= alu_op_in;
            Rtype_out <= Rtype_in;
            lw_out <= lw_in;
            sw_out <= sw_in;
            j_out <= j_in;
            beq_out <= beq_in;
            bne_out <= bne_in;
            nop_out <= nop_in;
            pc_plus4_out <= pc_plus4_in;
            read_data1_out <= read_data1_in;
            read_data2_out <= read_data2_in;
            address_out <= address_in;
            rs_out <= rs_in;
            rt_out <= rt_in;
            rd_out <= rd_in;
        end
    end

endmodule