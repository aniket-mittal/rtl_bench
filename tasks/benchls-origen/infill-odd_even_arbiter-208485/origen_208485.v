module origen_208485(
    input clk,
    input reset,
    input polarity,
    input send0,
    input send1,
    input ready_out,
    output reg ready0,
    output reg ready1,
    output reg send_out,
    output reg buffer_enable_even,
    output reg buffer_enable_odd,
    output reg cap_mux
);

    reg previous_grant;
    reg [1:0] odd_even_full;
    reg q_ready0, q_ready1;

    always @(posedge clk) begin
        if (reset) begin
            previous_grant <= 0;
            odd_even_full <= 0;
            q_ready0 <= 0;
            q_ready1 <= 0;
        end
        else begin
            q_ready0 <= send0;
            q_ready1 <= send1;

            if (send_out) begin
                odd_even_full <= odd_even_full - 1;
            end
            else if (send0 || send1) begin
                odd_even_full <= odd_even_full + 1;
            end

            if (send_out && previous_grant) begin
                previous_grant <= 0;
            end
            else if (send_out && !previous_grant) begin
                previous_grant <= 1;
            end
        end
    end

    [MASKED]

endmodule