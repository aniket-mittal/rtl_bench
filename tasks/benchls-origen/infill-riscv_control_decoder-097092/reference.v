module origen_097092 (
    input wire [6:0] opcode,
    input wire reset,
    input wire invert,
    input wire [2:0] funct,
    output reg [1:0] im_sel,
    output reg jump,
    output reg branch,
    output reg Alusrc1,
    output reg Alusrc2,
    output reg regWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg jal,
    output reg csr,
    output reg [1:0] wr_sel,
    output reg [2:0] ALUop,
    output wire fence
);

    // Instruction type decoding
    wire r_type = (opcode == 7'b0110011);
    wire i_type = (opcode == 7'b0010011);
    wire s_type = (opcode == 7'b0100011);
    wire b_type = (opcode == 7'b1100011);
    wire u_type = (opcode == 7'b0110111) || (opcode == 7'b0010111);
    wire j_type = (opcode == 7'b1101111);
    wire csr_type = (opcode == 7'b1110011);
    wire load_type = (opcode == 7'b0000011);

    // Fence signal
    assign fence = (opcode == 7'b0001111);

    always @(*) begin
        if (reset) begin
            im_sel = 2'b00;
            jump = 1'b0;
            branch = 1'b0;
            Alusrc1 = 1'b0;
            Alusrc2 = 1'b0;
            regWrite = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            jal = 1'b0;
            csr = 1'b0;
            wr_sel = 2'b00;
            ALUop = 3'b000;
        end else begin
            // Default values
            im_sel = 2'b00;
            jump = 1'b0;
            branch = 1'b0;
            Alusrc1 = 1'b0;
            Alusrc2 = 1'b0;
            regWrite = 1'b0;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            jal = 1'b0;
            csr = 1'b0;
            wr_sel = 2'b00;
            ALUop = 3'b000;

            // Instruction-specific control signals
            if (r_type) begin
                regWrite = 1'b1;
                ALUop = {1'b0, funct[2:1]};
            end else if (i_type) begin
                regWrite = 1'b1;
                Alusrc2 = 1'b1;
                im_sel = 2'b00;
                ALUop = {1'b0, funct[2:1]};
            end else if (s_type) begin
                Alusrc2 = 1'b1;
                MemWrite = 1'b1;
                im_sel = 2'b01;
            end else if (b_type) begin
                branch = 1'b1;
                im_sel = 2'b10;
                ALUop = 3'b001;
            end else if (u_type) begin
                regWrite = 1'b1;
                Alusrc1 = 1'b1;
                Alusrc2 = 1'b1;
                im_sel = 2'b11;
                ALUop = 3'b000;
            end else if (j_type) begin
                regWrite = 1'b1;
                jump = 1'b1;
                jal = 1'b1;
                im_sel = 2'b11;
                wr_sel = 2'b10;
            end else if (csr_type) begin
                regWrite = 1'b1;
                csr = 1'b1;
                wr_sel = 2'b01;
            end else if (load_type) begin
                regWrite = 1'b1;
                Alusrc2 = 1'b1;
                MemRead = 1'b1;
                im_sel = 2'b00;
                wr_sel = 2'b01;
            end
        end
    end

endmodule