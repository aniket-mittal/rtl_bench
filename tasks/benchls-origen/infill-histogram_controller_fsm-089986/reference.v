module origen_089986 (
    input wire clock,
    input wire reset,
    input wire start_histogram,
    input wire input_memory_read_finished,
    input wire all_pixel_written,
    input wire all_lines_written,
    output reg set_read_address_input_mem,
    output reg set_read_address_scratch_mem,
    output reg set_write_address_scratch_mem,
    output reg shift_scratch_memory_rw_address,
    output reg read_data_ready_input_mem,
    output reg histogram_computation_done,
    output reg extra_writes_en,
    output reg read_data_ready_scratch_mem
);

    // State encoding
    localparam S0 = 4'd0, S1 = 4'd1, S2 = 4'd2, S3 = 4'd3, S4 = 4'd4,
               S5 = 4'd5, S6 = 4'd6, S7 = 4'd7, S8 = 4'd8, S9 = 4'd9,
               S10 = 4'd10, S11 = 4'd11;

    reg [3:0] current_state, next_state;

    // State transition logic
    always @(posedge clock or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next state and output logic
    always @(*) begin
        // Default output values
        set_read_address_input_mem = 1'b0;
        set_read_address_scratch_mem = 1'b0;
        set_write_address_scratch_mem = 1'b0;
        shift_scratch_memory_rw_address = 1'b0;
        read_data_ready_input_mem = 1'b0;
        histogram_computation_done = 1'b0;
        extra_writes_en = 1'b0;
        read_data_ready_scratch_mem = 1'b0;

        case (current_state)
            S0: begin
                if (start_histogram)
                    next_state = S1;
                else
                    next_state = S0;
            end
            S1: begin
                set_read_address_input_mem = 1'b1;
                next_state = S2;
            end
            S2: begin
                next_state = S3;
            end
            S3: begin
                read_data_ready_input_mem = 1'b1;
                next_state = S4;
            end
            S4: begin
                if (input_memory_read_finished)
                    next_state = S5;
                else
                    next_state = S1;
            end
            S5: begin
                set_read_address_scratch_mem = 1'b1;
                next_state = S6;
            end
            S6: begin
                next_state = S7;
            end
            S7: begin
                read_data_ready_scratch_mem = 1'b1;
                next_state = S8;
            end
            S8: begin
                set_write_address_scratch_mem = 1'b1;
                next_state = S9;
            end
            S9: begin
                next_state = S10;
            end
            S10: begin
                shift_scratch_memory_rw_address = 1'b1;
                if (all_pixel_written)
                    next_state = S11;
                else
                    next_state = S5;
            end
            S11: begin
                extra_writes_en = 1'b1;
                if (all_lines_written) begin
                    histogram_computation_done = 1'b1;
                    next_state = S0;
                end else
                    next_state = S1;
            end
            default: next_state = S0; // Error handling for invalid states
        endcase
    end

endmodule