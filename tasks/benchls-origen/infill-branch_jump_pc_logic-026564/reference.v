module origen_026564 (
    input [31:0] instruction,
    input [31:0] Rs,
    input [31:0] Rt,
    input [31:0] PCplusOne,
    input [31:0] SE_Imm,
    output reg [31:0] ID_PC,
    output reg PCSource
);

    wire [5:0] opcode;
    wire [25:0] jump_target;
    
    assign opcode = instruction[31:26];
    assign jump_target = instruction[25:0];

    function f_PCSource;
        input [5:0] opcode;
        input [31:0] Rs, Rt;
        begin
            case (opcode)
                6'b000001: f_PCSource = 1; // Jump
                6'b100000: f_PCSource = (Rs == Rt); // Branch if equal
                6'b100001: f_PCSource = (Rs != Rt); // Branch if not equal
                6'b100010: f_PCSource = ($signed(Rs) < $signed(Rt)); // Branch if less than
                6'b100011: f_PCSource = ($signed(Rs) <= $signed(Rt)); // Branch if less than or equal
                default: f_PCSource = 0;
            endcase
        end
    endfunction

    function [31:0] f_ID_PC;
        input [5:0] opcode;
        input [31:0] Rs, Rt, PCplusOne, SE_Imm;
        input [25:0] jump_target;
        begin
            case (opcode)
                6'b000001: f_ID_PC = {PCplusOne[31:28], jump_target, 2'b00}; // Jump
                6'b100000, 6'b100001, 6'b100010, 6'b100011: begin
                    if (f_PCSource(opcode, Rs, Rt))
                        f_ID_PC = PCplusOne + SE_Imm;
                    else
                        f_ID_PC = PCplusOne;
                end
                default: f_ID_PC = PCplusOne;
            endcase
        end
    endfunction

    always @(*) begin
        PCSource = f_PCSource(opcode, Rs, Rt);
        ID_PC = f_ID_PC(opcode, Rs, Rt, PCplusOne, SE_Imm, jump_target);
    end

endmodule