module origen_019603 #(
    parameter DATA_BITS = 8,
    parameter STOP_BITS = 1,
    parameter N_TICK = 16,
    parameter LEN_TICK_COUNTER = $clog2(N_TICK),
    parameter LEN_DATA_COUNTER = $clog2(DATA_BITS)
) (
    input wire i_clock,
    input wire i_reset,
    input wire i_tick,
    input wire [DATA_BITS-1:0] i_data,
    input wire i_start,
    output wire o_data,
    output wire o_available_tx
);

    // State encoding
    localparam [1:0] IDLE = 2'b00,
                     START = 2'b01,
                     SEND_DATA = 2'b10,
                     STOP = 2'b11;

    // Registers
    reg [DATA_BITS-1:0] data_reg;
    reg [LEN_TICK_COUNTER-1:0] tick_reg;
    reg [LEN_DATA_COUNTER-1:0] data_counter;
    reg [1:0] state_reg, state_next;
    reg tx_reg, tx_next;
    reg available_tx_reg, available_tx_next;

    // State and output logic
    always @(*) begin
        state_next = state_reg;
        tx_next = tx_reg;
        available_tx_next = available_tx_reg;

        case (state_reg)
            IDLE: begin
                if (i_start) begin
                    state_next = START;
                    tx_next = 1'b0;
                    available_tx_next = 1'b0;
                end
            end
            START: begin
                if (tick_reg == N_TICK - 1) begin
                    state_next = SEND_DATA;
                    tx_next = data_reg[0];
                end
            end
            SEND_DATA: begin
                if (tick_reg == N_TICK - 1) begin
                    if (data_counter == DATA_BITS - 1) begin
                        state_next = STOP;
                        tx_next = 1'b1;
                    end else begin
                        tx_next = data_reg[data_counter + 1];
                    end
                end
            end
            STOP: begin
                if (tick_reg == (N_TICK * STOP_BITS) - 1) begin
                    state_next = IDLE;
                    available_tx_next = 1'b1;
                end
            end
        endcase
    end

    // Sequential logic
    always @(posedge i_clock or posedge i_reset) begin
        if (i_reset) begin
            state_reg <= IDLE;
            tx_reg <= 1'b1;
            available_tx_reg <= 1'b1;
            data_reg <= {DATA_BITS{1'b0}};
            tick_reg <= {LEN_TICK_COUNTER{1'b0}};
            data_counter <= {LEN_DATA_COUNTER{1'b0}};
        end else begin
            state_reg <= state_next;
            tx_reg <= tx_next;
            available_tx_reg <= available_tx_next;

            if (state_reg == IDLE && i_start) begin
                data_reg <= i_data;
                tick_reg <= {LEN_TICK_COUNTER{1'b0}};
                data_counter <= {LEN_DATA_COUNTER{1'b0}};
            end else if (i_tick) begin
                if (tick_reg == N_TICK - 1) begin
                    tick_reg <= {LEN_TICK_COUNTER{1'b0}};
                    if (state_reg == SEND_DATA) begin
                        data_counter <= data_counter + 1'b1;
                    end
                end else begin
                    tick_reg <= tick_reg + 1'b1;
                end
            end
        end
    end

    // Output assignments
    assign o_data = tx_reg;
    assign o_available_tx = available_tx_reg;

endmodule