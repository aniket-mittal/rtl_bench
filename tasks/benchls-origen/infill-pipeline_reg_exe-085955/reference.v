module origen_085955 (
    input wire clk_i,
    input wire rsn_i,
    input wire stall_core_i,
    input wire decode_stall_i,
    input wire kill_i,
    input wire [31:0] dec_read_data_a_i,
    input wire [31:0] dec_read_data_b_i,
    input wire [4:0] dec_write_addr_i,
    input wire dec_int_write_enable_i,
    input wire dec_tlbwrite_i,
    input wire dec_idtlb_i,
    input wire [3:0] dec_exc_bits_i,
    input wire [31:0] dec_instruction_i,
    input wire [31:0] dec_pc_i,
    input wire [31:0] dec_pred_pc_i,
    input wire dec_prediction_i,
    input wire dec_taken_i,

    output reg [31:0] exe_read_data_a_o,
    output reg [31:0] exe_read_data_b_o,
    output reg [4:0] exe_write_addr_o,
    output reg exe_int_write_enable_o,
    output reg exe_tlbwrite_o,
    output reg exe_idtlb_o,
    output reg [3:0] exe_exc_bits_o,
    output reg [31:0] exe_instruction_o,
    output reg [31:0] exe_pc_o,
    output reg [31:0] exe_pred_pc_o,
    output reg exe_prediction_o,
    output reg exe_taken_o
);

    reg [31:0] read_data_a_r, read_data_b_r;
    reg [4:0] write_addr_r;
    reg int_write_enable_r, tlbwrite_r, idtlb_r;
    reg [3:0] exc_bits_r;
    reg [31:0] instruction_r, pc_r, pred_pc_r;
    reg prediction_r, taken_r;

    always @(posedge clk_i or negedge rsn_i) begin
        if (!rsn_i) begin
            read_data_a_r <= 32'b0;
            read_data_b_r <= 32'b0;
            write_addr_r <= 5'b0;
            int_write_enable_r <= 1'b0;
            tlbwrite_r <= 1'b0;
            idtlb_r <= 1'b0;
            exc_bits_r <= 4'b0;
            instruction_r <= 32'h033; // NOP
            pc_r <= 32'b0;
            pred_pc_r <= 32'b0;
            prediction_r <= 1'b0;
            taken_r <= 1'b0;
        end else if (kill_i || (decode_stall_i && !stall_core_i)) begin
            read_data_a_r <= 32'b0;
            read_data_b_r <= 32'b0;
            write_addr_r <= 5'b0;
            int_write_enable_r <= 1'b0;
            tlbwrite_r <= 1'b0;
            idtlb_r <= 1'b0;
            exc_bits_r <= 4'b0;
            instruction_r <= 32'h033; // NOP
            pc_r <= 32'b0;
            pred_pc_r <= 32'b0;
            prediction_r <= 1'b0;
            taken_r <= 1'b0;
        end else if (!stall_core_i && !decode_stall_i) begin
            read_data_a_r <= dec_read_data_a_i;
            read_data_b_r <= dec_read_data_b_i;
            write_addr_r <= dec_write_addr_i;
            int_write_enable_r <= dec_int_write_enable_i;
            tlbwrite_r <= dec_tlbwrite_i;
            idtlb_r <= dec_idtlb_i;
            exc_bits_r <= dec_exc_bits_i;
            instruction_r <= dec_instruction_i;
            pc_r <= dec_pc_i;
            pred_pc_r <= dec_pred_pc_i;
            prediction_r <= dec_prediction_i;
            taken_r <= dec_taken_i;
        end
    end

    always @(*) begin
        if (stall_core_i) begin
            exe_read_data_a_o = 32'b0;
            exe_read_data_b_o = 32'b0;
            exe_write_addr_o = 5'b0;
            exe_int_write_enable_o = 1'b0;
            exe_tlbwrite_o = 1'b0;
            exe_idtlb_o = 1'b0;
            exe_exc_bits_o = 4'b0;
            exe_instruction_o = 32'h033; // NOP
            exe_pc_o = 32'b0;
            exe_pred_pc_o = 32'b0;
            exe_prediction_o = 1'b0;
            exe_taken_o = 1'b0;
        end else begin
            exe_read_data_a_o = read_data_a_r;
            exe_read_data_b_o = read_data_b_r;
            exe_write_addr_o = write_addr_r;
            exe_int_write_enable_o = int_write_enable_r;
            exe_tlbwrite_o = tlbwrite_r;
            exe_idtlb_o = idtlb_r;
            exe_exc_bits_o = exc_bits_r;
            exe_instruction_o = instruction_r;
            exe_pc_o = pc_r;
            exe_pred_pc_o = pred_pc_r;
            exe_prediction_o = prediction_r;
            exe_taken_o = taken_r;
        end
    end

endmodule