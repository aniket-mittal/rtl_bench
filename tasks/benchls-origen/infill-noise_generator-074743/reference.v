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

always @(*) begin
    case (selecta)
        3'd0: begin
            noise_clock = div_clk;
            div = 8'd32;
        end
        3'd1: begin
            noise_clock = div_clk;
            div = 8'd64;
        end
        3'd2: begin
            noise_clock = div_clk;
            div = 8'd128;
        end
        3'd3: begin
            noise_clock = tone;
            div = 8'd0;
        end
        default: begin
            noise_clock = div_clk;
            div = 8'd32;
        end
    endcase
end

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