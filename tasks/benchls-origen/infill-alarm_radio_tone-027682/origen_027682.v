module origen_027682(
    input clk,
    input rst_n,
    input [3:0] minute1, minute0, second1, second0,
    output reg alarm_radio
);

    parameter T1MS = 50000;
    parameter T500US = 25000;

    reg [15:0] C1, C2;
    reg F500HZ, F1KHZ;

    // Clock division
    [MASKED]

    // Alarm logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            alarm_radio <= 1'b0;
        end else begin
            if (minute1 == 4'd5 && minute0 == 4'd9 && second1 == 4'd5 && (second0 == 4'd6 || second0 == 4'd8)) begin
                alarm_radio <= F500HZ;
            end else if (minute1 == 4'd0 && minute0 == 4'd0 && second1 == 4'd0 && second0 == 4'd0) begin
                alarm_radio <= F1KHZ;
            end else begin
                alarm_radio <= 1'b0;
            end
        end
    end

endmodule