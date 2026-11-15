module origen_038531 (
    input wire clk,
    input wire reset,
    input wire [8:0] bitsCtr,
    input wire [31:0] newpc,
    input wire [31:0] read1,
    input wire [31:0] read2,
    input wire [31:0] extensor,
    input wire [4:0] instr_2,
    input wire [4:0] instr_1,
    input wire [4:0] rs,
    input wire [4:0] rt,
    output reg [8:0] saidaBitsCtr,
    output reg [31:0] saidaNewPC,
    output reg [31:0] saidaRead1,
    output reg [31:0] saidaRead2,
    output reg [31:0] saidaExtensor,
    output reg [4:0] saidaInst_2,
    output reg [4:0] saidaInst_1,
    output reg [4:0] rsout,
    output reg [4:0] rtout
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            saidaBitsCtr <= 9'b0;
            saidaNewPC <= 32'b0;
            saidaRead1 <= 32'b0;
            saidaRead2 <= 32'b0;
            saidaExtensor <= 32'b0;
            saidaInst_2 <= 5'b0;
            saidaInst_1 <= 5'b0;
            rsout <= 5'b0;
            rtout <= 5'b0;
        end
        else begin
            saidaBitsCtr <= bitsCtr;
            saidaNewPC <= newpc;
            saidaRead1 <= read1;
            saidaRead2 <= read2;
            saidaExtensor <= extensor;
            saidaInst_2 <= instr_2;
            saidaInst_1 <= instr_1;
            rsout <= rs;
            rtout <= rt;
        end
    end

endmodule