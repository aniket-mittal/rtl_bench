module origen_035245 (
    input wire clk,
    input wire reset_n,
    input wire waitrequest,
    input wire readdatavalid,
    input wire [15:0] readdata,
    input wire ready,
    output reg read_n,
    output reg write_n,
    output reg chipselect,
    output reg [31:0] address,
    output reg [1:0] byteenable,
    output reg [15:0] writedata,
    output reg done,
    output reg [15:0] max,
    output reg [15:0] min,
    output reg [1:0] state
);

    localparam IDLE = 2'b00;
    localparam READ = 2'b01;
    localparam WRITE = 2'b10;
    localparam DONE = 2'b11;

    localparam SECOND = 50000000; // 50 MHz clock
    localparam BASE_SDRAM = 32'h0;

    reg [3:0] numread;
    reg write_flag;

    [MASKED]

endmodule