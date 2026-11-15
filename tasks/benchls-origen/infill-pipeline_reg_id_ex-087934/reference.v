module origen_087934 (
    input wire clk,
    input wire reset,
    input wire [31:0] IR_D,
    input wire [31:0] MFCMPD1,
    input wire [31:0] MFCMPD2,
    input wire [31:0] Ext_num,
    input wire [4:0] A3,
    input wire [1:0] Res,
    input wire Stall,
    input wire [31:0] PC8_D,
    input wire j_zero,
    output reg [31:0] IR_E,
    output reg [31:0] RS_E,
    output reg [31:0] RT_E,
    output reg [31:0] Ext_num_E,
    output reg [4:0] A3_E,
    output reg [1:0] Res_E,
    output reg [31:0] PC8_E,
    output reg j_zero_E
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            IR_E <= 32'b0;
            RS_E <= 32'b0;
            RT_E <= 32'b0;
            Ext_num_E <= 32'b0;
            A3_E <= 5'b0;
            Res_E <= 2'b0;
            PC8_E <= 32'b0;
            j_zero_E <= 1'b0;
        end
        else if (Stall) begin
            IR_E <= 32'b0;
            Res_E <= 2'b0;
        end
        else begin
            IR_E <= IR_D;
            RS_E <= MFCMPD1;
            RT_E <= MFCMPD2;
            Ext_num_E <= Ext_num;
            A3_E <= A3;
            Res_E <= Res;
            PC8_E <= PC8_D;
            j_zero_E <= j_zero;
        end
    end

endmodule