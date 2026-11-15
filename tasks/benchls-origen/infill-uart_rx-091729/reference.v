module origen_091729 (
    input wire sysclk,
    input wire nrst,
    input wire rs232_rx,
    output reg rx_done,
    output reg [7:0] rx_data
);

// Parameters
localparam IDLE = 1'b0;
localparam CNT_GEN = 1'b1;
localparam BIT_CNT_MAX = 9'd511;
localparam SAMPLE_POINT = 9'd2604;
localparam BIT_PERIOD = 13'd5208;

// Internal signals
reg [2:0] rs232_rx_sync;
wire rx_in;
reg rx_in_d;
wire start_bit;
reg state, next_state;
reg [12:0] bit_cnt;
reg [8:0] sample_cnt;
reg [8:0] cash_rxdata;
reg flag_rx_busy;

// Input synchronization
always @(posedge sysclk or negedge nrst) begin
    if (!nrst)
        rs232_rx_sync <= 3'b111;
    else
        rs232_rx_sync <= {rs232_rx_sync[1:0], rs232_rx};
end

assign rx_in = rs232_rx_sync[2];

// Start bit detection
always @(posedge sysclk or negedge nrst) begin
    if (!nrst)
        rx_in_d <= 1'b1;
    else
        rx_in_d <= rx_in;
end

assign start_bit = rx_in_d & ~rx_in;

// State machine
always @(posedge sysclk or negedge nrst) begin
    if (!nrst)
        state <= IDLE;
    else
        state <= next_state;
end

always @(*) begin
    case (state)
        IDLE: next_state = start_bit ? CNT_GEN : IDLE;
        CNT_GEN: next_state = (bit_cnt == BIT_PERIOD && sample_cnt == BIT_CNT_MAX) ? IDLE : CNT_GEN;
        default: next_state = IDLE;
    endcase
end

// Bit and sample counters
always @(posedge sysclk or negedge nrst) begin
    if (!nrst) begin
        bit_cnt <= 13'd0;
        sample_cnt <= 9'd0;
    end else if (state == CNT_GEN) begin
        if (bit_cnt == BIT_PERIOD) begin
            bit_cnt <= 13'd0;
            sample_cnt <= sample_cnt + 9'd1;
        end else begin
            bit_cnt <= bit_cnt + 13'd1;
        end
    end else begin
        bit_cnt <= 13'd0;
        sample_cnt <= 9'd0;
    end
end

// Data capture
always @(posedge sysclk or negedge nrst) begin
    if (!nrst) begin
        cash_rxdata <= 9'd0;
        flag_rx_busy <= 1'b0;
    end else if (state == CNT_GEN) begin
        if (bit_cnt == SAMPLE_POINT) begin
            cash_rxdata <= {rx_in, cash_rxdata[8:1]};
        end
        flag_rx_busy <= 1'b1;
    end else begin
        flag_rx_busy <= 1'b0;
    end
end

// Output generation
always @(posedge sysclk or negedge nrst) begin
    if (!nrst) begin
        rx_done <= 1'b0;
        rx_data <= 8'd0;
    end else if (state == CNT_GEN && sample_cnt == BIT_CNT_MAX) begin
        rx_done <= 1'b1;
        rx_data <= cash_rxdata[8:1];
    end else begin
        rx_done <= 1'b0;
    end
end

endmodule