module origen_222626(
    input clkin,
    input PSCLK,
    input PSEN,
    input PSINCDEC,
    input RST,
    output clk0,
    output CLKFB,
    output CLK2X
);

reg [2:0] phase_shift = 0;
reg [1:0] phase_inc_dec = 0;
reg clk_div2 = 0;
reg clk_div4 = 0;
reg clk_feedback = 0;

always @(posedge clkin or posedge RST) begin
    if (RST) begin
        phase_shift <= 0;
        phase_inc_dec <= 0;
        clk_div2 <= 0;
        clk_div4 <= 0;
        clk_feedback <= 0;
    end
    else begin
        if (PSEN) begin
            if (PSINCDEC)
                phase_inc_dec <= 2'b01;
            else
                phase_inc_dec <= 2'b10;
        end
        else
            phase_inc_dec <= 2'b00;

        if (PSCLK) begin
            case (phase_inc_dec)
                2'b01: phase_shift <= phase_shift + 1;
                2'b10: phase_shift <= phase_shift - 1;
                default: phase_shift <= phase_shift;
            endcase
        end

        clk_div2 <= ~clk_div2;
        clk_div4 <= ~clk_div4;
        clk_feedback <= clk_div4;
    end
end

assign clk0 = clk_div2;
assign CLKFB = clk_feedback;
assign CLK2X = clk_div2;

endmodule