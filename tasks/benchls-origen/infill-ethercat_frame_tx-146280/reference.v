module origen_146280 (
    input wire clk,
    input wire rst,
    input wire [7:0] tx_data,
    input wire tx_valid,
    input wire tx_ready,
    input wire [7:0] rx_data,
    input wire rx_valid,
    input wire rx_ready,
    output reg tx_ack,
    output reg rx_ack
);

// EtherCAT frame structure
parameter PREAMBLE = 8'h55;
parameter SFD = 8'hD5;
parameter ETHERTYPE = 16'h88A4;
parameter FRAME_TYPE = 8'h01;
parameter CMD = 8'h80;

// State machine states
localparam IDLE = 3'd0;
localparam TX_PREAMBLE = 3'd1;
localparam TX_SFD = 3'd2;
localparam TX_ETHERTYPE = 3'd3;
localparam TX_FRAME_TYPE = 3'd4;
localparam TX_CMD = 3'd5;
localparam TX_DATA = 3'd6;
localparam WAIT_ACK = 3'd7;

reg [2:0] state;
reg [2:0] tx_count;
reg [15:0] ethertype_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= IDLE;
        tx_count <= 0;
        tx_ack <= 0;
        rx_ack <= 0;
        ethertype_reg <= 0;
    end else begin
        case (state)
            IDLE: begin
                if (tx_valid && tx_ready) begin
                    state <= TX_PREAMBLE;
                    tx_count <= 0;
                end
            end
            TX_PREAMBLE: begin
                if (tx_count == 7) begin
                    state <= TX_SFD;
                    tx_count <= 0;
                end else begin
                    tx_count <= tx_count + 1;
                end
            end
            TX_SFD: begin
                state <= TX_ETHERTYPE;
                tx_count <= 0;
            end
            TX_ETHERTYPE: begin
                if (tx_count == 1) begin
                    state <= TX_FRAME_TYPE;
                    tx_count <= 0;
                end else begin
                    tx_count <= tx_count + 1;
                    ethertype_reg <= ETHERTYPE;
                end
            end
            TX_FRAME_TYPE: begin
                state <= TX_CMD;
            end
            TX_CMD: begin
                state <= TX_DATA;
            end
            TX_DATA: begin
                state <= WAIT_ACK;
            end
            WAIT_ACK: begin
                if (rx_valid && rx_ready) begin
                    rx_ack <= 1;
                    tx_ack <= 1;
                    state <= IDLE;
                end
            end
        endcase
    end
end

// Transmit logic
reg [7:0] tx_byte;
always @(*) begin
    case (state)
        TX_PREAMBLE: tx_byte = PREAMBLE;
        TX_SFD: tx_byte = SFD;
        TX_ETHERTYPE: tx_byte = (tx_count == 0) ? ethertype_reg[15:8] : ethertype_reg[7:0];
        TX_FRAME_TYPE: tx_byte = FRAME_TYPE;
        TX_CMD: tx_byte = CMD;
        TX_DATA: tx_byte = tx_data;
        default: tx_byte = 8'h00;
    endcase
end

// Receive logic
always @(posedge clk or posedge rst) begin
    if (rst) begin
        rx_ack <= 0;
    end else if (rx_valid && rx_ready) begin
        rx_ack <= 1;
    end else begin
        rx_ack <= 0;
    end
end

endmodule