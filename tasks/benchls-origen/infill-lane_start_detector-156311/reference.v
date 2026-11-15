module origen_156311 #(
    parameter N_BLOCKS = 10,
    parameter EXTRA_DELAY = 0
) (
    input i_clock,
    input i_reset,
    input i_enable,
    input i_valid,
    input i_restart,
    output reg o_start_of_lane
);

    reg [31:0] counter;
    reg state;
    localparam INIT = 1'b0, LOCKED = 1'b1;

    always @(posedge i_clock) begin
        if (i_reset || i_restart) begin
            counter <= 0;
            state <= INIT;
        end
        else if (i_enable && i_valid) begin
            if (state == INIT) begin
                if (counter == N_BLOCKS - EXTRA_DELAY - 1) begin
                    o_start_of_lane <= 1'b1;
                    counter <= 0;
                    state <= LOCKED;
                end
                else begin
                    o_start_of_lane <= 1'b0;
                    counter <= counter + 1;
                end
            end
            else if (state == LOCKED) begin
                if (counter == N_BLOCKS - 1) begin
                    o_start_of_lane <= 1'b1;
                    counter <= 0;
                end
                else begin
                    o_start_of_lane <= 1'b0;
                    counter <= counter + 1;
                end
            end
        end
        else begin
            o_start_of_lane <= 1'b0;
            counter <= 0;
            state <= INIT;
        end
    end

endmodule