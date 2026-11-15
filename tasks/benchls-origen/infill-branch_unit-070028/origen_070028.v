module origen_070028(
    input [2:0] opcode,
    input [3:0] fcode,
    input [24:0] label,
    input carryFlag, zFlag, overflowFlag, signFlag,
    input [9:0] PC,
    output reg [9:0] exNPC,
    output reg PCSrc,
    output reg [31:0] ra
);

    initial begin
        exNPC = 10'b0;
        PCSrc = 1'b0;
        ra = 32'b0;
    end

    [MASKED]
endmodule