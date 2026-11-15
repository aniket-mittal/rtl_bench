module origen_134941 (
    input wire csi_clock_clk,
    input wire csi_clock_reset,
    input wire [2:0] avs_ctrl_address,
    input wire avs_ctrl_read,
    output reg [31:0] avs_ctrl_readdata,
    input wire avs_ctrl_write,
    input wire [31:0] avs_ctrl_writedata,
    input wire sync,
    input wire phase,
    output reg send,
    output reg sda,
    input wire rda
);

    // I2C states
    localparam IDLE = 3'd0;
    localparam START = 3'd1;
    localparam ADDRESS = 3'd2;
    localparam ACK = 3'd3;
    localparam DATA = 3'd4;
    localparam STOP = 3'd5;

    reg [2:0] state;
    reg [2:0] next_state;
    reg [7:0] bit_counter;
    reg [31:0] shift_register;
    reg [2:0] device_address;
    reg rw_bit;
    reg ack_received;

    always @(posedge csi_clock_clk or posedge csi_clock_reset) begin
        if (csi_clock_reset) begin
            state <= IDLE;
            bit_counter <= 8'd0;
            shift_register <= 32'd0;
            device_address <= 3'd0;
            rw_bit <= 1'b0;
            ack_received <= 1'b0;
            send <= 1'b0;
            sda <= 1'b1;
            avs_ctrl_readdata <= 32'd0;
        end else begin
            state <= next_state;
            case (state)
                IDLE: begin
                    if (avs_ctrl_write || avs_ctrl_read) begin
                        device_address <= avs_ctrl_address;
                        rw_bit <= avs_ctrl_read;
                        shift_register <= avs_ctrl_writedata;
                        next_state <= START;
                    end else begin
                        next_state <= IDLE;
                    end
                end
                START: begin
                    sda <= 1'b0;
                    next_state <= ADDRESS;
                    bit_counter <= 8'd0;
                end
                ADDRESS: begin
                    sda <= (bit_counter < 3) ? device_address[2 - bit_counter] :
                           (bit_counter == 3) ? rw_bit :
                           shift_register[31 - (bit_counter - 4)];
                    bit_counter <= bit_counter + 1;
                    if (bit_counter == 7) begin
                        next_state <= ACK;
                    end else begin
                        next_state <= ADDRESS;
                    end
                end
                ACK: begin
                    sda <= 1'b1; // Release SDA for slave ACK
                    ack_received <= ~rda;
                    if (ack_received) begin
                        next_state <= DATA;
                        bit_counter <= 8'd0;
                    end else begin
                        next_state <= STOP;
                    end
                end
                DATA: begin
                    if (rw_bit) begin // Read operation
                        shift_register <= {shift_register[30:0], rda};
                    end else begin // Write operation
                        sda <= shift_register[31 - bit_counter];
                    end
                    bit_counter <= bit_counter + 1;
                    if (bit_counter == 31) begin
                        next_state <= STOP;
                    end else begin
                        next_state <= DATA;
                    end
                end
                STOP: begin
                    sda <= 1'b0;
                    next_state <= IDLE;
                    if (rw_bit) begin
                        avs_ctrl_readdata <= shift_register;
                    end
                end
                default: next_state <= IDLE;
            endcase
        end
    end

    always @(posedge csi_clock_clk) begin
        send <= (state != IDLE);
    end

endmodule