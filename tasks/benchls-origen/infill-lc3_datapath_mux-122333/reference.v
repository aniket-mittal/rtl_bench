module origen_122333 (
    input [15:0] ADDER, BUS, PC1,
    input [1:0] Select,
    output reg [15:0] Output
);
    always @(*) begin
        case (Select)
            2'b00: Output = PC1;
            2'b01: Output = BUS;
            2'b10: Output = ADDER;
            2'b11: Output = 16'b0;
        endcase
    end
endmodule

module m_DRMUX (
    input [2:0] IR,
    input Select,
    output reg [2:0] Output
);
    always @(*) begin
        Output = Select ? 3'b111 : IR;
    end
endmodule

module m_SR1MUX (
    input [2:0] IR11, IR8,
    input Select,
    output reg [2:0] Output
);
    always @(*) begin
        Output = Select ? IR8 : IR11;
    end
endmodule

module m_SR2MUX (
    input [15:0] SR2, SEXT,
    input Select,
    output reg [15:0] Output
);
    always @(*) begin
        Output = Select ? SEXT : SR2;
    end
endmodule

module m_ADDR1MUX (
    input [15:0] PC, SR1,
    input Select,
    output reg [15:0] Output
);
    always @(*) begin
        Output = Select ? SR1 : PC;
    end
endmodule

module m_ADDR2MUX (
    input [15:0] IRoffset6, IRoffset9, IRoffset11,
    input [1:0] Select,
    output reg [15:0] Output
);
    always @(*) begin
        case (Select)
            2'b00: Output = 16'b0;
            2'b01: Output = IRoffset6;
            2'b10: Output = IRoffset9;
            2'b11: Output = IRoffset11;
        endcase
    end
endmodule

module m_MDRMUX (
    input [15:0] BUS, MEM2IO,
    input Select,
    output reg [15:0] Output
);
    always @(*) begin
        Output = Select ? MEM2IO : BUS;
    end
endmodule

module m_GATES (
    input GateALU, GateMARMUX, GateMDR, GatePC,
    input [15:0] aluoutput, marmuxoutput, mdroutput, pcoutput,
    input [3:0] Select,
    output reg [15:0] Output
);
    always @(*) begin
        case (Select)
            4'b0001: Output = aluoutput;
            4'b0010: Output = marmuxoutput;
            4'b0100: Output = mdroutput;
            4'b1000: Output = pcoutput;
            default: Output = 16'b0;
        endcase
    end
endmodule