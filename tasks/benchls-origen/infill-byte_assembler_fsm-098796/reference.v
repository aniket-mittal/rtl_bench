module origen_098796 (
    input wire clk,
    input wire reset_n,
    input wire data_in,
    input wire data_en,
    output reg byte_assembled,
    output reg [7:0] data_out
);

    // FSM states
    localparam NOT_ASSEMBLED = 1'b0;
    localparam ASSEMBLED = 1'b1;

    reg state, next_state;

    // State transition logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            state <= NOT_ASSEMBLED;
        else
            state <= next_state;
    end

    // Next state and output logic
    always @(*) begin
        case (state)
            NOT_ASSEMBLED: begin
                byte_assembled = 1'b0;
                if (data_en)
                    next_state = NOT_ASSEMBLED;
                else
                    next_state = ASSEMBLED;
            end
            ASSEMBLED: begin
                byte_assembled = 1'b1;
                if (data_en)
                    next_state = NOT_ASSEMBLED;
                else
                    next_state = ASSEMBLED;
            end
            default: begin
                byte_assembled = 1'b0;
                next_state = NOT_ASSEMBLED;
            end
        endcase
    end

    // Shift register logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            data_out <= 8'b0;
        else if (state == NOT_ASSEMBLED && data_en)
            data_out <= {data_out[6:0], data_in};
    end

endmodule