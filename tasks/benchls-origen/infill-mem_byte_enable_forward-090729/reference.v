module origen_090729 (
    input [1:0] ForwardRTM,
    input [31:0] instr,
    input [31:0] ALUout_M,
    input [31:0] result_W,
    input [31:0] result_WD,
    input [31:0] WriteData_M,
    output reg [3:0] BE,
    output reg [31:0] WD
);

    // Instruction type macros
    `define SW 6'b101011
    `define LW 6'b100011
    `define SH 6'b101001
    `define LH 6'b100001
    `define LHU 6'b100101
    `define SB 6'b101000
    `define LB 6'b100000
    `define LBU 6'b100100

    wire [5:0] opcode;
    assign opcode = instr[31:26];

    // Data Forwarding
    always @(*) begin
        case (ForwardRTM)
            2'b00: WD = WriteData_M;
            2'b01: WD = result_W;
            2'b10: WD = result_WD;
            2'b11: WD = 32'b0;
        endcase
    end

    // Byte Enable Generation
    always @(*) begin
        case (opcode)
            `SW, `LW: 
                BE = 4'b1111;
            `SH, `LH, `LHU: 
                BE = ALUout_M[1] ? 4'b1100 : 4'b0011;
            `SB, `LB, `LBU: 
                case (ALUout_M[1:0])
                    2'b11: BE = 4'b1000;
                    2'b10: BE = 4'b0100;
                    2'b01: BE = 4'b0010;
                    2'b00: BE = 4'b0001;
                endcase
            default: 
                BE = 4'b0000;
        endcase
    end

endmodule