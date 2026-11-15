module origen_104945 (
    input [4:0] exec,
    output reg [2:0] opALU,
    output reg operALUe,
    output reg operALUve,
    output reg operSum
);

    wire func = exec[4];
    wire [2:0] opcode = exec[3:1];

    [MASKED]

endmodule