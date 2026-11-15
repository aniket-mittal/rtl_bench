// ALU Module
module origen_084340(
    input [5:0] A,
    input [5:0] B,
    input [3:0] ALU_Sel,
    output [5:0] ALU_Out
);

reg [5:0] ALU_Result;
assign ALU_Out = ALU_Result;

always @(*)
begin
    case(ALU_Sel)
        4'b0000: ALU_Result = A & B;
        4'b0001: ALU_Result = A | B;
        4'b0010: ALU_Result = A ^ B;
        4'b0011: ALU_Result = ~A;
        4'b0100: ALU_Result = A << 1;
        4'b0101: ALU_Result = A >> 1;
        4'b0110: ALU_Result = {A[4:0], A[5]};
        4'b0111: ALU_Result = {A[0], A[5:1]};
        4'b1000: ALU_Result = A <<< 1;
        4'b1001: ALU_Result = $signed(A) >>> 1;
        default: ALU_Result = A;
    endcase
end

endmodule

// Testbench
