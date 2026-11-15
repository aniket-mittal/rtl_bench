module origen_179398(
    input RegWrite_in,
    input Memory_write_in,
    input DR_MDR_immi_in,
    input RegJump_in,
    input RegJump_cond_in,
    input memory_input_in,
    input [3:0] branchcondition,
    input [3:0] szcv,
    input [31:0] DR_in,
    input [31:0] outerInput,
    input [31:0] memoryContent,
    input [31:0] din,
    input Regdst_in,
    input [31:0] increPC_in,
    output reg [31:0] out_PC4,
    output reg [31:0] MDR,
    output reg [31:0] DR,
    output reg RegWrite,
    output reg DR_MDR_immi,
    output reg Memory_write,
    output reg RegJump,
    output reg [31:0] d,
    output reg Regdst,
    output reg [31:0] increPC_out
);

    function [31:0] calcPC;
        input [31:0] DR;
        input [31:0] increPC;
        input RegJump;
        begin
            if (RegJump)
                calcPC = DR;
            else
                calcPC = increPC;
        end
    endfunction

    function checkCond;
        input [3:0] branchcondition;
        input [3:0] szcv;
        begin
            case (branchcondition)
                4'b0000: checkCond = szcv[0]; // Z
                4'b0001: checkCond = ~szcv[0]; // NZ
                4'b0010: checkCond = szcv[1]; // N
                4'b0011: checkCond = ~szcv[1]; // NN
                4'b0100: checkCond = szcv[2]; // C
                4'b0101: checkCond = ~szcv[2]; // NC
                4'b0110: checkCond = szcv[3]; // V
                4'b0111: checkCond = ~szcv[3]; // NV
                4'b1000: checkCond = szcv[1] ^ szcv[3]; // LT
                4'b1001: checkCond = ~(szcv[1] ^ szcv[3]); // GE
                4'b1010: checkCond = ~szcv[0] & (szcv[1] ^ szcv[3]); // LE
                4'b1011: checkCond = szcv[0] & ~(szcv[1] ^ szcv[3]); // GT
                default: checkCond = 1'b0;
            endcase
        end
    endfunction

    initial begin
        MDR = 32'b0;
        DR = 32'b0;
        RegWrite = 1'b0;
        DR_MDR_immi = 1'b0;
        Memory_write = 1'b0;
        RegJump = 1'b0;
        d = 32'b0;
        Regdst = 1'b0;
        increPC_out = 32'b0;
        out_PC4 = 32'b0;
    end

    always @(*) begin
        MDR = (memory_input_in) ? memoryContent : outerInput;
        DR = DR_in;
        RegWrite = RegWrite_in;
        DR_MDR_immi = DR_MDR_immi_in;
        Memory_write = Memory_write_in;
        Regdst = Regdst_in;
        d = din;
        increPC_out = increPC_in;

        if (RegJump_cond_in)
            RegJump = checkCond(branchcondition, szcv);
        else
            RegJump = RegJump_in;

        out_PC4 = calcPC(DR_in, increPC_in, RegJump);
    end
endmodule