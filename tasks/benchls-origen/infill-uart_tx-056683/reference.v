module origen_056683 #(
    parameter NB_DATA = 8,
    parameter NB_STOP = 1,
    parameter BAUD_RATE = 9600,
    parameter SYS_CLOCK = 100_000_000,
    parameter TICK_RATE = SYS_CLOCK / (BAUD_RATE * 16),
    parameter NB_TICK_COUNTER = $clog2(TICK_RATE),
    parameter NB_DATA_COUNTER = $clog2(NB_DATA)
) (
    input wire i_clock,
    input wire i_reset,
    input wire i_tick,
    input wire [NB_DATA-1:0] i_data,
    input wire i_start,
    output reg o_data
);

    localparam [1:0] IDLE  = 2'b00,
                     START = 2'b01,
                     SEND  = 2'b10,
                     STOP  = 2'b11;

    reg [1:0] state, next_state;
    reg [NB_TICK_COUNTER-1:0] tick_counter;
    reg [NB_DATA_COUNTER-1:0] data_bit_counter;
    reg [NB_DATA-1:0] shift_reg;

    always @(posedge i_clock or posedge i_reset) begin
        if (i_reset) begin
            state <= IDLE;
            tick_counter <= 0;
            data_bit_counter <= 0;
            shift_reg <= 0;
            o_data <= 1'b1;
        end else begin
            state <= next_state;
            if (i_tick) begin
                case (state)
                    IDLE: begin
                        if (i_start) begin
                            shift_reg <= i_data;
                            tick_counter <= 0;
                        end
                    end
                    START: begin
                        o_data <= 1'b0;
                        if (tick_counter == TICK_RATE - 1) begin
                            tick_counter <= 0;
                            data_bit_counter <= 0;
                        end else begin
                            tick_counter <= tick_counter + 1;
                        end
                    end
                    SEND: begin
                        o_data <= shift_reg[0];
                        if (tick_counter == TICK_RATE - 1) begin
                            tick_counter <= 0;
                            shift_reg <= {1'b0, shift_reg[NB_DATA-1:1]};
                            if (data_bit_counter == NB_DATA - 1) begin
                                data_bit_counter <= 0;
                            end else begin
                                data_bit_counter <= data_bit_counter + 1;
                            end
                        end else begin
                            tick_counter <= tick_counter + 1;
                        end
                    end
                    STOP: begin
                        o_data <= 1'b1;
                        if (tick_counter == (TICK_RATE * NB_STOP) - 1) begin
                            tick_counter <= 0;
                        end else begin
                            tick_counter <= tick_counter + 1;
                        end
                    end
                endcase
            end
        end
    end

    always @(*) begin
        case (state)
            IDLE:  next_state = i_start ? START : IDLE;
            START: next_state = (tick_counter == TICK_RATE - 1) ? SEND : START;
            SEND:  next_state = (tick_counter == TICK_RATE - 1 && data_bit_counter == NB_DATA - 1) ? STOP : SEND;
            STOP:  next_state = (tick_counter == (TICK_RATE * NB_STOP) - 1) ? IDLE : STOP;
            default: next_state = IDLE;
        endcase
    end

endmodule