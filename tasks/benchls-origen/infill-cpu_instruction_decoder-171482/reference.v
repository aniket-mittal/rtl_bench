module origen_171482(
    input [15:0] in,
    output reg [1:0] RBData1_SL, RBDataIn_SL, ALUData_SL, Seg_SL, LED_SL,
    output reg RB_WE, Seg_WE, Led_WE, DM_WE,
    output reg branch,
    output reg IMAdd_SL,
    output reg [3:0] ALU_OP
);

always @(*) begin
    if (in[15] == 1'b0) begin
        case (in[14:6])
            9'b000000000: begin // NOP
                RBData1_SL = 2'b00;
                RBDataIn_SL = 2'b00;
                ALUData_SL = 2'b00;
                Seg_SL = 2'b00;
                LED_SL = 2'b00;
                RB_WE = 1'b0;
                Seg_WE = 1'b0;
                Led_WE = 1'b0;
                DM_WE = 1'b0;
                branch = 1'b0;
                IMAdd_SL = 1'b0;
                ALU_OP = 4'b0000;
            end
            9'b000000001: begin // ADD
                RBData1_SL = 2'b01;
                RBDataIn_SL = 2'b10;
                ALUData_SL = 2'b11;
                Seg_SL = 2'b00;
                LED_SL = 2'b00;
                RB_WE = 1'b1;
                Seg_WE = 1'b0;
                Led_WE = 1'b0;
                DM_WE = 1'b0;
                branch = 1'b0;
                IMAdd_SL = 1'b0;
                ALU_OP = 4'b0001;
            end
            // Add more case statements for other instructions
            default: begin
                RBData1_SL = 2'b00;
                RBDataIn_SL = 2'b00;
                ALUData_SL = 2'b00;
                Seg_SL = 2'b00;
                LED_SL = 2'b00;
                RB_WE = 1'b0;
                Seg_WE = 1'b0;
                Led_WE = 1'b0;
                DM_WE = 1'b0;
                branch = 1'b0;
                IMAdd_SL = 1'b0;
                ALU_OP = 4'b0000;
            end
        endcase
    end
    else begin
        case (in[14:11])
            4'b0000: begin // Branch
                RBData1_SL = 2'b01;
                RBDataIn_SL = 2'b00;
                ALUData_SL = 2'b00;
                Seg_SL = 2'b00;
                LED_SL = 2'b00;
                RB_WE = 1'b0;
                Seg_WE = 1'b0;
                Led_WE = 1'b0;
                DM_WE = 1'b0;
                branch = 1'b1;
                IMAdd_SL = 1'b1;
                ALU_OP = 4'b0000;
            end
            4'b0001: begin // Load
                RBData1_SL = 2'b01;
                RBDataIn_SL = 2'b11;
                ALUData_SL = 2'b00;
                Seg_SL = 2'b00;
                LED_SL = 2'b00;
                RB_WE = 1'b1;
                Seg_WE = 1'b0;
                Led_WE = 1'b0;
                DM_WE = 1'b0;
                branch = 1'b0;
                IMAdd_SL = 1'b0;
                ALU_OP = 4'b0000;
            end
            // Add more case statements for other instructions
            default: begin
                RBData1_SL = 2'b00;
                RBDataIn_SL = 2'b00;
                ALUData_SL = 2'b00;
                Seg_SL = 2'b00;
                LED_SL = 2'b00;
                RB_WE = 1'b0;
                Seg_WE = 1'b0;
                Led_WE = 1'b0;
                DM_WE = 1'b0;
                branch = 1'b0;
                IMAdd_SL = 1'b0;
                ALU_OP = 4'b0000;
            end
        endcase
    end
end

endmodule