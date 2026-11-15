module origen_111556(
    input [3:0] instruction,
    input nC,
    input nZ,
    input ph,
    output reg notIncPC,
    output reg notLoadPC,
    output reg notLoadA,
    output reg notLoadFlags,
    output reg notCarryIn,
    output reg M,
    output reg [3:0] S,
    output reg notCsRam,
    output reg notWeRam,
    output reg notOeALU,
    output reg notOeIn,
    output reg notOeOprnd,
    output reg notLoadOut
);

    always @(*) begin
        // Default values
        {notIncPC, notLoadPC, notLoadA, notLoadFlags, notCarryIn, M, S, notCsRam, notWeRam, notOeALU, notOeIn, notOeOprnd, notLoadOut} = 13'b1111111111111;

        if (ph) begin
            case (instruction)
                4'b0000: begin // NOP
                    notIncPC = 0;
                end
                4'b0001: begin // ADD
                    notIncPC = 0;
                    notLoadA = 0;
                    notLoadFlags = 0;
                    S = 4'b0000;
                    notOeALU = 0;
                end
                4'b0010: begin // SUB
                    notIncPC = 0;
                    notLoadA = 0;
                    notLoadFlags = 0;
                    S = 4'b0001;
                    notOeALU = 0;
                end
                4'b0011: begin // AND
                    notIncPC = 0;
                    notLoadA = 0;
                    notLoadFlags = 0;
                    S = 4'b0010;
                    notOeALU = 0;
                end
                4'b0100: begin // OR
                    notIncPC = 0;
                    notLoadA = 0;
                    notLoadFlags = 0;
                    S = 4'b0011;
                    notOeALU = 0;
                end
                4'b0101: begin // XOR
                    notIncPC = 0;
                    notLoadA = 0;
                    notLoadFlags = 0;
                    S = 4'b0100;
                    notOeALU = 0;
                end
                4'b0110: begin // LOAD
                    notIncPC = 0;
                    notLoadA = 0;
                    notCsRam = 0;
                    notOeOprnd = 0;
                end
                4'b0111: begin // STORE
                    notIncPC = 0;
                    notCsRam = 0;
                    notWeRam = 0;
                end
                4'b1000: begin // JUMP
                    notLoadPC = 0;
                    notOeOprnd = 0;
                end
                4'b1001: begin // BRANCH if Z
                    if (!nZ) begin
                        notLoadPC = 0;
                        notOeOprnd = 0;
                    end else begin
                        notIncPC = 0;
                    end
                end
                4'b1010: begin // BRANCH if C
                    if (!nC) begin
                        notLoadPC = 0;
                        notOeOprnd = 0;
                    end else begin
                        notIncPC = 0;
                    end
                end
                4'b1011: begin // INPUT
                    notIncPC = 0;
                    notLoadA = 0;
                    notOeIn = 0;
                end
                4'b1100: begin // OUTPUT
                    notIncPC = 0;
                    notLoadOut = 0;
                end
                default: begin
                    notIncPC = 0;
                end
            endcase
        end
    end

endmodule