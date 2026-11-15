module origen_065824 (
    input CLK_1Hz,
    input reset,
    input select_enable,
    input [2:0] select,
    input [3:0] num,
    input change1, change2, change3,
    output reg [3:0] second_d, second_g,
    output reg [3:0] minute_d, minute_g,
    output reg [3:0] hour_d, hour_g
);

reg [3:0] second_d_next, second_g_next;
reg [3:0] minute_d_next, minute_g_next;
reg [3:0] hour_d_next, hour_g_next;
reg cout_s, cout_m;
reg format_24;

always @(posedge CLK_1Hz or negedge reset) begin
    if (!reset) begin
        {hour_g, hour_d, minute_g, minute_d, second_g, second_d} <= 24'h015905;
        format_24 <= 1'b1;
    end else begin
        second_d <= second_d_next;
        second_g <= second_g_next;
        minute_d <= minute_d_next;
        minute_g <= minute_g_next;
        hour_d <= hour_d_next;
        hour_g <= hour_g_next;
        
        if (change2) format_24 <= ~format_24;
    end
end

always @(*) begin
    {second_d_next, second_g_next} = {second_g, second_d};
    {minute_d_next, minute_g_next} = {minute_g, minute_d};
    {hour_d_next, hour_g_next} = {hour_g, hour_d};
    cout_s = 1'b0;
    cout_m = 1'b0;

    // Seconds
    if (second_d == 4'd9) begin
        second_d_next = 4'd0;
        if (second_g == 4'd5) begin
            second_g_next = 4'd0;
            cout_s = 1'b1;
        end else begin
            second_g_next = second_g + 1;
        end
    end else begin
        second_d_next = second_d + 1;
    end

    // Minutes
    if (cout_s) begin
        if (minute_d == 4'd9) begin
            minute_d_next = 4'd0;
            if (minute_g == 4'd5) begin
                minute_g_next = 4'd0;
                cout_m = 1'b1;
            end else begin
                minute_g_next = minute_g + 1;
            end
        end else begin
            minute_d_next = minute_d + 1;
        end
    end

    // Hours
    if (cout_m) begin
        if (format_24) begin
            if ({hour_g, hour_d} == 8'h23) begin
                hour_g_next = 4'd0;
                hour_d_next = 4'd0;
            end else if (hour_d == 4'd9) begin
                hour_d_next = 4'd0;
                hour_g_next = hour_g + 1;
            end else begin
                hour_d_next = hour_d + 1;
            end
        end else begin
            if ({hour_g, hour_d} == 8'h12) begin
                hour_g_next = 4'd0;
                hour_d_next = 4'd1;
            end else if (hour_d == 4'd9) begin
                hour_d_next = 4'd0;
                hour_g_next = hour_g + 1;
            end else begin
                hour_d_next = hour_d + 1;
            end
        end
    end

    // Time setting
    if (select_enable) begin
        case (select)
            3'd0: second_d_next = num;
            3'd1: second_g_next = num;
            3'd2: minute_d_next = num;
            3'd3: minute_g_next = num;
            3'd4: hour_d_next = num;
            3'd5: hour_g_next = num;
        endcase
    end

    // Time adjustment
    if (change1) begin
        if (format_24) begin
            if ({hour_g, hour_d} <= 8'h01) begin
                hour_g_next = 4'd2;
                hour_d_next = 4'd3;
            end else begin
                {hour_g_next, hour_d_next} = {hour_g, hour_d} - 2;
            end
        end else begin
            if ({hour_g, hour_d} <= 8'h02) begin
                hour_g_next = 4'd1;
                hour_d_next = 4'd2;
            end else begin
                {hour_g_next, hour_d_next} = {hour_g, hour_d} - 2;
            end
        end
    end

    if (change3) begin
        if (format_24) begin
            if ({hour_g, hour_d} >= 8'h22) begin
                hour_g_next = 4'd0;
                hour_d_next = ({hour_g, hour_d} == 8'h22) ? 4'd0 : 4'd1;
            end else begin
                {hour_g_next, hour_d_next} = {hour_g, hour_d} + 2;
            end
        end else begin
            if ({hour_g, hour_d} >= 8'h11) begin
                hour_g_next = 4'd0;
                hour_d_next = ({hour_g, hour_d} == 8'h11) ? 4'd1 : 4'd2;
            end else begin
                {hour_g_next, hour_d_next} = {hour_g, hour_d} + 2;
            end
        end
    end
end

endmodule