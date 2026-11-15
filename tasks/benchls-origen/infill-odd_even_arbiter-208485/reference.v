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

    always @(send0, send1) begin
        if (polarity) begin
            ready0 = !odd_even_full[0];
            ready1 = !odd_even_full[1];
        end
        else begin
            ready0 = !odd_even_full[1];
            ready1 = !odd_even_full[0];
        end

        if (ready_out) begin
            if (polarity) begin
                if (odd_even_full[0] && !odd_even_full[1]) begin
                    send_out = 1;
                    buffer_enable_even = 0;
                    buffer_enable_odd = 1;
                    cap_mux = 0;
                end
                else if (!odd_even_full[0] && odd_even_full[1]) begin
                    send_out = 1;
                    buffer_enable_even = 1;
                    buffer_enable_odd = 0;
                    cap_mux = 1;
                end
                else begin
                    send_out = 0;
                    buffer_enable_even = 0;
                    buffer_enable_odd = 0;
                    cap_mux = 0;
                end
            end
            else begin
                if (odd_even_full[1] && !odd_even_full[0]) begin
                    send_out = 1;
                    buffer_enable_even = 1;
                    buffer_enable_odd = 0;
                    cap_mux = 1;
                end
                else if (!odd_even_full[1] && odd_even_full[0]) begin
                    send_out = 1;
                    buffer_enable_even = 0;
                    buffer_enable_odd = 1;
                    cap_mux = 0;
                end
                else begin
                    send_out = 0;
                    buffer_enable_even = 0;
                    buffer_enable_odd = 0;
                    cap_mux = 0;
                end
            end
        end
        else begin
            send_out = 0;
            buffer_enable_even = 0;
            buffer_enable_odd = 0;
            cap_mux = 0;
        end
    end

endmodule