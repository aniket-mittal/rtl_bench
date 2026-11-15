module origen_180012(
    input clk,
    input [7:0] data,
    input released,
    output reg motor1,
    output reg motor2,
    output reg motor3
);

    reg [39:0] counter;
    reg onesecclk;
    reg [7:0] secclk;

    initial begin
        motor1 = 1;
        motor2 = 1;
        motor3 = 1;
    end

    always @(posedge clk) begin
        counter <= counter + 1;
        if (counter == 2_700_000) begin
            counter <= 0;
            onesecclk <= ~onesecclk;
            secclk <= secclk + 1;
        end
    end

    always @(posedge onesecclk) begin
        if (released) begin
            if (secclk >= 10 && secclk < 20) begin
                motor1 <= 0;
            end else if (secclk >= 30 && secclk < 40) begin
                motor1 <= 0;
            end else if (secclk >= 50 && secclk < 60) begin
                motor1 <= 0;
            end else begin
                motor1 <= 1;
            end
        end else begin
            if (data == 8'h1D) begin
                motor1 <= 0;
            end else if (data == 8'h15) begin
                motor1 <= 0;
                motor2 <= 0;
                motor3 <= 0;
            end else begin
                motor1 <= 1;
                motor2 <= 1;
                motor3 <= 1;
            end
        end
    end

endmodule