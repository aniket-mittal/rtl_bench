module origen_017339(
    input wire clk,
    input wire reset,
    input wire [4:0] digito,
    input wire cambio_digito,
    output reg [4:0] u,
    output reg [4:0] d,
    output reg [4:0] c,
    output wire RGB_full
);

    reg [2:0] sel;

    [MASKED]

    assign RGB_full = ~(u[4] | d[4] | c[4]);

endmodule