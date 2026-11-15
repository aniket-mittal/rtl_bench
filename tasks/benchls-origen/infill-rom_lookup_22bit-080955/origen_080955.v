module origen_080955 (
    input wire clk,
    input wire en,
    input wire [4:0] addr,
    output wire [21:0] dout
);

    parameter ROM_WID = 22;
    parameter ROM_DEP = 32;
    parameter ROM_ADDR = 5;

    reg [ROM_WID-1:0] data;

    [MASKED]

    assign dout = data;

endmodule