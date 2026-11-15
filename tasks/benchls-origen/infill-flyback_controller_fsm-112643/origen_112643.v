module origen_112643 (
    input wire i_enable,
    input wire i_peak,
    input wire i_hold,
    input wire i_period,
    input wire i_clk,
    output reg o_flyback,
    output reg o_set,
    output reg o_reset
);

    // State encoding
    parameter IDLE = 2'b00;
    parameter PEAK = 2'b01;
    parameter HOLD = 2'b10;

    reg [1:0] m_PS, m_NS;

    // Sequential logic for state transitions
    always @(posedge i_clk) begin
        m_PS <= m_NS;
    end

    // Combinational logic for next state
    [MASKED]

    // Output logic
    always @(*) begin
        // Default output values
        o_flyback = 1'b0;
        o_set = 1'b0;
        o_reset = 1'b0;

        case (m_PS)
            IDLE: o_reset = 1'b1;
            PEAK: o_set = 1'b1;
            HOLD: begin
                o_flyback = 1'b1;
                o_set = i_period;
                o_reset = i_hold;
            end
            default: begin
                o_reset = 1'b1;
            end
        endcase
    end

endmodule