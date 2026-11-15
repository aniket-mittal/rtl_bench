module origen_004808 (
    input wire clock,
    input wire reset,
    input wire req_next,
    input wire ack_failed,
    input wire [8:0] dev_address_s,
    input wire [7:0] reg_address_s,
    input wire [7:0] data_s,
    output reg [2:0] send_next_state,
    output reg [7:0] send_byte_data
);

    // State parameters
    parameter IDLE = 3'd0;
    parameter START = 3'd1;
    parameter SEND_DEV_ADDR_W = 3'd2;
    parameter SEND_REG_ADDR = 3'd3;
    parameter SEND_DATA = 3'd4;
    parameter REPEATED_START = 3'd5;
    parameter SEND_DEV_ADDR_R = 3'd6;
    parameter RECEIVE_DATA = 3'd7;
    parameter STOP = 3'd8;

    reg [2:0] state_list;

    // Combinational logic for next state and output
    always @(*) begin
        case (state_list)
            IDLE: begin
                send_next_state = START;
                send_byte_data = 8'h00;
            end
            START: begin
                send_next_state = SEND_DEV_ADDR_W;
                send_byte_data = {dev_address_s[8:1], 1'b0}; // Write operation
            end
            SEND_DEV_ADDR_W: begin
                send_next_state = SEND_REG_ADDR;
                send_byte_data = reg_address_s;
            end
            SEND_REG_ADDR: begin
                if (dev_address_s[0]) begin // Read operation
                    send_next_state = REPEATED_START;
                    send_byte_data = 8'h00;
                end else begin // Write operation
                    send_next_state = SEND_DATA;
                    send_byte_data = data_s;
                end
            end
            SEND_DATA: begin
                send_next_state = STOP;
                send_byte_data = 8'h00;
            end
            REPEATED_START: begin
                send_next_state = SEND_DEV_ADDR_R;
                send_byte_data = {dev_address_s[8:1], 1'b1}; // Read operation
            end
            SEND_DEV_ADDR_R: begin
                send_next_state = RECEIVE_DATA;
                send_byte_data = 8'h00;
            end
            RECEIVE_DATA: begin
                send_next_state = STOP;
                send_byte_data = 8'h00;
            end
            STOP: begin
                send_next_state = IDLE;
                send_byte_data = 8'h00;
            end
            default: begin
                send_next_state = IDLE;
                send_byte_data = 8'h00;
            end
        endcase
    end

    // Sequential logic for state transitions
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            state_list <= IDLE;
        end else if (req_next) begin
            if (ack_failed) begin
                state_list <= STOP;
            end else begin
                case (state_list)
                    IDLE: state_list <= START;
                    START: state_list <= SEND_DEV_ADDR_W;
                    SEND_DEV_ADDR_W: state_list <= SEND_REG_ADDR;
                    SEND_REG_ADDR: 
                        if (dev_address_s[0]) state_list <= REPEATED_START;
                        else state_list <= SEND_DATA;
                    SEND_DATA: state_list <= STOP;
                    REPEATED_START: state_list <= SEND_DEV_ADDR_R;
                    SEND_DEV_ADDR_R: state_list <= RECEIVE_DATA;
                    RECEIVE_DATA: state_list <= STOP;
                    STOP: state_list <= IDLE;
                    default: state_list <= IDLE;
                endcase
            end
        end
    end

endmodule