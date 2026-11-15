module origen_173298(
    input CLK,
    input ENB,
    input DIR,
    input S_IN,
    input [1:0] MODO,
    input [3:0] D,
    output reg [3:0] Q,
    output reg S_OUT
);

    reg [1:0] MODO_TEMP;

    initial begin
        Q = 4'b0000;
    end

    [MASKED]

endmodule