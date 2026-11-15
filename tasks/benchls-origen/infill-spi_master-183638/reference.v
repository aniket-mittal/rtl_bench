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
always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= IDLE;
        buffer <= 0;
        buffer_ctr <= 0;
        tx_on_rising <= 0;
        rx_on_rising <= 0;
        ignore_tx <= 0;
        transfer_done <= 0;
        mosi <= 1'b0;
        data_out <= 8'b0;
    end
    else begin
        case (state)
            IDLE: begin
                if (start) begin
                    state <= INIT;
                    tx_on_rising <= cpha;
                    rx_on_rising <= ~cpha;
                end
            end
            INIT: begin
                state <= TRANSFER;
                buffer <= data_in;
                buffer_ctr <= 0;
            end
            TRANSFER: begin
                if (sck_rising) begin
                    if (tx_on_rising) begin
                        mosi <= buffer[7];
                        buffer <= {buffer[6:0], 1'b0};
                    end
                    if (rx_on_rising) begin
                        buffer[0] <= miso;
                        buffer <= {buffer[6:0], buffer[0]};
                    end
                    buffer_ctr <= buffer_ctr + 1;
                end
                if (sck_falling) begin
                    if (!tx_on_rising) begin
                        mosi <= buffer[7];
                        buffer <= {buffer[6:0], 1'b0};
                    end
                    if (!rx_on_rising) begin
                        buffer[0] <= miso;
                        buffer <= {buffer[6:0], buffer[0]};
                    end
                end
                if (buffer_ctr == 7) begin
                    state <= FINISH;
                    transfer_done <= 1;
                end
            end
            FINISH: begin
                data_out <= buffer;
                transfer_done <= 0;
                state <= IDLE;
            end
        endcase
    end
end

assign busy = (state != IDLE);

endmodule