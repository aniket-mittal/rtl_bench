module origen_181572 (
    input [31:0] I,
    input [1:0] state,
    input [4:0] status,
    output reg [32:0] cw_IW,
    output reg [63:0] K
);

    // Extract instruction fields
    wire [5:0] op = I[31:26];
    wire [25:0] se_address = {{6{I[25]}}, I[25:0]};

    // Internal signals
    reg alu_en;
    reg alu_bs;
    reg [4:0] alu_fs;
    reg rf_b_en;
    reg [4:0] rf_sa;
    reg [4:0] rf_sb;
    reg [4:0] rf_da;
    reg rf_w;
    reg ram_en;
    reg ram_w;
    reg pc_en;
    reg [1:0] pc_fs;
    reg pc_is;
    reg status_ld;
    reg [1:0] next_state;

    always @(*) begin
        // Default values
        alu_en = 1'b0;
        alu_bs = 1'b0;
        alu_fs = 5'b0;
        rf_b_en = 1'b0;
        rf_sa = 5'b0;
        rf_sb = 5'b0;
        rf_da = 5'b0;
        rf_w = 1'b0;
        ram_en = 1'b0;
        ram_w = 1'b0;
        pc_en = 1'b0;
        pc_fs = 2'b0;
        pc_is = 1'b0;
        status_ld = 1'b0;
        next_state = 2'b0;

        // Decode instruction and generate control signals
        case (op)
            6'b000000: begin // ADD
                alu_en = 1'b1;
                alu_bs = 1'b0;
                alu_fs = 5'b00000;
                rf_b_en = 1'b1;
                rf_sa = I[25:21];
                rf_sb = I[20:16];
                rf_da = I[15:11];
                rf_w = 1'b1;
                next_state = 2'b00;
            end
            6'b000001: begin // SUB
                alu_en = 1'b1;
                alu_bs = 1'b1;
                alu_fs = 5'b00000;
                rf_b_en = 1'b1;
                rf_sa = I[25:21];
                rf_sb = I[20:16];
                rf_da = I[15:11];
                rf_w = 1'b1;
                next_state = 2'b00;
            end
            6'b100011: begin // LW
                alu_en = 1'b1;
                alu_bs = 1'b0;
                alu_fs = 5'b00000;
                rf_b_en = 1'b1;
                rf_sa = I[25:21];
                rf_sb = I[20:16];
                rf_da = I[15:11];
                rf_w = 1'b1;
                ram_en = 1'b1;
                ram_w = 1'b0;
                pc_en = 1'b1;
                pc_fs = 2'b01;
                pc_is = 1'b0;
                next_state = 2'b01;
            end
            6'b101011: begin // SW
                alu_en = 1'b1;
                alu_bs = 1'b0;
                alu_fs = 5'b00000;
                rf_b_en = 1'b1;
                rf_sa = I[25:21];
                rf_sb = I[20:16];
                ram_en = 1'b1;
                ram_w = 1'b1;
                pc_en = 1'b1;
                pc_fs = 2'b01;
                pc_is = 1'b0;
                next_state = 2'b01;
            end
            6'b000100: begin // BEQ
                alu_en = 1'b1;
                alu_bs = 1'b1;
                alu_fs = 5'b00000;
                rf_b_en = 1'b1;
                rf_sa = I[25:21];
                rf_sb = I[20:16];
                pc_en = 1'b1;
                pc_fs = 2'b10;
                pc_is = 1'b1;
                status_ld = 1'b1;
                next_state = 2'b10;
            end
            // Add more instruction cases as needed
            default: begin
                next_state = 2'b11; // Invalid instruction
            end
        endcase

        // Assign output signals
        cw_IW = {alu_en, alu_bs, alu_fs, rf_b_en, rf_sa, rf_sb, rf_da, rf_w, ram_en, ram_w, pc_en, pc_fs, pc_is, status_ld, next_state};
        K = {{38{se_address[25]}}, se_address};
    end

endmodule