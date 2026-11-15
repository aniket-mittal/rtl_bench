module origen_178603(
    input clk,
    input [31:0] A,
    input [31:0] B,
    input [2:0] CtrlFunc,
    output reg [31:0] Result,
    output reg [3:0] Flags
);

reg [31:0] Result_temp;
reg [31:0] CMPtemp;
reg [3:0] Flags_temp;

[MASKED]

always @(negedge clk) begin
    Result <= Result_temp;
    Flags <= Flags_temp;
end

endmodule