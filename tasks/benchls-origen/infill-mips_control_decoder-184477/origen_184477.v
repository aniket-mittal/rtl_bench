module origen_184477(
    input [5:0] op,
    input [5:0] func,
    output reg wreg,
    output reg m2reg,
    output reg wmem,
    output reg aluimm,
    output reg regrt,
    output reg [2:0] aluc
);

    parameter ADD = 3'b000;
    parameter SUB = 3'b001;
    parameter AND = 3'b010;
    parameter OR  = 3'b011;
    parameter XOR = 3'b100;

    [MASKED]

endmodule