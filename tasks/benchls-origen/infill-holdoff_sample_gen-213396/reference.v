module origen_213396 (
    input clk,
    input rst,
    input if1a_ready_in,
    output reg if1a_valid_out,
    output reg [9:0] if1a_counter_out
);

    // Parameters
    parameter HOLDOFF = 20;
    parameter DISTANCE = 6;

    // Registers
    reg [7:0] holdoff_counter;
    reg [3:0] distance_counter;
    reg valid;

    // Combinational logic
    wire holdoff_counting = (holdoff_counter != 0);
    wire distance_restart = (distance_counter == DISTANCE);

    // Sequential logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            holdoff_counter <= HOLDOFF;
            distance_counter <= 0;
            valid <= 0;
            if1a_counter_out <= {10{1'b1}};
        end
        else begin
            // Holdoff counter
            if (holdoff_counting)
                holdoff_counter <= holdoff_counter - 1;

            // Distance counter
            if (holdoff_counting)
                distance_counter <= 0;
            else if (if1a_ready_in)
                distance_counter <= (distance_counter == DISTANCE) ? 0 : distance_counter + 1;

            // Valid output generation
            if (if1a_ready_in && distance_restart && !holdoff_counting)
                valid <= 1;
            else
                valid <= 0;

            // Counter value generation
            if (if1a_ready_in && distance_restart && !holdoff_counting)
                if1a_counter_out <= if1a_counter_out + 1;
            else
                if1a_counter_out <= {10{1'bx}};
        end
    end

    // Output assignments
    assign if1a_valid_out = valid;

endmodule