module origen_059672(
    input clk,
    input sw1,
    input sw2,
    input sw3,
    input sw4,
    input rst,
    output reg [7:0] f
);

wire genclk;

clockgenerator clk_gen (
    .clk(clk),
    .sw3(sw3),
    .sw4(sw4),
    .clkout(genclk)
);

always @(posedge genclk or negedge rst) begin
    if (!rst) begin
        f <= 8'b0;
    end else begin
        if (sw2 && !sw1) begin
            f <= f + 1;
        end else if (!sw2 && sw1) begin
            f <= f - 1;
        end
    end
end

endmodule

module clockgenerator(
    input clk,
    input sw3,
    input sw4,
    output reg clkout
);

reg [27:0] counter;
wire [27:0] threshold;

assign threshold = (sw3 & sw4) ? 28'd10 :
                   (sw3 & ~sw4) ? 28'd20 :
                   (~sw3 & sw4) ? 28'd5 :
                   28'd40;

always @(posedge clk) begin
    if (counter >= threshold - 1) begin
        counter <= 28'd0;
        clkout <= ~clkout;
    end else begin
        counter <= counter + 1;
    end
end

endmodule