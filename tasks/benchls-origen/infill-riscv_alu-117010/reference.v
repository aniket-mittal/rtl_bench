module origen_117010 (
    input  logic [4:0]  alu_ctrl,
    input  logic [31:0] alu_in1,
    input  logic [31:0] alu_in2,
    output logic [31:0] alu_out,
    output logic        branch_flag
);

    // ALU operation parameters
    parameter NOP  = 5'b00000;
    parameter ADD  = 5'b00001;
    parameter SUB  = 5'b00010;
    parameter SLTS = 5'b00011;
    parameter SLTU = 5'b00100;
    parameter SLL  = 5'b00101;
    parameter SRA  = 5'b00110;
    parameter SRL  = 5'b00111;
    parameter AND  = 5'b01000;
    parameter OR   = 5'b01001;
    parameter XOR  = 5'b01010;
    parameter BEQ  = 5'b01011;
    parameter BNE  = 5'b01100;
    parameter BLT  = 5'b01101;
    parameter BGE  = 5'b01110;
    parameter BLTU = 5'b01111;
    parameter BGEU = 5'b10000;

    always_comb begin
        alu_out = 32'b0;
        branch_flag = 1'b0;

        case (alu_ctrl)
            NOP:  alu_out = alu_in1;
            ADD:  alu_out = alu_in1 + alu_in2;
            SUB:  alu_out = alu_in1 - alu_in2;
            SLTS: alu_out = $signed(alu_in1) < $signed(alu_in2) ? 32'b1 : 32'b0;
            SLTU: alu_out = alu_in1 < alu_in2 ? 32'b1 : 32'b0;
            SLL:  alu_out = alu_in1 << alu_in2[4:0];
            SRA:  alu_out = $signed(alu_in1) >>> alu_in2[4:0];
            SRL:  alu_out = alu_in1 >> alu_in2[4:0];
            AND:  alu_out = alu_in1 & alu_in2;
            OR:   alu_out = alu_in1 | alu_in2;
            XOR:  alu_out = alu_in1 ^ alu_in2;
            BEQ:  branch_flag = (alu_in1 == alu_in2);
            BNE:  branch_flag = (alu_in1 != alu_in2);
            BLT:  branch_flag = ($signed(alu_in1) < $signed(alu_in2));
            BGE:  branch_flag = ($signed(alu_in1) >= $signed(alu_in2));
            BLTU: branch_flag = (alu_in1 < alu_in2);
            BGEU: branch_flag = (alu_in1 >= alu_in2);
            default: alu_out = 32'b0;
        endcase
    end

endmodule