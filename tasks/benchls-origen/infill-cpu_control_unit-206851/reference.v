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

    always @(posedge clk) begin
        case (IR_Input)
            8'h00: begin
                C_Bus_CU = 5'b00001;
                B_Bus_CU = 5'b00010;
                DATA_Con_CU = 3'b001;
                ALU_CU = 4'b0000;
                Reg_Inc_CU = 3'b001;
                IR_Load = 1'b1;
            end
            8'h01: begin
                C_Bus_CU = 5'b00011;
                B_Bus_CU = 5'b00100;
                DATA_Con_CU = 3'b010;
                ALU_CU = 4'b0001;
                Reg_Inc_CU = 3'b001;
                IR_Load = 1'b0;
            end
            8'h02: begin
                C_Bus_CU = 5'b00101;
                B_Bus_CU = 5'b00110;
                DATA_Con_CU = 3'b011;
                ALU_CU = 4'b0010;
                Reg_Inc_CU = 3'b001;
                IR_Load = 1'b0;
            end
            // Add more cases for other instructions
            default: begin
                C_Bus_CU = 5'b00000;
                B_Bus_CU = 5'b00000;
                DATA_Con_CU = 3'b000;
                ALU_CU = 4'b0000;
                Reg_Inc_CU = 3'b000;
                IR_Load = 1'b0;
            end
        endcase
    end

endmodule