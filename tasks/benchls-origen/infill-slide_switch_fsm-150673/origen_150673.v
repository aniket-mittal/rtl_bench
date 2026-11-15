module origen_150673(
    input [2:0] SW,
    input CLOCK_27,
    output reg [1:0] LEDG,
    output reg [3:0] LEDR
);

reg [2:0] state;
localparam A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;

initial begin
    state = A;
end

[MASKED]

endmodule