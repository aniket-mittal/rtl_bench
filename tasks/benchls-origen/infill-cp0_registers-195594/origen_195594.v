module origen_195594 (
    input [4:0] CP0Idx,
    input [31:0] DIn,
    input We,
    input ExcEnter,
    input [4:0] ExcCode,
    input [5:0] HWInt,
    input Clk,
    input Reset,
    output [31:0] DOut,
    output Inter,
    output [31:0] EPCout
);

reg [31:0] SR, Cause, EPC, PRId;

always @(posedge Clk or posedge Reset) begin
    if (Reset) begin
        SR <= 32'h0000_0000;
        Cause <= 32'h0000_0000;
        EPC <= 32'h0000_0000;
        PRId <= 32'h0000_0000;
    end
    else begin
        if (We) begin
            case (CP0Idx)
                5'b00000: SR <= DIn;
                5'b00001: ;
                5'b00010: ;
                5'b00011: ;
                5'b01000: Cause <= DIn;
                5'b01001: EPC <= DIn;
                5'b01111: PRId <= DIn;
                default: ;
            endcase
        end
        if (ExcEnter) begin
            Cause <= {27'b0, ExcCode};
            SR[0] <= 1'b0;
        end
    end
end

[MASKED]

assign Inter = SR[0] & (|HWInt);
assign EPCout = EPC;

endmodule