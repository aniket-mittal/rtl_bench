module origen_103266 (
    input wire [15:0] instr_x,
    input wire [15:0] instr_rfw,
    input wire n,
    input wire z,
    output reg [2:0] alu_op,
    output reg alu_a_sel,
    output reg alu_b_sel,
    output reg alu_ld_n,
    output reg alu_ld_z,
    output reg alu_A_ld,
    output reg rfx_wr_ld,
    output reg rfy_wr_ld,
    output reg rfx_wr_sel,
    output reg rfy_wr_sel,
    output reg ldst_rd,
    output reg ldst_wr,
    output reg ldst_addr_sel,
    output reg ldst_wrdata_sel
);

    // Register addressing
    wire [2:0] rx_w = instr_rfw[11:9];
    wire [2:0] ry_w = instr_rfw[8:6];
    wire [2:0] rx_x = instr_x[11:9];
    wire [2:0] ry_x = instr_x[8:6];

    // Forwarding detection
    wire fwd_rx = (rx_x == rx_w) && (instr_rfw[3:0] != 4'b0000);
    wire fwd_ry = (ry_x == ry_w) && (instr_rfw[3:0] != 4'b0000);

    // Instruction decoding
    wire [3:0] opcode = instr_x[3:0];
    wire is_alu_op = (opcode >= 4'b0001 && opcode <= 4'b0011);
    wire is_load = (opcode == 4'b0100);
    wire is_store = (opcode == 4'b0101);
    wire is_callr = (opcode == 4'b1111);

    always @(*) begin
        // Default values
        alu_op = 3'b000;
        alu_a_sel = 1'b0;
        alu_b_sel = 1'b0;
        alu_ld_n = 1'b0;
        alu_ld_z = 1'b0;
        alu_A_ld = 1'b0;
        rfx_wr_ld = 1'b0;
        rfy_wr_ld = 1'b0;
        rfx_wr_sel = 1'b0;
        rfy_wr_sel = 1'b0;
        ldst_rd = 1'b0;
        ldst_wr = 1'b0;
        ldst_addr_sel = 1'b0;
        ldst_wrdata_sel = 1'b0;

        // ALU operations
        if (is_alu_op) begin
            alu_op = opcode[2:0];
            alu_a_sel = fwd_rx;
            alu_b_sel = fwd_ry;
            alu_ld_n = 1'b1;
            alu_ld_z = 1'b1;
            rfx_wr_ld = 1'b1;
        end

        // Load operation
        if (is_load) begin
            ldst_rd = 1'b1;
            ldst_addr_sel = fwd_ry;
            rfx_wr_ld = 1'b1;
            rfx_wr_sel = 1'b1;
        end

        // Store operation
        if (is_store) begin
            ldst_wr = 1'b1;
            ldst_addr_sel = fwd_ry;
            ldst_wrdata_sel = fwd_rx;
        end

        // CALLR instruction
        if (is_callr) begin
            alu_A_ld = 1'b1;
            rfx_wr_ld = 1'b1;
            rfy_wr_ld = 1'b1;
        end

        // Conditional execution based on N and Z flags
        if (instr_x[15:12] != 4'b0000) begin
            case (instr_x[15:12])
                4'b0001: begin // BEQ
                    if (!z) begin
                        rfx_wr_ld = 1'b0;
                        rfy_wr_ld = 1'b0;
                        ldst_rd = 1'b0;
                        ldst_wr = 1'b0;
                    end
                end
                4'b0010: begin // BNE
                    if (z) begin
                        rfx_wr_ld = 1'b0;
                        rfy_wr_ld = 1'b0;
                        ldst_rd = 1'b0;
                        ldst_wr = 1'b0;
                    end
                end
                4'b0011: begin // BLT
                    if (!n) begin
                        rfx_wr_ld = 1'b0;
                        rfy_wr_ld = 1'b0;
                        ldst_rd = 1'b0;
                        ldst_wr = 1'b0;
                    end
                end
                4'b0100: begin // BGE
                    if (n) begin
                        rfx_wr_ld = 1'b0;
                        rfy_wr_ld = 1'b0;
                        ldst_rd = 1'b0;
                        ldst_wr = 1'b0;
                    end
                end
            endcase
        end
    end

endmodule