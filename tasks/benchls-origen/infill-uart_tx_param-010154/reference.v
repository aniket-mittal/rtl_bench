module origen_010154 #(
    parameter DATA_BITS = 8,
    parameter STOP_BITS = 1,
    parameter CLKS_PER_BIT = 1000
) (
    input wire clk,
    input wire n_reset,
    input wire start,
    input wire [DATA_BITS-1:0] data_in,
    output reg ready,
    output reg out
);

    // State encoding
    localparam READY = 3'd0, SYNC = 3'd1, START = 3'd2, DATA = 3'd3, STOP = 3'd4;

    reg [2:0] state, next_state;
    reg [DATA_BITS-1:0] data_reg;
    reg [$clog2(DATA_BITS+STOP_BITS)-1:0] bit_ctr;
    reg [$clog2(CLKS_PER_BIT)-1:0] sample_ctr;
    wire next_bit;

    // Next bit signal
    assign next_bit = (sample_ctr == CLKS_PER_BIT - 1);

    // State machine
    always @(posedge clk or negedge n_reset) begin
        if (!n_reset) begin
            state <= READY;
            data_reg <= 0;
            bit_ctr <= 0;
            sample_ctr <= 0;
            ready <= 1'b1;
            out <= 1'b1;
        end else begin
            state <= next_state;
            
            case (state)
                READY: begin
                    if (start) begin
                        data_reg <= data_in;
                        ready <= 1'b0;
                    end
                end
                SYNC: begin
                    sample_ctr <= sample_ctr + 1;
                end
                START: begin
                    out <= 1'b0;
                    if (next_bit) sample_ctr <= 0;
                    else sample_ctr <= sample_ctr + 1;
                end
                DATA: begin
                    out <= data_reg[bit_ctr];
                    if (next_bit) begin
                        sample_ctr <= 0;
                        if (bit_ctr == DATA_BITS - 1) bit_ctr <= 0;
                        else bit_ctr <= bit_ctr + 1;
                    end else begin
                        sample_ctr <= sample_ctr + 1;
                    end
                end
                STOP: begin
                    out <= 1'b1;
                    if (next_bit) begin
                        sample_ctr <= 0;
                        if (bit_ctr == STOP_BITS - 1) begin
                            ready <= 1'b1;
                            bit_ctr <= 0;
                        end else begin
                            bit_ctr <= bit_ctr + 1;
                        end
                    end else begin
                        sample_ctr <= sample_ctr + 1;
                    end
                end
            endcase
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            READY: next_state = start ? SYNC : READY;
            SYNC: next_state = next_bit ? START : SYNC;
            START: next_state = next_bit ? DATA : START;
            DATA: next_state = (next_bit && bit_ctr == DATA_BITS - 1) ? STOP : DATA;
            STOP: next_state = (next_bit && bit_ctr == STOP_BITS - 1) ? READY : STOP;
            default: next_state = READY;
        endcase
    end

endmodule