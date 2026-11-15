module origen_222992 (
    // Host interface
    input  wire        host_cmd,
    input  wire        host_dat,
    input  wire        host_clk,
    input  wire        host_rst,
    output reg         host_busy,
    output reg         host_resp,
    output reg         host_data,

    // Device interface
    input  wire        dev_cmd,
    input  wire        dev_dat,
    input  wire        dev_clk,
    input  wire        dev_rst,
    output reg         dev_busy,
    output reg         dev_resp,
    output reg         dev_data
);

    // State machine
    parameter IDLE     = 3'd0,
              CMD_RECV = 3'd1,
              CMD_EXEC = 3'd2,
              DATA_RX  = 3'd3,
              DATA_TX  = 3'd4,
              RESP     = 3'd5;

    reg [2:0] state, next_state;
    reg [7:0] cmd_buffer;
    reg [7:0] data_buffer;

    // State machine logic
    always @(posedge host_clk or posedge host_rst) begin
        if (host_rst) begin
            state <= IDLE;
            host_busy <= 1'b0;
            host_resp <= 1'b0;
            host_data <= 1'b0;
        end else begin
            state <= next_state;
            case (state)
                IDLE: begin
                    if (host_cmd) begin
                        next_state <= CMD_RECV;
                        host_busy <= 1'b1;
                    end else begin
                        next_state <= IDLE;
                        host_busy <= 1'b0;
                    end
                end
                CMD_RECV: begin
                    cmd_buffer <= {host_dat, cmd_buffer[7:1]};
                    if (cmd_buffer[0]) begin
                        next_state <= CMD_EXEC;
                    end else begin
                        next_state <= CMD_RECV;
                    end
                end
                CMD_EXEC: begin
                    // Execute command
                    if (cmd_buffer == 8'h51) begin // CMD17 (read single block)
                        next_state <= DATA_TX;
                    end else if (cmd_buffer == 8'h58) begin // CMD24 (write single block)
                        next_state <= DATA_RX;
                    end else begin
                        next_state <= RESP;
                    end
                end
                DATA_RX: begin
                    data_buffer <= {dev_dat, data_buffer[7:1]};
                    if (data_buffer[0]) begin
                        next_state <= RESP;
                        // Write data to SD card
                    end else begin
                        next_state <= DATA_RX;
                    end
                end
                DATA_TX: begin
                    host_data <= dev_dat;
                    if (dev_dat == 1'b0) begin
                        next_state <= RESP;
                    end else begin
                        next_state <= DATA_TX;
                    end
                end
                RESP: begin
                    host_resp <= 1'b1;
                    next_state <= IDLE;
                    host_busy <= 1'b0;
                end
            endcase
        end
    end

    // Device interface logic
    always @(posedge dev_clk or posedge dev_rst) begin
        if (dev_rst) begin
            dev_busy <= 1'b0;
            dev_resp <= 1'b0;
            dev_data <= 1'b0;
        end else begin
            dev_busy <= host_busy;
            dev_resp <= host_resp;
            dev_data <= host_data;
        end
    end

endmodule