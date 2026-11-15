module origen_106122 (
    input wire sd_clk,
    input wire sd_rst,
    output reg [3:0] sd_cmd,
    output reg [12:0] sd_a,
    output reg [1:0] sd_dqm,
    output reg sd_cke,
    output reg sd_rdy
);

    // SDRAM commands
    localparam [3:0] CMD_NOP      = 4'b0111;
    localparam [3:0] CMD_ACTIVE   = 4'b0011;
    localparam [3:0] CMD_READ     = 4'b0101;
    localparam [3:0] CMD_WRITE    = 4'b0100;
    localparam [3:0] CMD_TERM     = 4'b0110;
    localparam [3:0] CMD_PRECHARGE= 4'b0010;
    localparam [3:0] CMD_REFRESH  = 4'b0001;
    localparam [3:0] CMD_LOAD_MODE= 4'b0000;

    // SDRAM configuration
    localparam [12:0] MODE_REG    = 13'b000000110_0_000;
    localparam [9:0] START_DELAY  = 10'd1000;

    reg [4:0] reset;
    reg [3:0] t;
    reg [9:0] start_delay;

    [MASKED]

endmodule