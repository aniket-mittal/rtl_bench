module rtlpp_02577 (
    input clk,
    input rst_n,
    input [7:0] hours,
    input [7:0] minutes,
    input [7:0] seconds,
    input [5:0] sel_in,
    output reg [7:0] hour,
    output reg [7:0] minute,
    output reg [7:0] second,
    output reg [5:0] sel_out
);

    reg [7:0] hours_latch;
    reg [7:0] minutes_latch;
    reg [7:0] seconds_latch;

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            hour <= 8'b0001_0101;
            hours_latch <= 8'd15;
        end else if(hours_latch != hours) begin
            hours_latch = hours;
            hour = {5'b00000, hours[4], hours[3], hours[2]};
            if(hour[3:0] > 4'd4) begin
                hour = hour + 8'b0000_0011;
            end

            hour = {hour[6:0], hours[1]};
            if(hour[3:0] > 4'd4) begin
                hour = hour + 8'b0000_0011;
            end

            hour = {hour[6:0], hours[0]};
            if(hour[3:0] > 4'd4) begin
                hour = hour + 8'b0000_0011;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            minute <= 8'b0101_0111;
            minutes_latch <= 8'd57;
        end else if(minutes_latch != minutes) begin
            minutes_latch = minutes;
            minute = {5'b00000, minutes[5], minutes[4], minutes[3]};
            if(minute[3:0] > 4'd4) begin
                minute = minute + 8'b0000_0011;
            end

            minute = {minute[6:0], minutes[2]};
            if(minute[3:0] > 4'd4) begin
                minute = minute + 8'b0000_0011;
            end

            minute = {minute[6:0], minutes[1]};
            if(minute[3:0] > 4'd4) begin
                minute = minute + 8'b0000_0011;
            end

            minute = {minute[6:0], minutes[0]};
            if(minute[3:0] > 4'd4) begin
                minute = minute + 8'b0000_0011;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            second <= 8'b0011_0100;
            seconds_latch <= 8'd34;
        end else if(seconds_latch != seconds) begin
            seconds_latch = seconds;
            second = {5'b00000, seconds[5], seconds[4], seconds[3]};
            if(second[3:0] > 4'd4) begin
                second = second + 8'b0000_0011;
            end

            second = {second[6:0], seconds[2]};
            if(second[3:0] > 4'd4) begin
                second = second + 8'b0000_0011;
            end

            second = {second[6:0], seconds[1]};
            if(second[3:0] > 4'd4) begin
                second = second + 8'b0000_0011;
            end

            second = {second[6:0], seconds[0]};
            if(second[3:0] > 4'd4) begin
                second = second + 8'b0000_0011;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            sel_out <= 6'd0;
        end else begin
            sel_out <= sel_in;
        end
    end

endmodule