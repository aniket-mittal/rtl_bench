module origen_105895 (
    input  wire i_clk,
    input  wire i_reset,
    input  wire i_done,
    input  wire i_go,
    output reg  o_reg_ld,
    output reg  o_start
);

    // State encoding
    parameter S_WAIT  = 2'b00;
    parameter S_READY = 2'b01;
    parameter S_LOAD  = 2'b10;
    parameter S_START = 2'b11;

    reg [1:0] current_state, next_state;

    // State register
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset)
            current_state <= S_WAIT;
        else
            current_state <= next_state;
    end

    // Next state and output logic
    always @(*) begin
        // Default values
        next_state = current_state;
        o_reg_ld = 1'b0;
        o_start = 1'b0;

        case (current_state)
            S_WAIT: begin
                if (i_done)
                    next_state = S_READY;
            end

            S_READY: begin
                if (i_go)
                    next_state = S_LOAD;
            end

            S_LOAD: begin
                o_reg_ld = 1'b1;
                next_state = S_START;
            end

            S_START: begin
                o_start = 1'b1;
                next_state = S_WAIT;
            end

            default: next_state = S_WAIT;
        endcase
    end

endmodule