module origen_206851 (
    input clk,
    input [7:0] IR_Input,
    input flag,
    output reg [4:0] C_Bus_CU,
    output reg [4:0] B_Bus_CU,
    output reg [2:0] DATA_Con_CU,
    output reg [3:0] ALU_CU,
    output reg [2:0] Reg_Inc_CU,
    output reg IR_Load
);

    reg [20:0] Main_Control_Signal;

    [MASKED]

endmodule