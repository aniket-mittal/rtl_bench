module origen_160607 #(
    parameter POLYNOMIAL = 16'h8005  // CRC-16 polynomial
)(
    input  wire        i_sys_clk,
    input  wire [7:0]  i_byte_in,
    input  wire        i_take,
    input  wire        i_reset,
    output reg         o_ready,
    output reg [15:0]  o_crc16
);

localparam CRC_IDLE = 2'b00;
localparam CRC_LOAD = 2'b01;
localparam CRC_NOTIFY = 2'b10;

reg [1:0] state;
reg [7:0] data_reg;
reg [3:0] bit_count;

[MASKED]

endmodule