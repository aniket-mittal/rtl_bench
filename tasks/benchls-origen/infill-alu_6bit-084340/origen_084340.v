// ALU Module
module origen_084340(
    input [5:0] A,
    input [5:0] B,
    input [3:0] ALU_Sel,
    output [5:0] ALU_Out
);

reg [5:0] ALU_Result;
assign ALU_Out = ALU_Result;

[MASKED]

endmodule

// Testbench
module ALU_tb;

reg [5:0] A, B;
reg [3:0] ALU_Sel;
wire [5:0] ALU_Out;

ALU dut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out)
);

initial begin
    A = 6'b000111;
    B = 6'b010101;
    ALU_Sel = 4'b0000;

    $monitor("Time=%0t A=%b B=%b ALU_Sel=%b ALU_Out=%b", $time, A, B, ALU_Sel, ALU_Out);

    repeat (10) begin
        #10 ALU_Sel = ALU_Sel + 1;
    end

    #10 ;
end

endmodule