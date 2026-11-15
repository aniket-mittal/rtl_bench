module origen_044528 (
    input wire clk,
    input wire reset_n,
    input wire [4:0] address,
    output reg [7:0] dataout
);

    reg [7:0] lut [0:31];

    [MASKED]

    always @(posedge clk) begin
        dataout <= lut[address];
    end

endmodule