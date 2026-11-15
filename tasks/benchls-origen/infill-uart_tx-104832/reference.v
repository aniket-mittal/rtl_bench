module origen_104832 #(
    parameter DATA_BITS = 8,
    parameter STOP_TICKS = 16
)(
    input wire clk,
    input wire reset,
    input wire tx_start,
    input wire baud_tick,
    input wire [7:0] din,
    output reg tx_done_tick,
    output wire tx
);

    // State definition
    localparam [1:0] 
        IDLE  = 2'b00,
        START = 2'b01,
        DATA  = 2'b10,
        STOP  = 2'b11;

    // Signal declaration
    reg [1:0] state_reg, state_next;
    reg [3:0] tick_reg, tick_next;
    reg [2:0] nbits_reg, nbits_next;
    reg [7:0] data_reg, data_next;
    reg tx_reg, tx_next;

    // FSMD state & data registers
    always @(posedge clk or posedge reset)
    begin
        if (reset) begin
            state_reg <= IDLE;
            tick_reg <= 0;
            nbits_reg <= 0;
            data_reg <= 0;
            tx_reg <= 1'b1;
        end else begin
            state_reg <= state_next;
            tick_reg <= tick_next;
            nbits_reg <= nbits_next;
            data_reg <= data_next;
            tx_reg <= tx_next;
        end
    end

    // FSMD next-state logic & functional units
    always @*
    begin
        state_next = state_reg;
        tick_next = tick_reg;
        nbits_next = nbits_reg;
        data_next = data_reg;
        tx_next = tx_reg;
        tx_done_tick = 1'b0;

        case(state_reg)
            IDLE: begin
                tx_next = 1'b1;
                if (tx_start) begin
                    state_next = START;
                    tick_next = 0;
                    data_next = din;
                end
            end

            START: begin
                tx_next = 1'b0;
                if (baud_tick)
                    if (tick_reg == 15) begin
                        state_next = DATA;
                        tick_next = 0;
                        nbits_next = 0;
                    end else
                        tick_next = tick_reg + 1;
            end

            DATA: begin
                tx_next = data_reg[0];
                if (baud_tick)
                    if (tick_reg == 15) begin
                        tick_next = 0;
                        data_next = data_reg >> 1;
                        if (nbits_reg == (DATA_BITS-1))
                            state_next = STOP;
                        else
                            nbits_next = nbits_reg + 1;
                    end else
                        tick_next = tick_reg + 1;
            end

            STOP: begin
                tx_next = 1'b1;
                if (baud_tick)
                    if (tick_reg == (STOP_TICKS-1)) begin
                        state_next = IDLE;
                        tx_done_tick = 1'b1;
                    end else
                        tick_next = tick_reg + 1;
            end

            default: state_next = IDLE;
        endcase
    end

    // Output
    assign tx = tx_reg;

endmodule