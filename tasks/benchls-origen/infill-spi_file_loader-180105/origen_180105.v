module origen_180105 (
    input         clk,
    input         reset,

    input         SPI_SCK,
    input         SPI_SS2,
    input         SPI_DI,
    output reg    SPI_DO,

    output reg    ioctl_download,
    output reg [7:0] ioctl_index,
    output reg    ioctl_we,
    output reg [24:0] ioctl_addr,
    output reg [7:0] ioctl_dout
);

reg [2:0] state;
reg [7:0] command;
reg [7:0] data_buffer;
reg [24:0] addr_buffer;
reg [3:0] bit_count;
reg rclk;

localparam
    IDLE          = 3'd0,
    CMD_RX        = 3'd1,
    ADDR_RX       = 3'd2,
    DATA_RX       = 3'd3,
    FILE_TX       = 3'd4;

[MASKED]

endmodule