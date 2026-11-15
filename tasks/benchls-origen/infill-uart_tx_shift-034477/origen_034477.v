module origen_034477(
    input wire clk,
    input wire RESET,
    input wire [7:0] data,
    input wire send_pluse,
    output reg bit8,
    output reg TXD
);

    reg [3:0] cnt;
    reg [7:0] sendsign;
    reg [1:0] state;

    localparam IDLE = 2'b00;
    localparam SEND = 2'b01;

    [MASKED]

endmodule