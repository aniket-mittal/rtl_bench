module origen_044662 (
    input wire clk,
    input wire rst_n,
    input wire [255:0] key,
    input wire [127:0] l1,
    input wire [1:0] key_op,
    input wire key_en,
    input wire key_clr,
    output reg [1:0] st_ksize,
    output reg warn_ksize,
    output wire [127:0] w0,
    output wire [127:0] w1,
    output wire [127:0] w2,
    output wire [127:0] w3
);

    reg [511:0] tk;
    reg warn_128, warn_192;

    [MASKED]

    assign w0 = tk[127:0];
    assign w1 = tk[255:128];
    assign w2 = tk[383:256];
    assign w3 = tk[511:384];

endmodule