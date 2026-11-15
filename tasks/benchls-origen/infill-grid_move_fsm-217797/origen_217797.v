module origen_217797(
    input clk25MHz,
    input up, down, right, left,
    input [3:0] step_2,
    input [2:0] secim1, es1, secim2,
    output reg [2:0] es2
);

parameter kare0 = 3'b000, kare1 = 3'b001, kare2 = 3'b010, kare3 = 3'b011,
          kare4 = 3'b100, kare5 = 3'b101, kare6 = 3'b110, kare7 = 3'b111;

reg [2:0] mover = 1;

[MASKED]

endmodule