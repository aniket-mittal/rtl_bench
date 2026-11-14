module origen_183625(
    input clk,
    input reset,
    input [11:0] polynom,
    input [10:0] datain_a,
    input [10:0] datain_b,
    input enable,
    output [10:0] dataout,
    output valid
);

reg [10:0] dataoutReg;
reg [10:0] datain_aReg;
reg [10:0] datain_bReg;
reg [11:0] polynomReg;
reg validReg;
reg [3:0] counter;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        dataoutReg <= 0;
        datain_aReg <= 0;
        datain_bReg <= 0;
        polynomReg <= 0;
        validReg <= 0;
        counter <= 0;
    end else if (enable && counter == 0) begin
        datain_aReg <= datain_a;
        datain_bReg <= datain_b;
        polynomReg <= polynom;
        counter <= counter + 1;
    end else if (enable && counter < 12) begin
        dataoutReg <= {dataoutReg[9:0], datain_aReg[10]};
        datain_aReg <= {datain_aReg[9:0], 1'b0};
        datain_bReg <= {datain_bReg[9:0], 1'b0};
        counter <= counter + 1;
    end else if (enable && counter == 12) begin
        if (dataoutReg >= polynomReg) begin
            dataoutReg <= dataoutReg ^ polynomReg;
        end
        counter <= counter + 1;
    end else if (enable && counter == 13) begin
        dataoutReg <= dataoutReg ^ polynomReg;
        validReg <= 1;
        counter <= 0;
    end
end

assign dataout = dataoutReg;
assign valid = validReg;

endmodule