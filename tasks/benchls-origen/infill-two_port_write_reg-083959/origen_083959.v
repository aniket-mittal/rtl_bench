module origen_083959 (
    input wire clk,
    input wire nrst,
    input wire [8:0] wrdata1,
    input wire [8:0] wrdata2,
    input wire wr1,
    input wire wr2,
    output reg [8:0] value
);

    // State encoding
    localparam IDLE = 2'b00;
    localparam WRITE1 = 2'b01;
    localparam WRITE2 = 2'b10;

    reg [1:0] state;
    reg [8:0] data;

    [MASKED]

endmodule