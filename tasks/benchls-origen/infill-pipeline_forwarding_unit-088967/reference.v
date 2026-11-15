module origen_088967 (
    input wire EN,
    input wire [3:0] Src1_EXE, Src2_EXE, Dest_EXE, Dest_MEM, Dest_WB,
    input wire WB_EN_MEM, WB_EN_WB,
    input wire Forward_Dest_EN,
    output reg [1:0] Forward_Val1, Forward_Val2
);

    always @(*) begin
        if (EN) begin
            // Forwarding for Src1
            if (WB_EN_MEM && (Dest_MEM == Src1_EXE) && (Dest_MEM != 4'b0000))
                Forward_Val1 = 2'b01;
            else if (WB_EN_WB && (Dest_WB == Src1_EXE) && (Dest_WB != 4'b0000))
                Forward_Val1 = 2'b10;
            else
                Forward_Val1 = 2'b00;

            // Forwarding for Src2
            if (WB_EN_MEM && (Dest_MEM == (Forward_Dest_EN ? Dest_EXE : Src2_EXE)) && (Dest_MEM != 4'b0000))
                Forward_Val2 = 2'b01;
            else if (WB_EN_WB && (Dest_WB == (Forward_Dest_EN ? Dest_EXE : Src2_EXE)) && (Dest_WB != 4'b0000))
                Forward_Val2 = 2'b10;
            else
                Forward_Val2 = 2'b00;
        end else begin
            Forward_Val1 = 2'b00;
            Forward_Val2 = 2'b00;
        end
    end
endmodule

module Forwarding_MUX (
    input wire [31:0] Val, Val_MEM, Val_WB,
    input wire [1:0] Forward_Val,
    output reg [31:0] Out
);

    always @(*) begin
        case (Forward_Val)
            2'b00: Out = Val;
            2'b01: Out = Val_MEM;
            2'b10: Out = Val_WB;
            default: Out = Val;
        endcase
    end
endmodule

module IMM_MUX (
    input wire [31:0] Val, IMM,
    input wire IS_IMM,
    output reg [31:0] Out
);

    always @(*) begin
        Out = IS_IMM ? IMM : Val;
    end
endmodule

module Hazard_Detector (
    input wire EN,
    input wire [3:0] Src1_ID, Src2_ID, Dest_EXE, Dest_MEM,
    input wire MEM_R_EN_EXE, WB_EN_EXE, WB_EN_MEM,
    output reg Freeze, Hazard_Detected_Sig
);

    always @(*) begin
        if (EN) begin
            if (MEM_R_EN_EXE && ((Src1_ID == Dest_EXE) || (Src2_ID == Dest_EXE))) begin
                Freeze = 1'b1;
                Hazard_Detected_Sig = 1'b1;
            end else if (WB_EN_EXE && ((Src1_ID == Dest_EXE) || (Src2_ID == Dest_EXE))) begin
                Freeze = 1'b0;
                Hazard_Detected_Sig = 1'b1;
            end else if (WB_EN_MEM && ((Src1_ID == Dest_MEM) || (Src2_ID == Dest_MEM))) begin
                Freeze = 1'b0;
                Hazard_Detected_Sig = 1'b1;
            end else begin
                Freeze = 1'b0;
                Hazard_Detected_Sig = 1'b0;
            end
        end else begin
            Freeze = 1'b0;
            Hazard_Detected_Sig = 1'b0;
        end
    end
endmodule

module Hazard_MUX (
    input wire Sel,
    input wire WB_EN_IN, MEM_R_IN, MEM_W_IN,
    input wire [1:0] BR_type_IN,
    input wire [3:0] EXE_CMD_IN,
    output reg WB_EN, MEM_R, MEM_W,
    output reg [1:0] BR_type,
    output reg [3:0] EXE_CMD
);

    always @(*) begin
        if (Sel) begin
            WB_EN = 1'b0;
            MEM_R = 1'b0;
            MEM_W = 1'b0;
            BR_type = 2'b00;
            EXE_CMD = 4'b0000;
        end else begin
            WB_EN = WB_EN_IN;
            MEM_R = MEM_R_IN;
            MEM_W = MEM_W_IN;
            BR_type = BR_type_IN;
            EXE_CMD = EXE_CMD_IN;
        end
    end
endmodule