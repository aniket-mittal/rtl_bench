module origen_040571 #(
    parameter BAUD = 256000,
    parameter SYS_CLK_PERIOD = 50,
    parameter BAUD_CNT_END = (1000000000 / (BAUD * SYS_CLK_PERIOD)) - 1,
    parameter HALF_BAUD_CNT = BAUD_CNT_END / 2
) (
    input wire SYS_CLK,
    input wire RST_N,
    input wire Rxd,
    output reg [7:0] rx_data,
    output reg rx_busy
);

    // State definitions
    localparam IDLE = 2'b00;
    localparam READ = 2'b01;
    localparam STOP = 2'b10;

    reg [1:0] state, next_state;
    reg [3:0] bit_cnt;
    reg [15:0] baud_count;
    reg [7:0] shift_data;
    reg rx_start, flag_half_baud;

    // State machine
    always @(posedge SYS_CLK or negedge RST_N) begin
        if (!RST_N)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = rx_start ? READ : IDLE;
            READ: next_state = (bit_cnt == 4'd9 && flag_half_baud) ? STOP : READ;
            STOP: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Detect start of transmission
    always @(posedge SYS_CLK or negedge RST_N) begin
        if (!RST_N)
            rx_start <= 1'b0;
        else if (state == IDLE && Rxd == 1'b0)
            rx_start <= 1'b1;
        else
            rx_start <= 1'b0;
    end

    // Baud rate counter
    always @(posedge SYS_CLK or negedge RST_N) begin
        if (!RST_N) begin
            baud_count <= 16'd0;
            flag_half_baud <= 1'b0;
        end else if (state == IDLE) begin
            baud_count <= 16'd0;
            flag_half_baud <= 1'b0;
        end else begin
            if (baud_count == BAUD_CNT_END) begin
                baud_count <= 16'd0;
                flag_half_baud <= 1'b1;
            end else begin
                baud_count <= baud_count + 1'b1;
                flag_half_baud <= (baud_count == HALF_BAUD_CNT);
            end
        end
    end

    // Bit counter
    always @(posedge SYS_CLK or negedge RST_N) begin
        if (!RST_N)
            bit_cnt <= 4'd0;
        else if (state == IDLE)
            bit_cnt <= 4'd0;
        else if (state == READ && flag_half_baud)
            bit_cnt <= bit_cnt + 1'b1;
    end

    // Shift register
    always @(posedge SYS_CLK or negedge RST_N) begin
        if (!RST_N)
            shift_data <= 8'd0;
        else if (state == READ && flag_half_baud)
            shift_data <= {Rxd, shift_data[7:1]};
    end

    // Output data
    always @(posedge SYS_CLK or negedge RST_N) begin
        if (!RST_N)
            rx_data <= 8'd0;
        else if (state == STOP)
            rx_data <= shift_data;
    end

    // Busy signal
    always @(posedge SYS_CLK or negedge RST_N) begin
        if (!RST_N)
            rx_busy <= 1'b0;
        else
            rx_busy <= (state == READ);
    end

endmodule