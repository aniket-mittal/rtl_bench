// Modbus Master Block
module origen_140848 (
    input wire clk,
    input wire rst,
    input wire en,
    output reg tx,
    input wire rx,
    output reg done
);

    // States
    localparam IDLE = 3'b000;
    localparam SEND_REQUEST = 3'b001;
    localparam WAIT_RESPONSE = 3'b010;
    localparam RECEIVE_RESPONSE = 3'b011;
    localparam COMPLETE = 3'b100;

    reg [2:0] state, next_state;
    reg [7:0] function_code, data_address, data_length, data;
    reg [7:0] tx_buffer [0:3];
    reg [2:0] tx_count, rx_count;
    reg [7:0] rx_buffer [0:2];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            tx <= 1'b1;
            done <= 1'b0;
            tx_count <= 3'b000;
            rx_count <= 3'b000;
        end else begin
            state <= next_state;
            case (state)
                IDLE: begin
                    if (en) begin
                        function_code <= 8'h03; // Read Holding Registers
                        data_address <= 8'h00;
                        data_length <= 8'h01;
                        data <= 8'h00;
                        tx_buffer[0] <= function_code;
                        tx_buffer[1] <= data_address;
                        tx_buffer[2] <= data_length;
                        tx_buffer[3] <= data;
                    end
                end
                SEND_REQUEST: begin
                    tx <= tx_buffer[tx_count];
                    tx_count <= tx_count + 1;
                end
                WAIT_RESPONSE: begin
                    tx <= 1'b1;
                end
                RECEIVE_RESPONSE: begin
                    rx_buffer[rx_count] <= rx;
                    rx_count <= rx_count + 1;
                end
                COMPLETE: begin
                    done <= 1'b1;
                end
            endcase
        end
    end

    always @(*) begin
        case (state)
            IDLE: next_state = (en) ? SEND_REQUEST : IDLE;
            SEND_REQUEST: next_state = (tx_count == 3'b100) ? WAIT_RESPONSE : SEND_REQUEST;
            WAIT_RESPONSE: next_state = (rx == 1'b0) ? RECEIVE_RESPONSE : WAIT_RESPONSE;
            RECEIVE_RESPONSE: next_state = (rx_count == 3'b011) ? COMPLETE : RECEIVE_RESPONSE;
            COMPLETE: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

endmodule

// Modbus Slave Block
module modbus_slave (
    input wire clk,
    input wire rst,
    input wire en,
    input wire rx,
    output reg tx,
    output reg done
);

    // States
    localparam IDLE = 3'b000;
    localparam RECEIVE_REQUEST = 3'b001;
    localparam PROCESS_REQUEST = 3'b010;
    localparam SEND_RESPONSE = 3'b011;
    localparam COMPLETE = 3'b100;

    reg [2:0] state, next_state;
    reg [7:0] rx_buffer [0:3];
    reg [7:0] tx_buffer [0:2];
    reg [2:0] rx_count, tx_count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            tx <= 1'b1;
            done <= 1'b0;
            rx_count <= 3'b000;
            tx_count <= 3'b000;
        end else begin
            state <= next_state;
            case (state)
                IDLE: begin
                    if (en && rx == 1'b0) begin
                        rx_count <= 3'b000;
                    end
                end
                RECEIVE_REQUEST: begin
                    rx_buffer[rx_count] <= rx;
                    rx_count <= rx_count + 1;
                end
                PROCESS_REQUEST: begin
                    tx_buffer[0] <= rx_buffer[0]; // Function code
                    tx_buffer[1] <= 8'h01; // Data length
                    tx_buffer[2] <= 8'hAA; // Data (example value)
                end
                SEND_RESPONSE: begin
                    tx <= tx_buffer[tx_count];
                    tx_count <= tx_count + 1;
                end
                COMPLETE: begin
                    done <= 1'b1;
                end
            endcase
        end
    end

    always @(*) begin
        case (state)
            IDLE: next_state = (en && rx == 1'b0) ? RECEIVE_REQUEST : IDLE;
            RECEIVE_REQUEST: next_state = (rx_count == 3'b100) ? PROCESS_REQUEST : RECEIVE_REQUEST;
            PROCESS_REQUEST: next_state = SEND_RESPONSE;
            SEND_RESPONSE: next_state = (tx_count == 3'b011) ? COMPLETE : SEND_RESPONSE;
            COMPLETE: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

endmodule