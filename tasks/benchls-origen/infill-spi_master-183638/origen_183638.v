module origen_183638 (
    input        clk,
    input        rst,
    input        miso,
    input        start,
    input        cpol,
    input        cpha,
    input [7:0]  clk_div,
    input [7:0]  data_in,
    output reg   sck,
    output reg   mosi,
    output       busy,
    output reg [7:0] data_out
);

// States
localparam IDLE    = 2'b00;
localparam INIT    = 2'b01;
localparam TRANSFER = 2'b10;
localparam FINISH  = 2'b11;

// Internal signals
reg [1:0] state;
reg [7:0] buffer;
reg [2:0] buffer_ctr;
reg       sck_toggle;
reg       tx_on_rising;
reg       rx_on_rising;
reg       ignore_tx;
reg       transfer_done;

// SPI clock generation
reg [7:0] clk_div_counter;
wire      sck_rising;
wire      sck_falling;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        clk_div_counter <= 0;
        sck_toggle <= 0;
    end
    else begin
        if (clk_div_counter == clk_div - 1) begin
            clk_div_counter <= 0;
            sck_toggle <= ~sck_toggle;
        end
        else begin
            clk_div_counter <= clk_div_counter + 1;
        end
    end
end

assign sck_rising = (cpol == 0) ? sck_toggle : ~sck_toggle;
assign sck_falling = (cpol == 0) ? ~sck_toggle : sck_toggle;
always @(*) begin
    sck = (state == IDLE) ? 1'b0 : sck_toggle;
end

// State machine
[MASKED]

assign busy = (state != IDLE);

endmodule