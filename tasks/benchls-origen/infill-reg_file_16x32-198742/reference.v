module origen_198742(
    input clk,
    input write,
    input [3:0] wrAddr,
    input [31:0] wrData,
    input [3:0] rdAddrA,
    output [31:0] rdDataA
);

reg [31:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7;
reg [31:0] reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15;

always @(posedge clk) begin
    if (write) begin
        case (wrAddr)
            4'd0:  reg0 <= wrData;
            4'd1:  reg1 <= wrData;
            4'd2:  reg2 <= wrData;
            4'd3:  reg3 <= wrData;
            4'd4:  reg4 <= wrData;
            4'd5:  reg5 <= wrData;
            4'd6:  reg6 <= wrData;
            4'd7:  reg7 <= wrData;
            4'd8:  reg8 <= wrData;
            4'd9:  reg9 <= wrData;
            4'd10: reg10 <= wrData;
            4'd11: reg11 <= wrData;
            4'd12: reg12 <= wrData;
            4'd13: reg13 <= wrData;
            4'd14: reg14 <= wrData;
            4'd15: reg15 <= wrData;
        endcase
    end
end

assign rdDataA = (rdAddrA == 4'd0)  ? reg0 :
                 (rdAddrA == 4'd1)  ? reg1 :
                 (rdAddrA == 4'd2)  ? reg2 :
                 (rdAddrA == 4'd3)  ? reg3 :
                 (rdAddrA == 4'd4)  ? reg4 :
                 (rdAddrA == 4'd5)  ? reg5 :
                 (rdAddrA == 4'd6)  ? reg6 :
                 (rdAddrA == 4'd7)  ? reg7 :
                 (rdAddrA == 4'd8)  ? reg8 :
                 (rdAddrA == 4'd9)  ? reg9 :
                 (rdAddrA == 4'd10) ? reg10:
                 (rdAddrA == 4'd11) ? reg11:
                 (rdAddrA == 4'd12) ? reg12:
                 (rdAddrA == 4'd13) ? reg13:
                 (rdAddrA == 4'd14) ? reg14:
                 (rdAddrA == 4'd15) ? reg15: 32'b0;

endmodule