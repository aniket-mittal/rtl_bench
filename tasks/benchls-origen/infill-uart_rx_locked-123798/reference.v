module origen_123798 (
    input wire clk_i,
    input wire rst_i,
    input wire rx_i,
    output reg rx_done_tick_o,
    output reg [7:0] dout_bo,
    output reg locked_o,
    output reg [15:0] bitperiod_o
);

// Parameters
localparam CLKS_PER_BIT = 868; // 100MHz / 115200 baud
localparam SAMPLE_MID = CLKS_PER_BIT / 2;
localparam IDLE = 2'b00;
localparam START = 2'b01;
localparam DATA = 2'b10;
localparam STOP = 2'b11;

// Internal signals
reg [1:0] state, next_state;
reg [15:0] clk_count;
reg [2:0] bit_index;
reg [7:0] rx_data;
reg rx_d1, rx_d2;
reg start_bit_detected;
reg [15:0] start_bit_time;

// Double-register rx_i for metastability
always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
        rx_d1 <= 1'b1;
        rx_d2 <= 1'b1;
    end else begin
        rx_d1 <= rx_i;
        rx_d2 <= rx_d1;
    end
end

// FSM state register
always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
        state <= IDLE;
    end else begin
        state <= next_state;
    end
end

// FSM combinational logic
always @(*) begin
    next_state = state;
    case (state)
        IDLE: begin
            if (!rx_d2)
                next_state = START;
        end
        START: begin
            if (clk_count == SAMPLE_MID)
                next_state = DATA;
        end
        DATA: begin
            if ((clk_count == CLKS_PER_BIT) && (bit_index == 3'b111))
                next_state = STOP;
        end
        STOP: begin
            if (clk_count == CLKS_PER_BIT)
                next_state = IDLE;
        end
    endcase
end

// Receiver logic
always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
        clk_count <= 0;
        bit_index <= 0;
        rx_data <= 0;
        rx_done_tick_o <= 0;
        dout_bo <= 0;
        locked_o <= 0;
        bitperiod_o <= CLKS_PER_BIT;
        start_bit_detected <= 0;
        start_bit_time <= 0;
    end else begin
        rx_done_tick_o <= 0;

        case (state)
            IDLE: begin
                clk_count <= 0;
                bit_index <= 0;
                if (!rx_d2) begin
                    start_bit_detected <= 1;
                    start_bit_time <= 0;
                end else if (start_bit_detected) begin
                    start_bit_time <= start_bit_time + 1;
                    if (rx_d2) begin
                        if (start_bit_time > 0 && start_bit_time < CLKS_PER_BIT * 2) begin
                            bitperiod_o <= start_bit_time;
                            locked_o <= 1;
                        end
                        start_bit_detected <= 0;
                    end
                end
            end
            START: begin
                if (clk_count < CLKS_PER_BIT - 1) begin
                    clk_count <= clk_count + 1;
                end else begin
                    clk_count <= 0;
                end
            end
            DATA: begin
                if (clk_count < CLKS_PER_BIT - 1) begin
                    clk_count <= clk_count + 1;
                end else begin
                    clk_count <= 0;
                    bit_index <= bit_index + 1;
                    rx_data[bit_index] <= rx_d2;
                end
            end
            STOP: begin
                if (clk_count < CLKS_PER_BIT - 1) begin
                    clk_count <= clk_count + 1;
                end else begin
                    rx_done_tick_o <= 1;
                    dout_bo <= rx_data;
                    clk_count <= 0;
                end
            end
        endcase
    end
end

endmodule