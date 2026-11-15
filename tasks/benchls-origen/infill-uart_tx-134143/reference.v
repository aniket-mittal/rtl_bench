module origen_134143 (
    input wire BAUD_CLK,
    input wire RESET_N,
    input wire TX_START,
    input wire TX_STOP,
    input wire [1:0] TX_WORD,
    input wire TX_PAR_DIS,
    input wire [1:0] TX_PARITY,
    input wire CTS,
    input wire [7:0] TX_BUFFER,
    output reg TX_DATA,
    output reg TX_DONE
);

    // State machine states
    localparam IDLE = 3'b000;
    localparam START_BIT = 3'b001;
    localparam DATA_BITS = 3'b010;
    localparam PARITY_BIT = 3'b011;
    localparam STOP_BIT = 3'b100;

    reg [2:0] state, next_state;
    reg [3:0] bit_counter;
    reg [7:0] shift_register;
    reg parity;

    // Determine the number of data bits
    wire [3:0] data_bits = (TX_WORD == 2'b00) ? 4'd5 :
                           (TX_WORD == 2'b01) ? 4'd6 :
                           (TX_WORD == 2'b10) ? 4'd7 : 4'd8;

    always @(posedge BAUD_CLK or negedge RESET_N) begin
        if (!RESET_N) begin
            state <= IDLE;
            TX_DATA <= 1'b1;
            TX_DONE <= 1'b0;
            bit_counter <= 4'd0;
            shift_register <= 8'd0;
            parity <= 1'b0;
        end else begin
            state <= next_state;
            
            case (state)
                IDLE: begin
                    TX_DATA <= 1'b1;
                    TX_DONE <= 1'b0;
                    if (TX_START && CTS) begin
                        shift_register <= TX_BUFFER;
                        parity <= ^TX_BUFFER ^ TX_PARITY[0];
                    end
                end
                
                START_BIT: begin
                    TX_DATA <= 1'b0;
                    bit_counter <= data_bits - 1;
                end
                
                DATA_BITS: begin
                    TX_DATA <= shift_register[0];
                    shift_register <= {1'b0, shift_register[7:1]};
                    bit_counter <= bit_counter - 1;
                end
                
                PARITY_BIT: begin
                    if (!TX_PAR_DIS) begin
                        case (TX_PARITY)
                            2'b00, 2'b01: TX_DATA <= parity;
                            2'b10: TX_DATA <= 1'b1;
                            2'b11: TX_DATA <= 1'b0;
                        endcase
                    end
                end
                
                STOP_BIT: begin
                    TX_DATA <= 1'b1;
                    TX_DONE <= 1'b1;
                end
            endcase
        end
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE:
                if (TX_START && CTS) next_state = START_BIT;
            START_BIT:
                next_state = DATA_BITS;
            DATA_BITS:
                if (bit_counter == 0) begin
                    if (TX_PAR_DIS) next_state = STOP_BIT;
                    else next_state = PARITY_BIT;
                end
            PARITY_BIT:
                next_state = STOP_BIT;
            STOP_BIT:
                if (TX_STOP || !CTS) next_state = IDLE;
        endcase
    end

endmodule