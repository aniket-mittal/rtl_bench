// Modbus Master Block
module origen_148408 (
    input wire clk,
    input wire rst,
    input wire start,
    input wire [7:0] addr,
    input wire [7:0] func,
    input wire [15:0] data,
    output reg done,
    output reg [15:0] resp
);

    // State machine states
    localparam IDLE = 2'b00;
    localparam SEND = 2'b01;
    localparam WAIT = 2'b10;
    localparam RECEIVE = 2'b11;

    reg [1:0] state;
    reg [7:0] tx_data;
    reg [7:0] rx_data;
    reg [3:0] bit_count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            done <= 0;
            resp <= 16'h0000;
            tx_data <= 8'h00;
            rx_data <= 8'h00;
            bit_count <= 4'h0;
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        state <= SEND;
                        tx_data <= addr;
                        bit_count <= 4'h0;
                    end
                end
                SEND: begin
                    if (bit_count == 4'h8) begin
                        state <= WAIT;
                        bit_count <= 4'h0;
                    end else begin
                        tx_data <= {tx_data[6:0], 1'b0};
                        bit_count <= bit_count + 1;
                    end
                end
                WAIT: begin
                    state <= RECEIVE;
                    bit_count <= 4'h0;
                end
                RECEIVE: begin
                    if (bit_count == 4'h8) begin
                        state <= IDLE;
                        done <= 1;
                        resp <= {resp[7:0], rx_data};
                    end else begin
                        rx_data <= {rx_data[6:0], 1'b0};
                        bit_count <= bit_count + 1;
                    end
                end
            endcase
        end
    end
endmodule

// Modbus Slave Block
module modbus_slave (
    input wire clk,
    input wire rst,
    input wire [7:0] addr,
    input wire [7:0] func,
    input wire [15:0] data,
    output reg done,
    output reg [15:0] resp
);

    // State machine states
    localparam IDLE = 2'b00;
    localparam RECEIVE = 2'b01;
    localparam PROCESS = 2'b10;
    localparam SEND = 2'b11;

    reg [1:0] state;
    reg [7:0] rx_data;
    reg [7:0] tx_data;
    reg [3:0] bit_count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            done <= 0;
            resp <= 16'h0000;
            rx_data <= 8'h00;
            tx_data <= 8'h00;
            bit_count <= 4'h0;
        end else begin
            case (state)
                IDLE: begin
                    state <= RECEIVE;
                    bit_count <= 4'h0;
                end
                RECEIVE: begin
                    if (bit_count == 4'h8) begin
                        state <= PROCESS;
                        bit_count <= 4'h0;
                    end else begin
                        rx_data <= {rx_data[6:0], 1'b0};
                        bit_count <= bit_count + 1;
                    end
                end
                PROCESS: begin
                    if (rx_data == addr) begin
                        state <= SEND;
                        tx_data <= func;
                        resp <= data;
                    end else begin
                        state <= IDLE;
                    end
                end
                SEND: begin
                    if (bit_count == 4'h8) begin
                        state <= IDLE;
                        done <= 1;
                    end else begin
                        tx_data <= {tx_data[6:0], 1'b0};
                        bit_count <= bit_count + 1;
                    end
                end
            endcase
        end
    end
endmodule