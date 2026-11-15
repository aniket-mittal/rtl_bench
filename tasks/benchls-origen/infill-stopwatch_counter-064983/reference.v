module origen_064983 (
    input wire reset,
    input wire startStop,
    input wire clock,
    output reg [7:0] seconds,
    output reg [7:0] minutes,
    output reg [7:0] hours
);

    parameter secondReference = 25_175_000;

    reg keepCounting;
    reg [24:0] counter;
    reg startStop_prev;

    always @(posedge clock or negedge reset) begin
        if (!reset) begin
            seconds <= 8'd0;
            minutes <= 8'd0;
            hours <= 8'd0;
            counter <= 25'd0;
            keepCounting <= 1'b0;
            startStop_prev <= 1'b0;
        end else begin
            startStop_prev <= startStop;
            
            if (startStop && !startStop_prev) begin
                keepCounting <= ~keepCounting;
            end

            if (keepCounting) begin
                if (counter == secondReference - 1) begin
                    counter <= 25'd0;
                    if (seconds == 8'd59) begin
                        seconds <= 8'd0;
                        if (minutes == 8'd59) begin
                            minutes <= 8'd0;
                            if (hours == 8'd99) begin
                                hours <= 8'd0;
                            end else begin
                                hours <= hours + 1'b1;
                            end
                        end else begin
                            minutes <= minutes + 1'b1;
                        end
                    end else begin
                        seconds <= seconds + 1'b1;
                    end
                end else begin
                    counter <= counter + 1'b1;
                end
            end
        end
    end

endmodule