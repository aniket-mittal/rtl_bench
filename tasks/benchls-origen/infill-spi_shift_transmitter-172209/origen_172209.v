module origen_172209(
    input clock,
    input reset,
    input start_tr,
    input device,
    input [4:0] num_bits,
    input [31:0] sclk_divider,
    input [31:0] set_data,
    output reg ready,
    output reg [1:0] sen,
    output reg sclk,
    output reg mosi
);

reg [31:0] sclk_counter;
reg [4:0] bit_counter;
reg [31:0] dataout_reg;
reg sen_is_idle;

localparam WAIT_TRIG = 3'b000;
localparam PRE_IDLE = 3'b001;
localparam CLK_REG = 3'b010;
localparam CLK_INV = 3'b011;
localparam POST_IDLE = 3'b100;
localparam IDLE_SEN = 3'b101;
localparam READY_LOW = 3'b110;

reg [2:0] state;

[MASKED]

endmodule