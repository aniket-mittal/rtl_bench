module origen_128096 #(
    parameter TIMEOUT = 100
) (
    input wire clk,
    input wire rst,
    input wire up_req,
    input wire up_ack,
    output reg up_grant,
    output reg down_req,
    input wire down_grant,
    output reg down_ack,
    output reg timeout
);

    reg [31:0] counter;
    reg timer_running;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            timer_running <= 0;
            up_grant <= 0;
            down_req <= 0;
            down_ack <= 0;
            timeout <= 0;
        end else begin
            if (up_req && !timer_running) begin
                down_req <= 1;
                up_grant <= 0;
            end

            if (down_grant && !timer_running) begin
                timer_running <= 1;
                counter <= 0;
            end

            if (timer_running) begin
                if (counter == TIMEOUT - 1) begin
                    timeout <= 1;
                    timer_running <= 0;
                    down_req <= 0;
                    up_grant <= 0;
                end else begin
                    counter <= counter + 1;
                end
            end

            if (timeout && up_ack) begin
                timeout <= 0;
            end

            up_grant <= down_grant;
            down_ack <= up_ack;
        end
    end

endmodule