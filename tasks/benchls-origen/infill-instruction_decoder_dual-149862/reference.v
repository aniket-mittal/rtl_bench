module origen_149862(
    input clock_i,
    input reset_i,
    input enable_i,
    input shouldStalled_i,
    input [4:0] byteAddr_i,
    input [255:0] block_i,
    output reg shouldStalled_o,
    output reg backDisable_o,
    output reg [3:0] nextByteOffset_o,
    output reg [29:0] InstructionA_o,
    output reg [29:0] InstructionB_o,
    output reg InstructionAFormat_o,
    output reg InstructionBFormat_o,
    output reg enableA_o,
    output reg enableB_o
);

    always @(posedge clock_i) begin
        if (reset_i) begin
            enableA_o <= 0;
            enableB_o <= 0;
            nextByteOffset_o <= 0;
        end
        else if (enable_i && !shouldStalled_i) begin
            if (block_i[byteAddr_i + 31] == 1'b1) begin
                InstructionA_o <= block_i[byteAddr_i +: 30];
                InstructionB_o <= block_i[byteAddr_i + 30 +: 30];
                InstructionAFormat_o <= block_i[byteAddr_i + 60];
                InstructionBFormat_o <= block_i[byteAddr_i + 61];
                nextByteOffset_o <= 4'b0100;
            end
            else begin
                InstructionA_o <= block_i[byteAddr_i +: 19];
                InstructionB_o <= block_i[byteAddr_i + 19 +: 19];
                InstructionAFormat_o <= block_i[byteAddr_i + 38];
                InstructionBFormat_o <= block_i[byteAddr_i + 39];
                nextByteOffset_o <= 4'b0010;
            end
            enableA_o <= 1;
            enableB_o <= 1;
        end
        else begin
            enableA_o <= 0;
            enableB_o <= 0;
        end
        shouldStalled_o <= 0;
        backDisable_o <= 0;
    end

endmodule