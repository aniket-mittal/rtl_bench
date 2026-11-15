module origen_074743(
    input wire clk,
    input wire tone_clk,
    input wire tone,
    input wire [2:0] selecta,
    output wire noise_clk
);

reg noise_clock;
reg div_clk;
reg [7:0] div;
reg [7:0] clk_cntr;
reg [2:0] selectap;

[MASKED]

always @(posedge clk) begin
    if (tone_clk) begin
        if (clk_cntr == div - 1) begin
            clk_cntr <= 8'd0;
            div_clk <= 1'b1;
        end else begin
            clk_cntr <= clk_cntr + 1'b1;
            div_clk <= 1'b0;
        end
    end
end

assign noise_clk = noise_clock;

endmodule