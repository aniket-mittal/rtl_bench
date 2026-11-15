module origen_104052 (
    input wire clk,
    input wire nrst,
    input wire door,
    input wire start,
    input wire finish,
    output wire heat,
    output wire light,
    output wire bell
);

    // State register
    reg [4:0] q;

    // Next state logic
    [MASKED]

    // Output logic
    assign heat = q[2];
    assign light = q[2] | q[1] | q[4];
    assign bell = q[3];

endmodule