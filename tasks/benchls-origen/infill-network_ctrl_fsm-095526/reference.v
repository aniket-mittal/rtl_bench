module origen_095526 (
    input wire clk,
    input wire rst_n,
    input wire network_start,
    input wire network_done,
    input wire outputs_done,
    output reg done,
    output reg network_en,
    output reg output_counter_en
);

    // State encoding
    localparam IDLE_STATE = 2'b00;
    localparam NETWORK_STATE = 2'b01;
    localparam OUTPUT_STORE_STATE = 2'b10;

    reg [1:0] current_state, next_state;

    // State registration
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= IDLE_STATE;
        else
            current_state <= next_state;
    end

    // Next state and output logic
    always @(*) begin
        // Default values
        next_state = current_state;
        done = 1'b0;
        network_en = 1'b0;
        output_counter_en = 1'b0;

        case (current_state)
            IDLE_STATE: begin
                done = 1'b1;
                if (network_start)
                    next_state = NETWORK_STATE;
            end

            NETWORK_STATE: begin
                network_en = 1'b1;
                if (network_done)
                    next_state = OUTPUT_STORE_STATE;
            end

            OUTPUT_STORE_STATE: begin
                output_counter_en = 1'b1;
                if (outputs_done)
                    next_state = IDLE_STATE;
            end

            default: next_state = IDLE_STATE;
        endcase
    end

endmodule