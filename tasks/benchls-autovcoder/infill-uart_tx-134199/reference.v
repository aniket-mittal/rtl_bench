module autovcoder_134199 (
    input        clk,
    input        rst,
    input        tx_start,
    input [7:0]  data_in,
    output reg   tx,
    output reg   tx_busy
);
    reg [3:0]    state;
    reg [3:0]    bit_index;
    reg [7:0]    shift_reg;

    parameter IDLE = 0, START_BIT = 1, DATA_BITS = 2, STOP_BIT = 3;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            tx <= 1; // Idle state for UART is high
            tx_busy <= 0;
            bit_index <= 0;
        end else begin
            case (state)
                IDLE: begin
                    tx_busy <= 0;
                    if (tx_start) begin
                        shift_reg <= data_in;
                        state <= START_BIT;
                        tx_busy <= 1;
                        bit_index <= 0;
                    end
                end
                
                START_BIT: begin
                    tx <= 0; // Start bit is low
                    state <= DATA_BITS;
                end
                
                DATA_BITS: begin
                    tx <= shift_reg[bit_index];
                    if (bit_index < 7) begin
                        bit_index <= bit_index + 1;
                    end else begin
                        state <= STOP_BIT;
                    end
                end
                
                STOP_BIT: begin
                    tx <= 1; // Stop bit is high
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule